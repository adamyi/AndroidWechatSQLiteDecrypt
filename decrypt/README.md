## Decryption

Wechat uses customized parameters for encryption now, so standard SQLite viewers
(including default sqlcipher script without customized parameters) won't work.

This script calls Tencent's fork of
[SQLCipher](https://github.com/Tencent/SQLCipher) with WeChat's customized encryption
parameters to decrypt WeChat's SQLite files.

Please provide the encryption password when prompted (could be retrieved with the
Android hook). Other parameters are already set in this script, but could be manually
changed if Tencent changes those parameters.

To start, just call

```
./decrypt.sh
```
