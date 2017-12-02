# AndroidWechatSQLiteDecrypt

A toolset to decrypt Android WeChat's SQLite database.

Please check README in each subdirs:

* **AndroidHook**, an Xposed module for Android to hook into WeChat (wcdb) to get SQLite path, SQLCipher key, and encryption parameters.
* **decompiled_wechat**, decompiled WeChat source code related to SQLite connection.
* **decrypt**, a script to decrypt Android WeChat SQLCipher files

## How-To

1. Retrieve data from WeChat: `/data/data/com.tencent.mm/MicroMsg/[reducted ID]/EnMicroMsg.db`;
2. Install [Xposed](http://repo.xposed.info/module/de.robv.android.xposed.installer) and `AndroidHook` to get encryption key & parameters with Logcat;
3. With the encryption key and parameters, use the script under `decrypt` folder to decrypt.

## Author
[Adam Yi](mailto:i@adamyi.com)

## LICENSE
[BSD 2-Clause License](LICENSE)
