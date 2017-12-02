package am.yiad.wxsqlpasswordhook;

import android.util.Log;

import java.util.Formatter;

import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.callbacks.XC_LoadPackage;

/**
 * Created by adamyi on 12/2/17.
 */

public class XModule implements IXposedHookLoadPackage {

    static private String TAG = "wxSqlPwdHook";

    @Override
    public void handleLoadPackage(XC_LoadPackage.LoadPackageParam loadPackageParam) throws Throwable {
        if (loadPackageParam.packageName.equals("com.tencent.mm")) {

            XposedHelpers.findAndHookMethod("com.tencent.wcdb.database.SQLiteDatabase", loadPackageParam.classLoader, "openDatabase", String.class,
                    byte[].class, loadPackageParam.classLoader.loadClass("com.tencent.wcdb.database.SQLiteCipherSpec"),
                    loadPackageParam.classLoader.loadClass("com.tencent.wcdb.database.SQLiteDatabase$CursorFactory"), int.class,
                    loadPackageParam.classLoader.loadClass("com.tencent.wcdb.DatabaseErrorHandler"), int.class,
                    new XC_MethodHook() {
                        @Override
                        protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
                            Log.i(TAG, "Path: " + param.args[0]);
                            Log.i(TAG, "Password: " + new String((byte[]) param.args[1], "UTF-8"));
                            Formatter formatter = new Formatter();
                            for (byte b : (byte[]) param.args[1]) {
                                formatter.format("%02x", b);
                            }
                            Log.i(TAG, "Password (hex): 0x" + formatter.toString());
                            Log.i(TAG, "CipherSpec - Cipher: " + XposedHelpers.getObjectField(param.args[2], "cipher"));
                            Log.i(TAG, "CipherSpec - KdfIteration: " + XposedHelpers.getIntField(param.args[2], "kdfIteration"));
                            Log.i(TAG, "CipherSpec - Hmac Enabled: " + XposedHelpers.getBooleanField(param.args[2], "hmacEnabled"));
                            Log.i(TAG, "CipherSpec - Page Size: " + XposedHelpers.getIntField(param.args[2], "pageSize"));
                            Log.i(TAG, "Flags: " + param.args[4]);
                            Log.i(TAG, "PoolSize: " + param.args[6]);
                        }
                    });

        }
    }
}