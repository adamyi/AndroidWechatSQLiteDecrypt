# WeChatSQLitePasswordHook

This is an Xposed module for Android to hook into WeChat (wcdb) to get SQLite path, SQLCipher key, and encryption parameters.

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

