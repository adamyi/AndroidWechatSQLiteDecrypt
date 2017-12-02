# WeChatSQLitePasswordHook

This is an Xposed module for Android to hook into WeChat (wcdb) to get SQLite path and SQLCipher key.

## Output
The data will be outputted with logcat. Tested with Android 7.0, Xposed 88.2, Wechat 6.5.16

````
12-02 17:46:39.958 24286 24319 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnMicroMsg.db
12-02 17:46:39.958 24286 24319 I wxSqlPwdHook: Password: [reducted password]
12-02 17:46:39.958 24286 24319 I wxSqlPwdHook: Password (hex): 0x35346636396465
12-02 17:46:39.962 24286 24319 I wxSqlPwdHook: CipherSpec - Cipher: null
12-02 17:46:39.962 24286 24319 I wxSqlPwdHook: CipherSpec - KdfIteration: 4000
12-02 17:46:39.962 24286 24319 I wxSqlPwdHook: CipherSpec - Hmac Enabled: false
12-02 17:46:39.964 24286 24319 I wxSqlPwdHook: CipherSpec - Page Size: 1024
12-02 17:46:39.964 24286 24319 I wxSqlPwdHook: Flags: 805306368
12-02 17:46:39.964 24286 24319 I wxSqlPwdHook: PoolSize: 0
12-02 17:46:40.088 24286 24319 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnMicroMsg.db
12-02 17:46:40.088 24286 24319 I wxSqlPwdHook: Password: [reducted password]
12-02 17:46:40.088 24286 24319 I wxSqlPwdHook: Password (hex): 0x35346636396465
12-02 17:46:40.088 24286 24319 I wxSqlPwdHook: CipherSpec - Cipher: null
12-02 17:46:40.088 24286 24319 I wxSqlPwdHook: CipherSpec - KdfIteration: 4000
12-02 17:46:40.088 24286 24319 I wxSqlPwdHook: CipherSpec - Hmac Enabled: false
12-02 17:46:40.088 24286 24319 I wxSqlPwdHook: CipherSpec - Page Size: 1024
12-02 17:46:40.088 24286 24319 I wxSqlPwdHook: Flags: 805306368
12-02 17:46:40.088 24286 24319 I wxSqlPwdHook: PoolSize: 0
12-02 17:46:40.233 24286 24319 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/CommonOneMicroMsg.db
12-02 17:46:40.386 24286 24319 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/SnsMicroMsg.db
12-02 17:46:40.816 24286 24319 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnResDown.db
12-02 17:46:40.816 24286 24319 I wxSqlPwdHook: Password: [reducted password]
12-02 17:46:40.816 24286 24319 I wxSqlPwdHook: Password (hex): 0x36336230633037
12-02 17:46:40.816 24286 24319 I wxSqlPwdHook: CipherSpec - Cipher: null
12-02 17:46:40.816 24286 24319 I wxSqlPwdHook: CipherSpec - KdfIteration: 4000
12-02 17:46:40.816 24286 24319 I wxSqlPwdHook: CipherSpec - Hmac Enabled: false
12-02 17:46:40.816 24286 24319 I wxSqlPwdHook: CipherSpec - Page Size: 1024
12-02 17:46:40.816 24286 24319 I wxSqlPwdHook: Flags: 805306368
12-02 17:46:40.816 24286 24319 I wxSqlPwdHook: PoolSize: 0
12-02 17:46:41.017 24286 24319 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/enFavorite.db
12-02 17:46:41.017 24286 24319 I wxSqlPwdHook: Password: [reducted password]
12-02 17:46:41.017 24286 24319 I wxSqlPwdHook: Password (hex): 0x35346636396465
12-02 17:46:41.017 24286 24319 I wxSqlPwdHook: CipherSpec - Cipher: null
12-02 17:46:41.017 24286 24319 I wxSqlPwdHook: CipherSpec - KdfIteration: 4000
12-02 17:46:41.017 24286 24319 I wxSqlPwdHook: CipherSpec - Hmac Enabled: false
12-02 17:46:41.017 24286 24319 I wxSqlPwdHook: CipherSpec - Page Size: 1024
12-02 17:46:41.017 24286 24319 I wxSqlPwdHook: Flags: 805306368
12-02 17:46:41.017 24286 24319 I wxSqlPwdHook: PoolSize: 0
12-02 17:46:41.120 24286 24319 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/AppBrandComm.db
12-02 17:46:41.120 24286 24319 I wxSqlPwdHook: Password: [reducted password]
12-02 17:46:41.120 24286 24319 I wxSqlPwdHook: Password (hex): 0x35346636396465
12-02 17:46:41.120 24286 24319 I wxSqlPwdHook: CipherSpec - Cipher: null
12-02 17:46:41.120 24286 24319 I wxSqlPwdHook: CipherSpec - KdfIteration: 4000
12-02 17:46:41.120 24286 24319 I wxSqlPwdHook: CipherSpec - Hmac Enabled: false
12-02 17:46:41.120 24286 24319 I wxSqlPwdHook: CipherSpec - Page Size: 1024
12-02 17:46:41.120 24286 24319 I wxSqlPwdHook: Flags: 805306368
12-02 17:46:41.120 24286 24319 I wxSqlPwdHook: PoolSize: 0
12-02 17:46:41.200 24286 24512 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/FTS5IndexMicroMsg.db
````

## Decrypt
Wechat uses customized parameters for encryption now, so standard SQLite viewers (including default sqlcipher shell) won't work.

To decrypt a WeChat SQLite file, build Tencent's fork of [SQLCipher](https://github.com/Tencent/sqlcipher/), and run the following command:

````
$ ./sqlcipher ~/CMU/PI_DATA/com.tencent.mm/MicroMsg/[reducted id]/EnMicroMsg.db
SQLCipher version 3.15.2 2016-11-28 19:13:37
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> PRAGMA cipher_default_kdf_iter = 4000;
sqlite> PRAGMA key = '[reducted password]';
sqlite> PRAGMA cipher_use_hmac = OFF;
sqlite> PRAGMA cipher_page_size = 1024;
sqlite> ATTACH DATABASE 'decrypted.db' AS plaintext KEY '';
sqlite> SELECT sqlcipher_export('plaintext');
sqlite> DETACH DATABASE plaintext;
````

`decrypted.db` will be created
