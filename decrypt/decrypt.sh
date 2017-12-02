#!/bin/bash

set -e

read -p "Source file [EnMicroMsg.db]:" src_file

if [ "$src_file" == "" ]; then
    src_file="EnMicroMsg.db"
fi

read -p "Decrypted file [$src_file.decrypted.db]:" out_file

if [ "$out_file" == "" ]; then
    out_file="$src_file.decrypted.db"
fi

read -p "Password:" pwd

read -p "KdfIteration [4000]:" kdfIter

if [ "$kdfIter" == "" ]; then
    kdfIter="4000"
fi

read -p "Hmac [OFF]:" hmac

if [ "$hmac" == "" ]; then
    hmac="OFF"
fi

read -p "Page Size [1024]:" psize

if [ "$psize" == "" ]; then
    psize="1024"
fi

if [ ! -f "sqlcipher/sqlcipher" ]; then
    cd sqlcipher
    git submodule update --init

    ./configure --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC" \
        LDFLAGS="-lcrypto"
    make
    cd ..
fi

chmod +x sqlcipher/sqlcipher

echo "PRAGMA cipher_default_kdf_iter = 4000;
    PRAGMA key = '$pwd';
    PRAGMA cipher_use_hmac = $hmac;
    PRAGMA cipher_page_size = $psize;
    ATTACH DATABASE '$out_file' AS plaintext KEY '';
    SELECT sqlcipher_export('plaintext');
    DETACH DATABASE plaintext;" | ./sqlcipher/sqlcipher $src_file 

echo "$out_file created."

set +e
