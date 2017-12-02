# WeChatSQLitePasswordHook

This is an Xposed module for Android to hook into WeChat (wcdb) to get SQLite path and SQLCipher key.

## Output
The data will be outputted with logcat. Tested with Android 7.0, Xposed 88.2, Wechat 6.5.16
````
12-02 13:09:48.309  4938  5111 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnMicroMsg.db
12-02 13:09:48.309  4938  5111 I wxSqlPwdHook: Password: [reducted password]
12-02 13:09:48.309  4938  5111 I wxSqlPwdHook: Flags: 805306368
12-02 13:09:48.309  4938  5111 I wxSqlPwdHook: PoolSize: 0
12-02 13:09:48.710  4938  5111 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnMicroMsg.db
12-02 13:09:48.710  4938  5111 I wxSqlPwdHook: Password: [reducted password]
12-02 13:09:48.710  4938  5111 I wxSqlPwdHook: Flags: 805306368
12-02 13:09:48.710  4938  5111 I wxSqlPwdHook: PoolSize: 0
12-02 13:09:49.248  4938  5111 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/CommonOneMicroMsg.db
12-02 13:09:50.676  4938  5111 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/SnsMicroMsg.db
12-02 13:09:56.533  4938  5111 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnResDown.db
12-02 13:09:56.533  4938  5111 I wxSqlPwdHook: Password: [reducted password]
12-02 13:09:56.533  4938  5111 I wxSqlPwdHook: Flags: 805306368
12-02 13:09:56.533  4938  5111 I wxSqlPwdHook: PoolSize: 0
12-02 13:09:58.942  4938  5111 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/enFavorite.db
12-02 13:09:58.942  4938  5111 I wxSqlPwdHook: Password: [reducted password]
12-02 13:09:58.942  4938  5111 I wxSqlPwdHook: Flags: 805306368
12-02 13:09:58.942  4938  5111 I wxSqlPwdHook: PoolSize: 0
12-02 13:09:59.147  4938  5111 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/AppBrandComm.db
12-02 13:09:59.147  4938  5111 I wxSqlPwdHook: Password: [reducted password]
12-02 13:09:59.147  4938  5111 I wxSqlPwdHook: Flags: 805306368
12-02 13:09:59.147  4938  5111 I wxSqlPwdHook: PoolSize: 0
12-02 13:09:59.406  4938  5443 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/FTS5IndexMicroMsg.db
12-02 13:10:14.611  6055  6110 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnMicroMsg.db
12-02 13:10:14.611  6055  6110 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:14.611  6055  6110 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:14.611  6055  6110 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:14.877  6055  6110 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnMicroMsg.db
12-02 13:10:14.877  6055  6110 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:14.877  6055  6110 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:14.877  6055  6110 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:15.169  6055  6110 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/CommonOneMicroMsg.db
12-02 13:10:15.369  6055  6110 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/SnsMicroMsg.db
12-02 13:10:16.220  6055  6110 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnResDown.db
12-02 13:10:16.220  6055  6110 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:16.220  6055  6110 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:16.220  6055  6110 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:16.755  6055  6110 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/enFavorite.db
12-02 13:10:16.755  6055  6110 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:16.755  6055  6110 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:16.755  6055  6110 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:16.985  6055  6110 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/AppBrandComm.db
12-02 13:10:16.985  6055  6110 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:16.985  6055  6110 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:16.985  6055  6110 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:17.158  6055  6565 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/FTS5IndexMicroMsg.db
12-02 13:10:36.963  9073  9166 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnMicroMsg.db
12-02 13:10:36.963  9073  9166 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:36.963  9073  9166 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:36.963  9073  9166 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:37.200  9073  9166 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnMicroMsg.db
12-02 13:10:37.200  9073  9166 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:37.200  9073  9166 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:37.200  9073  9166 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:37.476  9073  9166 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/CommonOneMicroMsg.db
12-02 13:10:37.709  9073  9166 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/SnsMicroMsg.db
12-02 13:10:38.209  9073  9166 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/EnResDown.db
12-02 13:10:38.209  9073  9166 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:38.209  9073  9166 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:38.210  9073  9166 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:38.507  9073  9166 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/enFavorite.db
12-02 13:10:38.508  9073  9166 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:38.508  9073  9166 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:38.508  9073  9166 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:38.680  9073  9166 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/AppBrandComm.db
12-02 13:10:38.680  9073  9166 I wxSqlPwdHook: Password: [reducted password]
12-02 13:10:38.680  9073  9166 I wxSqlPwdHook: Flags: 805306368
12-02 13:10:38.680  9073  9166 I wxSqlPwdHook: PoolSize: 0
12-02 13:10:38.817  9073  9402 I wxSqlPwdHook: Path: /data/user/0/com.tencent.mm/MicroMsg/[reducted id]/FTS5IndexMicroMsg.db
````
