#!/bin/bash

set -e

clang --version
wasm-ld --version

CFLAGS="-flto -O3 -nostdlib -fno-builtin --target=wasm32"
LDFLAGS="-Wl,--strip-all -Wl,--initial-memory=262144 -Wl,--max-memory=262144 -Wl,--no-entry -Wl,--allow-undefined -Wl,--compress-relocations -Wl,--export-dynamic"

# -msimd128 -msign-ext -mmutable-globals -mmultivalue -mbulk-memory -mtail-call -munimplemented-simd128
# -g -fdebug-prefix-map=/app/src=/C:/Projects/hash-wasm/src

clang ${CFLAGS} ${LDFLAGS} -Wl,--max-memory=2147483648 -o /app/dist/wasm/argon2.wasm /app/src/argon2.c
sha1sum /app/dist/wasm/argon2.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/argon2.wasm

clang ${CFLAGS} ${LDFLAGS} -fno-strict-aliasing -o /app/dist/wasm/bcrypt.wasm /app/src/bcrypt.c
sha1sum /app/dist/wasm/bcrypt.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/bcrypt.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/blake2b.wasm /app/src/blake2b.c
sha1sum /app/dist/wasm/blake2b.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/blake2b.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/blake2s.wasm /app/src/blake2s.c
sha1sum /app/dist/wasm/blake2s.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/blake2s.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/crc32.wasm /app/src/crc32.c
sha1sum /app/dist/wasm/crc32.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/crc32.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/md4.wasm /app/src/md4.c
sha1sum /app/dist/wasm/md4.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/md4.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/md5.wasm /app/src/md5.c
sha1sum /app/dist/wasm/md5.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/md5.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/ripemd160.wasm /app/src/ripemd160.c
sha1sum /app/dist/wasm/ripemd160.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/ripemd160.wasm

clang ${CFLAGS} ${LDFLAGS} -Wl,--max-memory=2147483648 -o /app/dist/wasm/scrypt.wasm /app/src/scrypt.c
sha1sum /app/dist/wasm/scrypt.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/scrypt.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/sha1.wasm /app/src/sha1.c
sha1sum /app/dist/wasm/sha1.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/sha1.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/sha256.wasm /app/src/sha256.c
sha1sum /app/dist/wasm/sha256.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/sha256.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/sha512.wasm /app/src/sha512.c
sha1sum /app/dist/wasm/sha512.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/sha512.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/sha3.wasm /app/src/sha3.c
sha1sum /app/dist/wasm/sha3.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/sha3.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/sm3.wasm /app/src/sm3.c
sha1sum /app/dist/wasm/sm3.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/sm3.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/whirlpool.wasm /app/src/whirlpool.c
sha1sum /app/dist/wasm/whirlpool.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/whirlpool.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/xxhash32.wasm /app/src/xxhash32.c
sha1sum /app/dist/wasm/xxhash32.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/xxhash32.wasm

clang ${CFLAGS} ${LDFLAGS} -o /app/dist/wasm/xxhash64.wasm /app/src/xxhash64.c
sha1sum /app/dist/wasm/xxhash64.wasm
stat -c "%n size: %s bytes" /app/dist/wasm/xxhash64.wasm
