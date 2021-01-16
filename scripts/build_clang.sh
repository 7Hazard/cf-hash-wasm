#!/bin/bash

mkdir -p dist
mkdir -p dist/wasm

set -e

clang --version
wasm-ld --version

CFLAGS="-flto -O3 -nostdlib -fno-builtin --target=wasm32"
LDFLAGS="-Wl,--strip-all -Wl,--initial-memory=262144 -Wl,--max-memory=262144 -Wl,--no-entry -Wl,--allow-undefined -Wl,--compress-relocations -Wl,--export-dynamic"

# -msimd128 -msign-ext -mmutable-globals -mmultivalue -mbulk-memory -mtail-call -munimplemented-simd128
# -g -fdebug-prefix-map=./src=/C:/Projects/hash-wasm/src

clang ${CFLAGS} ${LDFLAGS} -Wl,--max-memory=2147483648 -o ./dist/wasm/argon2.wasm ./src/argon2.c
sha1sum ./dist/wasm/argon2.wasm
stat -c "%n size: %s bytes" ./dist/wasm/argon2.wasm

clang ${CFLAGS} ${LDFLAGS} -fno-strict-aliasing -o ./dist/wasm/bcrypt.wasm ./src/bcrypt.c
sha1sum ./dist/wasm/bcrypt.wasm
stat -c "%n size: %s bytes" ./dist/wasm/bcrypt.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/blake2b.wasm ./src/blake2b.c
sha1sum ./dist/wasm/blake2b.wasm
stat -c "%n size: %s bytes" ./dist/wasm/blake2b.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/blake2s.wasm ./src/blake2s.c
sha1sum ./dist/wasm/blake2s.wasm
stat -c "%n size: %s bytes" ./dist/wasm/blake2s.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/crc32.wasm ./src/crc32.c
sha1sum ./dist/wasm/crc32.wasm
stat -c "%n size: %s bytes" ./dist/wasm/crc32.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/md4.wasm ./src/md4.c
sha1sum ./dist/wasm/md4.wasm
stat -c "%n size: %s bytes" ./dist/wasm/md4.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/md5.wasm ./src/md5.c
sha1sum ./dist/wasm/md5.wasm
stat -c "%n size: %s bytes" ./dist/wasm/md5.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/ripemd160.wasm ./src/ripemd160.c
sha1sum ./dist/wasm/ripemd160.wasm
stat -c "%n size: %s bytes" ./dist/wasm/ripemd160.wasm

clang ${CFLAGS} ${LDFLAGS} -Wl,--max-memory=2147483648 -o ./dist/wasm/scrypt.wasm ./src/scrypt.c
sha1sum ./dist/wasm/scrypt.wasm
stat -c "%n size: %s bytes" ./dist/wasm/scrypt.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/sha1.wasm ./src/sha1.c
sha1sum ./dist/wasm/sha1.wasm
stat -c "%n size: %s bytes" ./dist/wasm/sha1.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/sha256.wasm ./src/sha256.c
sha1sum ./dist/wasm/sha256.wasm
stat -c "%n size: %s bytes" ./dist/wasm/sha256.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/sha512.wasm ./src/sha512.c
sha1sum ./dist/wasm/sha512.wasm
stat -c "%n size: %s bytes" ./dist/wasm/sha512.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/sha3.wasm ./src/sha3.c
sha1sum ./dist/wasm/sha3.wasm
stat -c "%n size: %s bytes" ./dist/wasm/sha3.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/sm3.wasm ./src/sm3.c
sha1sum ./dist/wasm/sm3.wasm
stat -c "%n size: %s bytes" ./dist/wasm/sm3.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/whirlpool.wasm ./src/whirlpool.c
sha1sum ./dist/wasm/whirlpool.wasm
stat -c "%n size: %s bytes" ./dist/wasm/whirlpool.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/xxhash32.wasm ./src/xxhash32.c
sha1sum ./dist/wasm/xxhash32.wasm
stat -c "%n size: %s bytes" ./dist/wasm/xxhash32.wasm

clang ${CFLAGS} ${LDFLAGS} -o ./dist/wasm/xxhash64.wasm ./src/xxhash64.c
sha1sum ./dist/wasm/xxhash64.wasm
stat -c "%n size: %s bytes" ./dist/wasm/xxhash64.wasm
