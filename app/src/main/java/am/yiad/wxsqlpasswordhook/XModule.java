package am.yiad.wxsqlpasswordhook;

import android.util.Log;

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
                            Log.i(TAG, "Flags: " + param.args[4]);
                            Log.i(TAG, "PoolSize: " + param.args[6]);
                        }
                    });

        }
    }
}