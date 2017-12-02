# WeChatSQLitePasswordHook

A toolset to decrypt WeChat's SQLite database.

Please check README in each subdirs:

* **AndroidHook**, an Xposed module for Android to hook into WeChat (wcdb) to get SQLite path, SQLCipher key, and encryption parameters.
* **decompiled_wechat**, decompiled WeChat source code related to SQLite connection.
* **decrypt**, a script to decrypt Android WeChat SQLCipher files
