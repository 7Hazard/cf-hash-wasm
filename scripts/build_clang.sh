#!/bin/bash

set -e

clang --version
wasm-ld --version

CFLAGS="-flto -O3 -nostdlib -fno-builtin --target=wasm32"
LDFLAGS="-Wl,--strip-all -Wl,--initial-memory=262144 -Wl,--max-memory=262144 -Wl,--no-entry -Wl,--allow-undefined -Wl,--compress-relocations -Wl,--export-dynamic"

path=$1
if [ -z "$1" ]
  then
    path="./"
fi

# -msimd128 -msign-ext -mmutable-globals -mmultivalue -mbulk-memory -mtail-call -munimplemented-simd128
# -g -fdebug-prefix-map=$path/src=/C:/Projects/hash-wasm/src

clang ${CFLAGS} ${LDFLAGS} -Wl,--max-memory=2147483648 -o $path/dist/wasm/argon2.wasm $path/src/argon2.c
sha1sum $path/dist/wasm/argon2.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/argon2.wasm

clang ${CFLAGS} ${LDFLAGS} -fno-strict-aliasing -o $path/dist/wasm/bcrypt.wasm $path/src/bcrypt.c
sha1sum $path/dist/wasm/bcrypt.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/bcrypt.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/blake2b.wasm $path/src/blake2b.c
sha1sum $path/dist/wasm/blake2b.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/blake2b.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/blake2s.wasm $path/src/blake2s.c
sha1sum $path/dist/wasm/blake2s.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/blake2s.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/crc32.wasm $path/src/crc32.c
sha1sum $path/dist/wasm/crc32.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/crc32.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/md4.wasm $path/src/md4.c
sha1sum $path/dist/wasm/md4.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/md4.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/md5.wasm $path/src/md5.c
sha1sum $path/dist/wasm/md5.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/md5.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/ripemd160.wasm $path/src/ripemd160.c
sha1sum $path/dist/wasm/ripemd160.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/ripemd160.wasm

clang ${CFLAGS} ${LDFLAGS} -Wl,--max-memory=2147483648 -o $path/dist/wasm/scrypt.wasm $path/src/scrypt.c
sha1sum $path/dist/wasm/scrypt.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/scrypt.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/sha1.wasm $path/src/sha1.c
sha1sum $path/dist/wasm/sha1.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/sha1.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/sha256.wasm $path/src/sha256.c
sha1sum $path/dist/wasm/sha256.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/sha256.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/sha512.wasm $path/src/sha512.c
sha1sum $path/dist/wasm/sha512.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/sha512.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/sha3.wasm $path/src/sha3.c
sha1sum $path/dist/wasm/sha3.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/sha3.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/sm3.wasm $path/src/sm3.c
sha1sum $path/dist/wasm/sm3.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/sm3.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/whirlpool.wasm $path/src/whirlpool.c
sha1sum $path/dist/wasm/whirlpool.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/whirlpool.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/xxhash32.wasm $path/src/xxhash32.c
sha1sum $path/dist/wasm/xxhash32.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/xxhash32.wasm

clang ${CFLAGS} ${LDFLAGS} -o $path/dist/wasm/xxhash64.wasm $path/src/xxhash64.c
sha1sum $path/dist/wasm/xxhash64.wasm
stat -c "%n size: %s bytes" $path/dist/wasm/xxhash64.wasm
