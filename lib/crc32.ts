import { WASMInterface, IWASMInterface, IHasher } from './WASMInterface';
import Mutex from './mutex';

try {
  // @ts-ignore
  var wasmModule = crc32_WASM_MODULE
} catch {
  var wasmModule = undefined
}

import lockedCreate from './lockedCreate';
import { IDataType } from './util';

const mutex = new Mutex();
let wasmCache: IWASMInterface = null;

/**
 * Calculates CRC-32 hash
 * @param data Input data (string, Buffer or TypedArray)
 * @returns Computed hash as a hexadecimal string
 */
export function crc32(data: IDataType): Promise<string> {
  if (wasmCache === null) {
    return lockedCreate(mutex, wasmModule, 4)
      .then((wasm) => {
        wasmCache = wasm;
        return wasmCache.calculate(data);
      });
  }

  try {
    const hash = wasmCache.calculate(data);
    return Promise.resolve(hash);
  } catch (err) {
    return Promise.reject(err);
  }
}

/**
 * Creates a new CRC-32 hash instance
 */
export function createCRC32(): Promise<IHasher> {
  return WASMInterface(wasmModule, 4).then((wasm) => {
    wasm.init();
    const obj: IHasher = {
      init: () => { wasm.init(); return obj; },
      update: (data) => { wasm.update(data); return obj; },
      digest: (outputType) => wasm.digest(outputType) as any,
      blockSize: 4,
      digestSize: 4,
    };
    return obj;
  });
}
