import { WASMInterface, IWASMInterface, IHasher } from './WASMInterface';
import Mutex from './mutex';

try {
  // @ts-ignore
  var wasmModule = sha512_WASM_MODULE
} catch {
  var wasmModule = undefined
}

import lockedCreate from './lockedCreate';
import { IDataType } from './util';

const mutex = new Mutex();
let wasmCache: IWASMInterface = null;

/**
 * Calculates SHA-2 (SHA-384) hash
 * @param data Input data (string, Buffer or TypedArray)
 * @returns Computed hash as a hexadecimal string
 */
export function sha384(data: IDataType): Promise<string> {
  if (wasmCache === null) {
    return lockedCreate(mutex, wasmModule, 48)
      .then((wasm) => {
        wasmCache = wasm;
        return wasmCache.calculate(data, 384);
      });
  }

  try {
    const hash = wasmCache.calculate(data, 384);
    return Promise.resolve(hash);
  } catch (err) {
    return Promise.reject(err);
  }
}

/**
 * Creates a new SHA-2 (SHA-384) hash instance
 */
export function createSHA384(): Promise<IHasher> {
  return WASMInterface(wasmModule, 48).then((wasm) => {
    wasm.init(384);
    const obj: IHasher = {
      init: () => { wasm.init(384); return obj; },
      update: (data) => { wasm.update(data); return obj; },
      digest: (outputType) => wasm.digest(outputType) as any,
      blockSize: 128,
      digestSize: 48,
    };
    return obj;
  });
}
