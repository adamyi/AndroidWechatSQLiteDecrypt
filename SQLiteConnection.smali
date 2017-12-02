.class public final Lcom/tencent/wcdb/database/SQLiteConnection;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/wcdb/support/CancellationSignal$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/wcdb/database/SQLiteConnection$Operation;,
        Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;,
        Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;,
        Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final EMPTY_BYTE_ARRAY:[B

.field private static final EMPTY_STRING_ARRAY:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "WCDB.SQLiteConnection"

.field private static final TRIM_SQL_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private mCancellationSignalAttachCount:I

.field private mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

.field private final mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

.field private final mConnectionId:I

.field private mConnectionPtr:J

.field private final mIsPrimaryConnection:Z

.field private final mIsReadOnlyConnection:Z

.field private mOnlyAllowReadOnlyOperations:Z

.field private mPassword:[B

.field public final mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

.field private final mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

.field private mPreparedStatementPool:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

.field public final mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 91
    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lcom/tencent/wcdb/database/SQLiteConnection;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 92
    new-array v0, v1, [B

    sput-object v0, Lcom/tencent/wcdb/database/SQLiteConnection;->EMPTY_BYTE_ARRAY:[B

    .line 94
    const-string/jumbo v0, "[\\s]*\\n+[\\s]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/tencent/wcdb/database/SQLiteConnection;->TRIM_SQL_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>(Lcom/tencent/wcdb/database/SQLiteConnectionPool;Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;IZ[BLcom/tencent/wcdb/database/SQLiteCipherSpec;)V
    .locals 2

    .prologue
    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-direct {v0, p0}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;-><init>(Lcom/tencent/wcdb/database/SQLiteConnection;)V

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    .line 167
    iput-object p5, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPassword:[B

    .line 168
    if-nez p6, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    .line 170
    iput-object p1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    .line 171
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-direct {v0, p2}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;-><init>(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    .line 172
    iput p3, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionId:I

    .line 173
    iput-boolean p4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsPrimaryConnection:Z

    .line 174
    iget v0, p2, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsReadOnlyConnection:Z

    .line 175
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v1, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->maxSqlCacheSize:I

    invoke-direct {v0, p0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;-><init>(Lcom/tencent/wcdb/database/SQLiteConnection;I)V

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    .line 176
    return-void

    .line 168
    :cond_0
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    invoke-direct {v0, p6}, Lcom/tencent/wcdb/database/SQLiteCipherSpec;-><init>(Lcom/tencent/wcdb/database/SQLiteCipherSpec;)V

    goto :goto_0

    .line 174
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private applyBlockGuardPolicy(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    .locals 1

    .prologue
    .line 1061
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->isInMemoryDb()Z

    .line 1063
    return-void
.end method

.method private static canonicalizeSyncMode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 343
    const-string/jumbo v0, "0"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 344
    const-string/jumbo p0, "OFF"

    .line 350
    :cond_0
    :goto_0
    return-object p0

    .line 345
    :cond_1
    const-string/jumbo v0, "1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 346
    const-string/jumbo p0, "NORMAL"

    goto :goto_0

    .line 347
    :cond_2
    const-string/jumbo v0, "2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 348
    const-string/jumbo p0, "FULL"

    goto :goto_0
.end method

.method private dispose(Z)V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    .line 246
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    cmp-long v0, v0, v4

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    const-string/jumbo v1, "close"

    invoke-virtual {v0, v1, v2, v2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->beginOperation(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/database/SQLiteConnection$Operation;

    move-result-object v0

    iget v1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->mCookie:I

    .line 249
    :try_start_0
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->evictAll()V

    .line 250
    iget-wide v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeClose(J)V

    .line 251
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    .line 256
    :cond_0
    return-void

    .line 253
    :catchall_0
    move-exception v0

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    throw v0
.end method

.method private getMainDbStatsUnsafe(IJJ)Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;
    .locals 10

    .prologue
    .line 1183
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->path:Ljava/lang/String;

    .line 1184
    iget-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsPrimaryConnection:Z

    if-nez v0, :cond_0

    .line 1185
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1187
    :cond_0
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    .line 1188
    invoke-virtual {v2}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->hitCount()I

    move-result v7

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    .line 1189
    invoke-virtual {v2}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->missCount()I

    move-result v8

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    .line 1190
    invoke-virtual {v2}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->size()I

    move-result v9

    move-wide v2, p2

    move-wide v4, p4

    move v6, p1

    invoke-direct/range {v0 .. v9}, Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;-><init>(Ljava/lang/String;JJIIII)V

    .line 1187
    return-object v0
.end method

.method private static isCacheable(I)Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 1053
    const/4 v1, 0x2

    if-eq p0, v1, :cond_0

    if-ne p0, v0, :cond_1

    .line 1057
    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static native nativeBindBlob(JJI[B)V
.end method

.method private static native nativeBindDouble(JJID)V
.end method

.method private static native nativeBindLong(JJIJ)V
.end method

.method private static native nativeBindNull(JJI)V
.end method

.method private static native nativeBindString(JJILjava/lang/String;)V
.end method

.method private static native nativeCancel(J)V
.end method

.method private static native nativeClose(J)V
.end method

.method private static native nativeExecute(JJ)V
.end method

.method private static native nativeExecuteForChangedRowCount(JJ)I
.end method

.method private static native nativeExecuteForCursorWindow(JJJIIZ)J
.end method

.method private static native nativeExecuteForLastInsertedRowId(JJ)J
.end method

.method private static native nativeExecuteForLong(JJ)J
.end method

.method private static native nativeExecuteForString(JJ)Ljava/lang/String;
.end method

.method private static native nativeExplainQueryPlan(JLjava/lang/String;)Ljava/lang/String;
.end method

.method private static native nativeFinalizeStatement(JJ)V
.end method

.method private static native nativeGetColumnCount(JJ)I
.end method

.method private static native nativeGetColumnName(JJI)Ljava/lang/String;
.end method

.method private static native nativeGetDbLookaside(J)I
.end method

.method private static native nativeGetParameterCount(JJ)I
.end method

.method private static native nativeGetSQLiteHandle(J)J
.end method

.method private static native nativeIsReadOnly(JJ)Z
.end method

.method private static native nativeOpen(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)J
.end method

.method private static native nativePrepareStatement(JLjava/lang/String;)J
.end method

.method private static native nativeRegisterCustomFunction(JLcom/tencent/wcdb/database/SQLiteCustomFunction;)V
.end method

.method private static native nativeRegisterLocalizedCollators(JLjava/lang/String;)V
.end method

.method private static native nativeResetCancel(JZ)V
.end method

.method private static native nativeResetStatement(JJZ)V
.end method

.method private static native nativeSetKey(J[B)V
.end method

.method private obtainPreparedStatement(Ljava/lang/String;JIIZ)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;
    .locals 2

    .prologue
    .line 1200
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementPool:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    .line 1201
    if-eqz v0, :cond_0

    .line 1202
    iget-object v1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mPoolNext:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    iput-object v1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementPool:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    .line 1203
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mPoolNext:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    .line 1204
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mInCache:Z

    .line 1208
    :goto_0
    iput-object p1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mSql:Ljava/lang/String;

    .line 1209
    iput-wide p2, v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mStatementPtr:J

    .line 1210
    iput p4, v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mNumParameters:I

    .line 1211
    iput p5, v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mType:I

    .line 1212
    iput-boolean p6, v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mReadOnly:Z

    .line 1213
    return-object v0

    .line 1206
    :cond_0
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    invoke-direct {v0, p0}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;-><init>(Lcom/tencent/wcdb/database/SQLiteConnection;)V

    goto :goto_0
.end method

.method static open(Lcom/tencent/wcdb/database/SQLiteConnectionPool;Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;IZ[BLcom/tencent/wcdb/database/SQLiteCipherSpec;)Lcom/tencent/wcdb/database/SQLiteConnection;
    .locals 7

    .prologue
    .line 195
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteConnection;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteConnection;-><init>(Lcom/tencent/wcdb/database/SQLiteConnectionPool;Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;IZ[BLcom/tencent/wcdb/database/SQLiteCipherSpec;)V

    .line 198
    :try_start_0
    invoke-direct {v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->open()V
    :try_end_0
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    return-object v0

    .line 200
    :catch_0
    move-exception v1

    .line 201
    invoke-static {v0}, Lcom/tencent/wcdb/database/SQLiteDebug;->collectLastIOTraceStats(Lcom/tencent/wcdb/database/SQLiteConnection;)V

    .line 202
    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->dispose(Z)V

    .line 203
    throw v1
.end method

.method private open()V
    .locals 6

    .prologue
    .line 214
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->path:Ljava/lang/String;

    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v1, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v2, v2, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->vfsName:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeOpen(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    .line 216
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPassword:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPassword:[B

    array-length v0, v0

    if-nez v0, :cond_0

    .line 217
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPassword:[B

    .line 220
    :cond_0
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPassword:[B

    if-eqz v0, :cond_1

    .line 221
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPassword:[B

    invoke-static {v0, v1, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeSetKey(J[B)V

    .line 224
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setCipherSpec()V

    .line 228
    :cond_1
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setPageSize()V

    .line 231
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setForeignKeyModeFromConfiguration()V

    .line 232
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setWalModeFromConfiguration()V

    .line 233
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setJournalSizeLimit()V

    .line 234
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setAutoCheckpointInterval()V

    .line 235
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setLocaleFromConfiguration()V

    .line 238
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 239
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v2, :cond_2

    .line 240
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/wcdb/database/SQLiteCustomFunction;

    .line 241
    iget-wide v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v4, v5, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeRegisterCustomFunction(JLcom/tencent/wcdb/database/SQLiteCustomFunction;)V

    .line 239
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 243
    :cond_2
    return-void
.end method

.method private recyclePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    .locals 1

    .prologue
    .line 1217
    const/4 v0, 0x0

    iput-object v0, p1, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mSql:Ljava/lang/String;

    .line 1218
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementPool:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    iput-object v0, p1, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mPoolNext:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    .line 1219
    iput-object p1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementPool:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    .line 1220
    return-void
.end method

.method private setAutoCheckpointInterval()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 293
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->isInMemoryDb()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsReadOnlyConnection:Z

    if-nez v0, :cond_0

    .line 294
    const-string/jumbo v0, "PRAGMA wal_autocheckpoint"

    invoke-virtual {p0, v0, v4, v4}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J

    move-result-wide v0

    .line 296
    const-wide/16 v2, 0x64

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 297
    const-string/jumbo v0, "PRAGMA wal_autocheckpoint=100"

    invoke-virtual {p0, v0, v4, v4}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J

    .line 300
    :cond_0
    return-void
.end method

.method private setCipherSpec()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 281
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    if-eqz v0, :cond_2

    .line 282
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->cipher:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 283
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PRAGMA cipher="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    iget-object v1, v1, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->cipher:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 285
    :cond_0
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->kdfIteration:I

    if-eqz v0, :cond_1

    .line 286
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PRAGMA kdf_iter="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    iget v1, v1, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->kdfIteration:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 288
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PRAGMA cipher_use_hmac="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    iget-boolean v1, v1, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->hmacEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 290
    :cond_2
    return-void
.end method

.method private setForeignKeyModeFromConfiguration()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 313
    iget-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsReadOnlyConnection:Z

    if-nez v0, :cond_0

    .line 314
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-boolean v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x1

    .line 315
    :goto_0
    const-string/jumbo v2, "PRAGMA foreign_keys"

    invoke-virtual {p0, v2, v4, v4}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J

    move-result-wide v2

    .line 316
    cmp-long v2, v2, v0

    if-eqz v2, :cond_0

    .line 317
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "PRAGMA foreign_keys="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v4, v4}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 320
    :cond_0
    return-void

    .line 314
    :cond_1
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method private setJournalMode(Ljava/lang/String;)V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 354
    const-string/jumbo v0, "PRAGMA journal_mode"

    invoke-virtual {p0, v0, v1, v1}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForString(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)Ljava/lang/String;

    move-result-object v0

    .line 355
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 357
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "PRAGMA journal_mode="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForString(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)Ljava/lang/String;

    move-result-object v1

    .line 358
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Lcom/tencent/wcdb/database/SQLiteDatabaseLockedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-eqz v1, :cond_1

    .line 386
    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v1

    .line 379
    :cond_1
    const-string/jumbo v1, "WCDB.SQLiteConnection"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Could not change the database journal mode of \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\' from \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "\' to \'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "\' because the database is locked.  This usually means that there are other open connections to the database which prevents the database from enabling or disabling write-ahead logging mode.  Proceeding without changing the journal mode."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/tencent/wcdb/support/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setJournalSizeLimit()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 303
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->isInMemoryDb()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsReadOnlyConnection:Z

    if-nez v0, :cond_0

    .line 304
    const-string/jumbo v0, "PRAGMA journal_size_limit"

    invoke-virtual {p0, v0, v4, v4}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J

    move-result-wide v0

    .line 306
    const-wide/32 v2, 0x80000

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 307
    const-string/jumbo v0, "PRAGMA journal_size_limit=524288"

    invoke-virtual {p0, v0, v4, v4}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J

    .line 310
    :cond_0
    return-void
.end method

.method private setLocaleFromConfiguration()V
    .locals 5

    .prologue
    .line 389
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    or-int/lit8 v1, v1, 0x10

    iput v1, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    .line 390
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_1

    .line 426
    :cond_0
    :goto_0
    return-void

    .line 395
    :cond_1
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    .line 396
    iget-wide v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v2, v3, v1}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeRegisterLocalizedCollators(JLjava/lang/String;)V

    .line 400
    iget-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsReadOnlyConnection:Z

    if-nez v0, :cond_0

    .line 406
    :try_start_0
    const-string/jumbo v0, "CREATE TABLE IF NOT EXISTS android_metadata (locale TEXT)"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 409
    const-string/jumbo v0, "SELECT locale FROM android_metadata UNION SELECT NULL ORDER BY locale DESC LIMIT 1"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForString(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)Ljava/lang/String;

    move-result-object v0

    .line 411
    if-eqz v0, :cond_2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 416
    :cond_2
    const-string/jumbo v0, "BEGIN"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 417
    :try_start_1
    const-string/jumbo v0, "DELETE FROM android_metadata"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 420
    const-string/jumbo v0, "INSERT INTO android_metadata (locale) VALUES(?)"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 422
    const-string/jumbo v0, "REINDEX LOCALIZED"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 423
    :try_start_2
    const-string/jumbo v0, "COMMIT"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 430
    :catch_0
    move-exception v0

    .line 428
    new-instance v2, Lcom/tencent/wcdb/database/SQLiteException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "Failed to change locale for db \'"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v4, v4, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->label:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\' to \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, "\'."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lcom/tencent/wcdb/database/SQLiteException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 425
    :catchall_0
    move-exception v0

    :try_start_3
    const-string/jumbo v2, "ROLLBACK"

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v3, v4}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    throw v0
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0
.end method

.method private setPageSize()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 259
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->isInMemoryDb()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsReadOnlyConnection:Z

    if-nez v0, :cond_1

    .line 263
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPassword:[B

    if-eqz v0, :cond_3

    .line 265
    const-string/jumbo v2, "PRAGMA cipher_page_size"

    .line 266
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->pageSize:I

    if-gtz v0, :cond_2

    :cond_0
    sget v0, Lcom/tencent/wcdb/database/SQLiteGlobal;->defaultPageSize:I

    int-to-long v0, v0

    .line 273
    :goto_0
    invoke-virtual {p0, v2, v6, v6}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J

    move-result-wide v4

    .line 274
    cmp-long v3, v4, v0

    if-eqz v3, :cond_1

    .line 275
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v6, v6}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 278
    :cond_1
    return-void

    .line 266
    :cond_2
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCipher:Lcom/tencent/wcdb/database/SQLiteCipherSpec;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->pageSize:I

    int-to-long v0, v0

    goto :goto_0

    .line 269
    :cond_3
    const-string/jumbo v2, "PRAGMA page_size"

    .line 270
    sget v0, Lcom/tencent/wcdb/database/SQLiteGlobal;->defaultPageSize:I

    int-to-long v0, v0

    goto :goto_0
.end method

.method private setSyncMode(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 335
    const-string/jumbo v0, "PRAGMA synchronous"

    invoke-virtual {p0, v0, v2, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForString(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)Ljava/lang/String;

    move-result-object v0

    .line 336
    invoke-static {v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->canonicalizeSyncMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 337
    invoke-static {p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->canonicalizeSyncMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 336
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 338
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "PRAGMA synchronous="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V

    .line 340
    :cond_0
    return-void
.end method

.method private setWalModeFromConfiguration()V
    .locals 2

    .prologue
    .line 323
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->isInMemoryDb()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsReadOnlyConnection:Z

    if-nez v0, :cond_0

    .line 324
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v0, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    const/high16 v1, 0x20000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_1

    .line 325
    const-string/jumbo v0, "WAL"

    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setJournalMode(Ljava/lang/String;)V

    .line 326
    const-string/jumbo v0, "FULL"

    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setSyncMode(Ljava/lang/String;)V

    .line 332
    :cond_0
    :goto_0
    return-void

    .line 328
    :cond_1
    const-string/jumbo v0, "PERSIST"

    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setJournalMode(Ljava/lang/String;)V

    .line 329
    const-string/jumbo v0, "FULL"

    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setSyncMode(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private throwIfStatementForbidden(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    .locals 2

    .prologue
    .line 1046
    iget-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mOnlyAllowReadOnlyOperations:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p1, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mReadOnly:Z

    if-nez v0, :cond_0

    .line 1047
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteException;

    const-string/jumbo v1, "Cannot execute this statement because it might modify the database but the connection is read-only."

    invoke-direct {v0, v1}, Lcom/tencent/wcdb/database/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1050
    :cond_0
    return-void
.end method

.method public static trimSqlForDisplay(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 1223
    sget-object v0, Lcom/tencent/wcdb/database/SQLiteConnection;->TRIM_SQL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method final acquirePreparedStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 893
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    .line 894
    const/4 v0, 0x0

    .line 895
    if-eqz v7, :cond_4

    .line 896
    iget-boolean v0, v7, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mInUse:Z

    if-nez v0, :cond_0

    .line 897
    iput-boolean v9, v7, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mInUse:Z

    .line 925
    :goto_0
    return-object v7

    :cond_0
    move v8, v9

    .line 906
    :goto_1
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v0, v1, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativePrepareStatement(JLjava/lang/String;)J

    move-result-wide v2

    .line 908
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v0, v1, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeGetParameterCount(JJ)I

    move-result v4

    .line 909
    invoke-static {p1}, Lcom/tencent/wcdb/DatabaseUtils;->getSqlStatementType(Ljava/lang/String;)I

    move-result v5

    .line 910
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v0, v1, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeIsReadOnly(JJ)Z

    move-result v6

    move-object v0, p0

    move-object v1, p1

    .line 911
    invoke-direct/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteConnection;->obtainPreparedStatement(Ljava/lang/String;JIIZ)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    move-result-object v7

    .line 912
    if-nez v8, :cond_1

    invoke-static {v5}, Lcom/tencent/wcdb/database/SQLiteConnection;->isCacheable(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 913
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    invoke-virtual {v0, p1, v7}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 914
    const/4 v0, 0x1

    iput-boolean v0, v7, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mInCache:Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 924
    :cond_1
    iput-boolean v9, v7, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mInUse:Z

    goto :goto_0

    .line 916
    :catch_0
    move-exception v0

    .line 919
    if-eqz v7, :cond_2

    iget-boolean v1, v7, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mInCache:Z

    if-nez v1, :cond_3

    .line 920
    :cond_2
    iget-wide v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v4, v5, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeFinalizeStatement(JJ)V

    .line 922
    :cond_3
    throw v0

    :cond_4
    move v8, v0

    goto :goto_1
.end method

.method public final attachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 957
    if-eqz p1, :cond_0

    .line 958
    invoke-virtual {p1}, Lcom/tencent/wcdb/support/CancellationSignal;->throwIfCanceled()V

    .line 960
    iget v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCancellationSignalAttachCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCancellationSignalAttachCount:I

    .line 961
    iget v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCancellationSignalAttachCount:I

    if-ne v0, v2, :cond_0

    .line 963
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v0, v1, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeResetCancel(JZ)V

    .line 966
    invoke-virtual {p1, p0}, Lcom/tencent/wcdb/support/CancellationSignal;->setOnCancelListener(Lcom/tencent/wcdb/support/CancellationSignal$OnCancelListener;)V

    .line 969
    :cond_0
    return-void
.end method

.method public final bindArguments(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;[Ljava/lang/Object;)V
    .locals 9

    .prologue
    const/4 v1, 0x0

    .line 998
    if-eqz p2, :cond_0

    array-length v0, p2

    move v7, v0

    .line 999
    :goto_0
    iget v0, p1, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mNumParameters:I

    if-eq v7, v0, :cond_1

    .line 1000
    new-instance v0, Lcom/tencent/wcdb/database/SQLiteBindOrColumnIndexOutOfRangeException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Expected "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1001
    iget v2, p1, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mNumParameters:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " bind arguments but "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " were provided."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/tencent/wcdb/database/SQLiteBindOrColumnIndexOutOfRangeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    move v7, v1

    .line 998
    goto :goto_0

    .line 1004
    :cond_1
    if-nez v7, :cond_3

    .line 1039
    :cond_2
    return-void

    .line 1008
    :cond_3
    invoke-virtual {p1}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v2

    move v8, v1

    .line 1009
    :goto_1
    if-ge v8, v7, :cond_2

    .line 1010
    aget-object v5, p2, v8

    .line 1011
    invoke-static {v5}, Lcom/tencent/wcdb/DatabaseUtils;->getTypeOfObject(Ljava/lang/Object;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1028
    :pswitch_0
    instance-of v0, v5, Ljava/lang/Boolean;

    if-eqz v0, :cond_5

    .line 1031
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    add-int/lit8 v4, v8, 0x1

    check-cast v5, Ljava/lang/Boolean;

    .line 1032
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_4

    const-wide/16 v5, 0x1

    .line 1031
    :goto_2
    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeBindLong(JJIJ)V

    .line 1009
    :goto_3
    add-int/lit8 v1, v8, 0x1

    move v8, v1

    goto :goto_1

    .line 1013
    :pswitch_1
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    add-int/lit8 v4, v8, 0x1

    invoke-static {v0, v1, v2, v3, v4}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeBindNull(JJI)V

    goto :goto_3

    .line 1016
    :pswitch_2
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    add-int/lit8 v4, v8, 0x1

    check-cast v5, Ljava/lang/Number;

    .line 1017
    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    .line 1016
    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeBindLong(JJIJ)V

    goto :goto_3

    .line 1020
    :pswitch_3
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    add-int/lit8 v4, v8, 0x1

    check-cast v5, Ljava/lang/Number;

    .line 1021
    invoke-virtual {v5}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v5

    .line 1020
    invoke-static/range {v0 .. v6}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeBindDouble(JJID)V

    goto :goto_3

    .line 1024
    :pswitch_4
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    add-int/lit8 v4, v8, 0x1

    check-cast v5, [B

    check-cast v5, [B

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeBindBlob(JJI[B)V

    goto :goto_3

    .line 1032
    :cond_4
    const-wide/16 v5, 0x0

    goto :goto_2

    .line 1034
    :cond_5
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    add-int/lit8 v4, v8, 0x1

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeBindString(JJILjava/lang/String;)V

    goto :goto_3

    .line 1011
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method final close()V
    .locals 1

    .prologue
    .line 210
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->dispose(Z)V

    .line 211
    return-void
.end method

.method final collectDbStats(Ljava/util/ArrayList;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1129
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeGetDbLookaside(J)I

    move-result v1

    .line 1130
    const-wide/16 v2, 0x0

    .line 1131
    const-wide/16 v4, 0x0

    .line 1133
    :try_start_0
    const-string/jumbo v0, "PRAGMA page_count;"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {p0, v0, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J

    move-result-wide v2

    .line 1134
    const-string/jumbo v0, "PRAGMA page_size;"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {p0, v0, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J
    :try_end_0
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-wide v4

    :goto_0
    move-object v0, p0

    .line 1138
    invoke-direct/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteConnection;->getMainDbStatsUnsafe(IJJ)Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1143
    new-instance v3, Lcom/tencent/wcdb/CursorWindow;

    const-string/jumbo v0, "collectDbStats"

    invoke-direct {v3, v0}, Lcom/tencent/wcdb/CursorWindow;-><init>(Ljava/lang/String;)V

    .line 1145
    :try_start_1
    const-string/jumbo v1, "PRAGMA database_list;"

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForCursorWindow(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/CursorWindow;IIZLcom/tencent/wcdb/support/CancellationSignal;)I

    .line 1146
    const/4 v0, 0x1

    move v2, v0

    :goto_1
    invoke-virtual {v3}, Lcom/tencent/wcdb/CursorWindow;->getNumRows()I

    move-result v0

    if-ge v2, v0, :cond_1

    .line 1147
    const/4 v0, 0x1

    invoke-virtual {v3, v2, v0}, Lcom/tencent/wcdb/CursorWindow;->getString(II)Ljava/lang/String;

    move-result-object v4

    .line 1148
    const/4 v0, 0x2

    invoke-virtual {v3, v2, v0}, Lcom/tencent/wcdb/CursorWindow;->getString(II)Ljava/lang/String;
    :try_end_1
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v10

    .line 1149
    const-wide/16 v0, 0x0

    .line 1150
    const-wide/16 v8, 0x0

    .line 1152
    :try_start_2
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "PRAGMA "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ".page_count;"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {p0, v5, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J

    move-result-wide v0

    .line 1153
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "PRAGMA "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ".page_size;"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {p0, v5, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J
    :try_end_2
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-wide v8

    move-wide v6, v0

    .line 1157
    :goto_2
    :try_start_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "  (attached) "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1158
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 1159
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1161
    :cond_0
    new-instance v4, Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v4 .. v13}, Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;-><init>(Ljava/lang/String;JJIIII)V

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1146
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto/16 :goto_1

    :catch_0
    move-exception v5

    move-wide v6, v0

    goto :goto_2

    .line 1166
    :cond_1
    invoke-virtual {v3}, Lcom/tencent/wcdb/CursorWindow;->close()V

    .line 1167
    :goto_3
    return-void

    .line 1166
    :catch_1
    move-exception v0

    invoke-virtual {v3}, Lcom/tencent/wcdb/CursorWindow;->close()V

    goto :goto_3

    :catchall_0
    move-exception v0

    invoke-virtual {v3}, Lcom/tencent/wcdb/CursorWindow;->close()V

    throw v0

    :catch_2
    move-exception v0

    goto/16 :goto_0
.end method

.method final collectDbStatsUnsafe(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;",
            ">;)V"
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 1177
    const/4 v1, 0x0

    move-object v0, p0

    move-wide v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/tencent/wcdb/database/SQLiteConnection;->getMainDbStatsUnsafe(IJJ)Lcom/tencent/wcdb/database/SQLiteDebug$DbStats;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1178
    return-void
.end method

.method final describeCurrentOperationUnsafe()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1119
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->describeCurrentOperation()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    .locals 3

    .prologue
    .line 972
    if-eqz p1, :cond_0

    .line 976
    iget v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCancellationSignalAttachCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCancellationSignalAttachCount:I

    .line 977
    iget v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mCancellationSignalAttachCount:I

    if-nez v0, :cond_0

    .line 979
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/tencent/wcdb/support/CancellationSignal;->setOnCancelListener(Lcom/tencent/wcdb/support/CancellationSignal$OnCancelListener;)V

    .line 982
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeResetCancel(JZ)V

    .line 985
    :cond_0
    return-void
.end method

.method public final dump(Z)V
    .locals 0

    .prologue
    .line 1072
    invoke-virtual {p0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->dumpUnsafe(Z)V

    .line 1073
    return-void
.end method

.method final dumpUnsafe(Z)V
    .locals 4

    .prologue
    .line 1090
    const-string/jumbo v0, "WCDB.SQLiteConnection"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Connection #"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tencent/wcdb/support/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1091
    if-eqz p1, :cond_0

    .line 1092
    const-string/jumbo v0, "WCDB.SQLiteConnection"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "  connectionPtr: 0x"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tencent/wcdb/support/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1094
    :cond_0
    const-string/jumbo v0, "WCDB.SQLiteConnection"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "  isPrimaryConnection: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsPrimaryConnection:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tencent/wcdb/support/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1095
    const-string/jumbo v0, "WCDB.SQLiteConnection"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "  onlyAllowReadOnlyOperations: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mOnlyAllowReadOnlyOperations:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tencent/wcdb/support/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1097
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->dump(Z)V

    .line 1099
    if-eqz p1, :cond_1

    .line 1100
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->dump()V

    .line 1102
    :cond_1
    return-void
.end method

.method public final execute(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)V
    .locals 8

    .prologue
    .line 584
    if-nez p1, :cond_0

    .line 585
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "sql must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 587
    :cond_0
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    const-string/jumbo v1, "execute"

    invoke-virtual {v0, v1, p1, p2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->beginOperation(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/database/SQLiteConnection$Operation;

    move-result-object v0

    .line 588
    iget v1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->mCookie:I

    .line 590
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->acquirePreparedStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    move-result-object v2

    .line 591
    iget v3, v2, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mType:I

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->bindStamentType(I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 593
    :try_start_1
    invoke-direct {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->throwIfStatementForbidden(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 594
    invoke-virtual {p0, v2, p2}, Lcom/tencent/wcdb/database/SQLiteConnection;->bindArguments(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;[Ljava/lang/Object;)V

    .line 595
    invoke-direct {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->applyBlockGuardPolicy(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 596
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->attachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 598
    :try_start_2
    iget-wide v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-virtual {v2}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeExecute(JJ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 600
    :try_start_3
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 603
    :try_start_4
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 615
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    .line 616
    return-void

    .line 600
    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 603
    :catchall_1
    move-exception v0

    :try_start_6
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    throw v0
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 605
    :catch_0
    move-exception v0

    .line 606
    :try_start_7
    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseLockedException;

    if-nez v2, :cond_1

    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteTableLockedException;

    if-eqz v2, :cond_2

    .line 608
    :cond_1
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v2, :cond_2

    .line 609
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v2, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->logConnectionPoolBusy(Ljava/lang/String;)V

    .line 612
    :cond_2
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1, v0}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->failOperation(ILjava/lang/Exception;)V

    .line 613
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 615
    :catchall_2
    move-exception v0

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    throw v0
.end method

.method public final executeForChangedRowCount(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)I
    .locals 8

    .prologue
    .line 732
    if-nez p1, :cond_0

    .line 733
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "sql must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 736
    :cond_0
    const/4 v1, 0x0

    .line 737
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    const-string/jumbo v2, "executeForChangedRowCount"

    invoke-virtual {v0, v2, p1, p2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->beginOperation(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/database/SQLiteConnection$Operation;

    move-result-object v0

    .line 738
    iget v2, v0, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->mCookie:I

    .line 740
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->acquirePreparedStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    move-result-object v3

    .line 741
    iget v4, v3, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mType:I

    invoke-virtual {v0, v4}, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->bindStamentType(I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 743
    :try_start_1
    invoke-direct {p0, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->throwIfStatementForbidden(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 744
    invoke-virtual {p0, v3, p2}, Lcom/tencent/wcdb/database/SQLiteConnection;->bindArguments(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;[Ljava/lang/Object;)V

    .line 745
    invoke-direct {p0, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->applyBlockGuardPolicy(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 746
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->attachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 748
    :try_start_2
    iget-wide v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    .line 749
    invoke-virtual {v3}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v6

    .line 748
    invoke-static {v4, v5, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeExecuteForChangedRowCount(JJ)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v1

    .line 750
    :try_start_3
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 755
    :try_start_4
    invoke-virtual {p0, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 767
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperationDeferLog(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 768
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "changedRows="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->logOperation(ILjava/lang/String;)V

    .line 750
    :cond_1
    return v1

    .line 752
    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 755
    :catchall_1
    move-exception v0

    :try_start_6
    invoke-virtual {p0, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    throw v0
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 757
    :catch_0
    move-exception v0

    .line 758
    :try_start_7
    instance-of v3, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseLockedException;

    if-nez v3, :cond_2

    instance-of v3, v0, Lcom/tencent/wcdb/database/SQLiteTableLockedException;

    if-eqz v3, :cond_3

    .line 760
    :cond_2
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v3, :cond_3

    .line 761
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v3, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->logConnectionPoolBusy(Ljava/lang/String;)V

    .line 764
    :cond_3
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v3, v2, v0}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->failOperation(ILjava/lang/Exception;)V

    .line 765
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 767
    :catchall_2
    move-exception v0

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v3, v2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperationDeferLog(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 768
    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "changedRows="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v2, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->logOperation(ILjava/lang/String;)V

    :cond_4
    throw v0
.end method

.method public final executeForCursorWindow(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/CursorWindow;IIZLcom/tencent/wcdb/support/CancellationSignal;)I
    .locals 16

    .prologue
    .line 826
    if-nez p1, :cond_0

    .line 827
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "sql must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 829
    :cond_0
    if-nez p3, :cond_1

    .line 830
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "window must not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 833
    :cond_1
    invoke-virtual/range {p3 .. p3}, Lcom/tencent/wcdb/CursorWindow;->acquireReference()V

    .line 835
    const/4 v13, -0x1

    .line 836
    const/4 v12, -0x1

    .line 837
    const/4 v11, -0x1

    .line 838
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    const-string/jumbo v3, "executeForCursorWindow"

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v2, v3, v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->beginOperation(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/database/SQLiteConnection$Operation;

    move-result-object v2

    .line 839
    iget v14, v2, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->mCookie:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 841
    :try_start_1
    invoke-virtual/range {p0 .. p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->acquirePreparedStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    move-result-object v15

    .line 842
    iget v3, v15, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mType:I

    invoke-virtual {v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->bindStamentType(I)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 844
    :try_start_2
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/tencent/wcdb/database/SQLiteConnection;->throwIfStatementForbidden(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 845
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v15, v1}, Lcom/tencent/wcdb/database/SQLiteConnection;->bindArguments(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;[Ljava/lang/Object;)V

    .line 846
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/tencent/wcdb/database/SQLiteConnection;->applyBlockGuardPolicy(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 847
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection;->attachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    .line 849
    :try_start_3
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    .line 850
    invoke-virtual {v15}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v4

    move-object/from16 v0, p3

    iget-wide v6, v0, Lcom/tencent/wcdb/CursorWindow;->mWindowPtr:J

    move/from16 v8, p4

    move/from16 v9, p5

    move/from16 v10, p6

    .line 849
    invoke-static/range {v2 .. v10}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeExecuteForCursorWindow(JJJIIZ)J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-wide v2

    .line 852
    const/16 v4, 0x20

    shr-long v4, v2, v4

    long-to-int v5, v4

    .line 853
    long-to-int v4, v2

    .line 854
    :try_start_4
    invoke-virtual/range {p3 .. p3}, Lcom/tencent/wcdb/CursorWindow;->getNumRows()I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    move-result v3

    .line 855
    :try_start_5
    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Lcom/tencent/wcdb/CursorWindow;->setStartPosition(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_7

    .line 856
    :try_start_6
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 861
    :try_start_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 873
    :try_start_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v14}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperationDeferLog(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 874
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "window=\'"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\', startPos="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ", actualPos="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ", filledRows="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, ", countedRows="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v14, v3}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->logOperation(ILjava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 882
    :cond_2
    invoke-virtual/range {p3 .. p3}, Lcom/tencent/wcdb/CursorWindow;->releaseReference()V

    .line 856
    return v4

    .line 858
    :catchall_0
    move-exception v2

    move v3, v11

    move v4, v12

    move v5, v13

    :goto_0
    :try_start_9
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V

    throw v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 861
    :catchall_1
    move-exception v2

    move v11, v3

    move v12, v4

    move v13, v5

    :goto_1
    :try_start_a
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    throw v2
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 863
    :catch_0
    move-exception v2

    .line 864
    :goto_2
    :try_start_b
    instance-of v3, v2, Lcom/tencent/wcdb/database/SQLiteDatabaseLockedException;

    if-nez v3, :cond_3

    instance-of v3, v2, Lcom/tencent/wcdb/database/SQLiteTableLockedException;

    if-eqz v3, :cond_4

    .line 866
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v3, :cond_4

    .line 867
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->logConnectionPoolBusy(Ljava/lang/String;)V

    .line 870
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v3, v14, v2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->failOperation(ILjava/lang/Exception;)V

    .line 871
    throw v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 873
    :catchall_2
    move-exception v2

    :goto_3
    :try_start_c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v3, v14}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperationDeferLog(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 874
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "window=\'"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\', startPos="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", actualPos="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", filledRows="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", countedRows="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v14, v4}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->logOperation(ILjava/lang/String;)V

    :cond_5
    throw v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 882
    :catchall_3
    move-exception v2

    invoke-virtual/range {p3 .. p3}, Lcom/tencent/wcdb/CursorWindow;->releaseReference()V

    throw v2

    .line 873
    :catchall_4
    move-exception v2

    move v11, v3

    move v12, v4

    move v13, v5

    goto :goto_3

    .line 863
    :catch_1
    move-exception v2

    move v11, v3

    move v12, v4

    move v13, v5

    goto :goto_2

    .line 861
    :catchall_5
    move-exception v2

    goto/16 :goto_1

    .line 858
    :catchall_6
    move-exception v2

    move v3, v11

    goto/16 :goto_0

    :catchall_7
    move-exception v2

    goto/16 :goto_0
.end method

.method public final executeForLastInsertedRowId(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J
    .locals 8

    .prologue
    .line 787
    if-nez p1, :cond_0

    .line 788
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "sql must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 790
    :cond_0
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    const-string/jumbo v1, "executeForLastInsertedRowId"

    invoke-virtual {v0, v1, p1, p2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->beginOperation(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/database/SQLiteConnection$Operation;

    move-result-object v0

    .line 791
    iget v1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->mCookie:I

    .line 793
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->acquirePreparedStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    move-result-object v2

    .line 794
    iget v3, v2, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mType:I

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->bindStamentType(I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 796
    :try_start_1
    invoke-direct {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->throwIfStatementForbidden(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 797
    invoke-virtual {p0, v2, p2}, Lcom/tencent/wcdb/database/SQLiteConnection;->bindArguments(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;[Ljava/lang/Object;)V

    .line 798
    invoke-direct {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->applyBlockGuardPolicy(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 799
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->attachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 801
    :try_start_2
    iget-wide v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    .line 802
    invoke-virtual {v2}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v6

    .line 801
    invoke-static {v4, v5, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeExecuteForLastInsertedRowId(JJ)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-wide v4

    .line 804
    :try_start_3
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 807
    :try_start_4
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 819
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    .line 801
    return-wide v4

    .line 804
    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 807
    :catchall_1
    move-exception v0

    :try_start_6
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    throw v0
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 809
    :catch_0
    move-exception v0

    .line 810
    :try_start_7
    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseLockedException;

    if-nez v2, :cond_1

    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteTableLockedException;

    if-eqz v2, :cond_2

    .line 812
    :cond_1
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v2, :cond_2

    .line 813
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v2, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->logConnectionPoolBusy(Ljava/lang/String;)V

    .line 816
    :cond_2
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1, v0}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->failOperation(ILjava/lang/Exception;)V

    .line 817
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 819
    :catchall_2
    move-exception v0

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    throw v0
.end method

.method public final executeForLong(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)J
    .locals 8

    .prologue
    .line 633
    if-nez p1, :cond_0

    .line 634
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "sql must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 637
    :cond_0
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    const-string/jumbo v1, "executeForLong"

    invoke-virtual {v0, v1, p1, p2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->beginOperation(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/database/SQLiteConnection$Operation;

    move-result-object v0

    .line 638
    iget v1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->mCookie:I

    .line 640
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->acquirePreparedStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    move-result-object v2

    .line 641
    iget v3, v2, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mType:I

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->bindStamentType(I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 643
    :try_start_1
    invoke-direct {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->throwIfStatementForbidden(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 644
    invoke-virtual {p0, v2, p2}, Lcom/tencent/wcdb/database/SQLiteConnection;->bindArguments(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;[Ljava/lang/Object;)V

    .line 645
    invoke-direct {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->applyBlockGuardPolicy(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 646
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->attachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 648
    :try_start_2
    iget-wide v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-virtual {v2}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeExecuteForLong(JJ)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-wide v4

    .line 650
    :try_start_3
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 653
    :try_start_4
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 665
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    .line 648
    return-wide v4

    .line 650
    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 653
    :catchall_1
    move-exception v0

    :try_start_6
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    throw v0
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 655
    :catch_0
    move-exception v0

    .line 656
    :try_start_7
    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseLockedException;

    if-nez v2, :cond_1

    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteTableLockedException;

    if-eqz v2, :cond_2

    .line 658
    :cond_1
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v2, :cond_2

    .line 659
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v2, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->logConnectionPoolBusy(Ljava/lang/String;)V

    .line 662
    :cond_2
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1, v0}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->failOperation(ILjava/lang/Exception;)V

    .line 663
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 665
    :catchall_2
    move-exception v0

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    throw v0
.end method

.method public final executeForString(Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/wcdb/support/CancellationSignal;)Ljava/lang/String;
    .locals 8

    .prologue
    .line 683
    if-nez p1, :cond_0

    .line 684
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "sql must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 686
    :cond_0
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    const-string/jumbo v1, "executeForString"

    invoke-virtual {v0, v1, p1, p2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->beginOperation(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/database/SQLiteConnection$Operation;

    move-result-object v0

    .line 687
    iget v1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->mCookie:I

    .line 689
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->acquirePreparedStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    move-result-object v2

    .line 690
    iget v3, v2, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mType:I

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->bindStamentType(I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 692
    :try_start_1
    invoke-direct {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->throwIfStatementForbidden(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 693
    invoke-virtual {p0, v2, p2}, Lcom/tencent/wcdb/database/SQLiteConnection;->bindArguments(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;[Ljava/lang/Object;)V

    .line 694
    invoke-direct {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->applyBlockGuardPolicy(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 695
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->attachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 697
    :try_start_2
    iget-wide v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-virtual {v2}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeExecuteForString(JJ)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    .line 699
    :try_start_3
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 702
    :try_start_4
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 714
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    .line 697
    return-object v0

    .line 699
    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {p0, p3}, Lcom/tencent/wcdb/database/SQLiteConnection;->detachCancellationSignal(Lcom/tencent/wcdb/support/CancellationSignal;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 702
    :catchall_1
    move-exception v0

    :try_start_6
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    throw v0
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 704
    :catch_0
    move-exception v0

    .line 705
    :try_start_7
    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseLockedException;

    if-nez v2, :cond_1

    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteTableLockedException;

    if-eqz v2, :cond_2

    .line 707
    :cond_1
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v2, :cond_2

    .line 708
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v2, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->logConnectionPoolBusy(Ljava/lang/String;)V

    .line 711
    :cond_2
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1, v0}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->failOperation(ILjava/lang/Exception;)V

    .line 712
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 714
    :catchall_2
    move-exception v0

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    throw v0
.end method

.method public final explainQueryPlan(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 888
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v0, v1, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeExplainQueryPlan(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final finalize()V
    .locals 4

    .prologue
    .line 181
    :try_start_0
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v0}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->onConnectionLeaked()V

    .line 185
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->dispose(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 187
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 188
    return-void

    .line 187
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public final finalizePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    .locals 4

    .prologue
    .line 952
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-virtual {p1}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeFinalizeStatement(JJ)V

    .line 953
    invoke-direct {p0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->recyclePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    .line 954
    return-void
.end method

.method public final getConnectionId()I
    .locals 1

    .prologue
    .line 495
    iget v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionId:I

    return v0
.end method

.method final getCurrentConnectionPtr()J
    .locals 4

    .prologue
    const-wide/16 v0, 0x0

    .line 105
    iget-wide v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    cmp-long v2, v2, v0

    if-nez v2, :cond_0

    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeGetSQLiteHandle(J)J

    move-result-wide v0

    goto :goto_0
.end method

.method final isPreparedStatementInCache(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 485
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    invoke-virtual {v0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isPrimaryConnection()Z
    .locals 1

    .prologue
    .line 504
    iget-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mIsPrimaryConnection:Z

    return v0
.end method

.method public final onCancel()V
    .locals 2

    .prologue
    .line 994
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeCancel(J)V

    .line 995
    return-void
.end method

.method public final prepare(Ljava/lang/String;Lcom/tencent/wcdb/database/SQLiteStatementInfo;)V
    .locals 10

    .prologue
    .line 531
    if-nez p1, :cond_0

    .line 532
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "sql must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 534
    :cond_0
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    const-string/jumbo v1, "prepare"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->beginOperation(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lcom/tencent/wcdb/database/SQLiteConnection$Operation;

    move-result-object v0

    .line 535
    iget v1, v0, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->mCookie:I

    .line 537
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->acquirePreparedStatement(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;

    move-result-object v2

    .line 538
    iget v3, v2, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mType:I

    invoke-virtual {v0, v3}, Lcom/tencent/wcdb/database/SQLiteConnection$Operation;->bindStamentType(I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 540
    if-eqz p2, :cond_1

    .line 541
    :try_start_1
    iget v0, v2, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mNumParameters:I

    iput v0, p2, Lcom/tencent/wcdb/database/SQLiteStatementInfo;->numParameters:I

    .line 542
    iget-boolean v0, v2, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mReadOnly:Z

    iput-boolean v0, p2, Lcom/tencent/wcdb/database/SQLiteStatementInfo;->readOnly:Z

    .line 544
    iget-wide v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    .line 545
    invoke-virtual {v2}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v6

    .line 544
    invoke-static {v4, v5, v6, v7}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeGetColumnCount(JJ)I

    move-result v3

    .line 546
    if-nez v3, :cond_2

    .line 547
    sget-object v0, Lcom/tencent/wcdb/database/SQLiteConnection;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    iput-object v0, p2, Lcom/tencent/wcdb/database/SQLiteStatementInfo;->columnNames:[Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 557
    :cond_1
    :try_start_2
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 568
    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    .line 569
    return-void

    .line 549
    :cond_2
    :try_start_3
    new-array v0, v3, [Ljava/lang/String;

    iput-object v0, p2, Lcom/tencent/wcdb/database/SQLiteStatementInfo;->columnNames:[Ljava/lang/String;

    .line 550
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_1

    .line 551
    iget-object v4, p2, Lcom/tencent/wcdb/database/SQLiteStatementInfo;->columnNames:[Ljava/lang/String;

    iget-wide v6, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    .line 552
    invoke-virtual {v2}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v8

    .line 551
    invoke-static {v6, v7, v8, v9, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeGetColumnName(JJI)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 550
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 557
    :catchall_0
    move-exception v0

    :try_start_4
    invoke-virtual {p0, v2}, Lcom/tencent/wcdb/database/SQLiteConnection;->releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    throw v0
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 559
    :catch_0
    move-exception v0

    .line 560
    :try_start_5
    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteDatabaseLockedException;

    if-nez v2, :cond_3

    instance-of v2, v0, Lcom/tencent/wcdb/database/SQLiteTableLockedException;

    if-eqz v2, :cond_4

    .line 561
    :cond_3
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    if-eqz v2, :cond_4

    .line 562
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPool:Lcom/tencent/wcdb/database/SQLiteConnectionPool;

    invoke-virtual {v2, p1}, Lcom/tencent/wcdb/database/SQLiteConnectionPool;->logConnectionPoolBusy(Ljava/lang/String;)V

    .line 565
    :cond_4
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1, v0}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->failOperation(ILjava/lang/Exception;)V

    .line 566
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 568
    :catchall_1
    move-exception v0

    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mRecentOperations:Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;

    invoke-virtual {v2, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$OperationLog;->endOperation(I)V

    throw v0
.end method

.method final reconfigure(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 435
    iput-boolean v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mOnlyAllowReadOnlyOperations:Z

    .line 438
    iget-object v0, p1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v3, v2

    .line 439
    :goto_0
    if-ge v3, v4, :cond_1

    .line 440
    iget-object v0, p1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customFunctions:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/wcdb/database/SQLiteCustomFunction;

    .line 441
    iget-object v5, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v5, v5, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->customFunctions:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 442
    iget-wide v6, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-static {v6, v7, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeRegisterCustomFunction(JLcom/tencent/wcdb/database/SQLiteCustomFunction;)V

    .line 439
    :cond_0
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_0

    .line 447
    :cond_1
    iget-boolean v0, p1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z

    iget-object v3, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-boolean v3, v3, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->foreignKeyConstraintsEnabled:Z

    if-eq v0, v3, :cond_5

    move v0, v1

    .line 449
    :goto_1
    iget v3, p1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    iget-object v4, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget v4, v4, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->openFlags:I

    xor-int/2addr v3, v4

    const/high16 v4, 0x20000000

    and-int/2addr v3, v4

    if-eqz v3, :cond_6

    move v3, v1

    .line 451
    :goto_2
    iget-object v4, p1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->locale:Ljava/util/Locale;

    iget-object v5, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v5, v5, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->locale:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 454
    :goto_3
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    invoke-virtual {v2, p1}, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->updateParametersFrom(Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;)V

    .line 457
    iget-object v2, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    iget v4, p1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->maxSqlCacheSize:I

    invoke-virtual {v2, v4}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->resize(I)V

    .line 460
    if-eqz v0, :cond_2

    .line 461
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setForeignKeyModeFromConfiguration()V

    .line 465
    :cond_2
    if-eqz v3, :cond_3

    .line 466
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setWalModeFromConfiguration()V

    .line 470
    :cond_3
    if-eqz v1, :cond_4

    .line 471
    invoke-direct {p0}, Lcom/tencent/wcdb/database/SQLiteConnection;->setLocaleFromConfiguration()V

    .line 473
    :cond_4
    return-void

    :cond_5
    move v0, v2

    .line 447
    goto :goto_1

    :cond_6
    move v3, v2

    .line 449
    goto :goto_2

    :cond_7
    move v1, v2

    .line 451
    goto :goto_3
.end method

.method final releasePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V
    .locals 2

    .prologue
    .line 929
    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mInUse:Z

    .line 930
    iget-boolean v0, p1, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mInCache:Z

    if-eqz v0, :cond_0

    .line 932
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/tencent/wcdb/database/SQLiteConnection;->resetStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;Z)V
    :try_end_0
    .catch Lcom/tencent/wcdb/database/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 949
    :goto_0
    return-void

    .line 944
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mPreparedStatementCache:Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;

    iget-object v1, p1, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->mSql:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatementCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 947
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tencent/wcdb/database/SQLiteConnection;->finalizePreparedStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;)V

    goto :goto_0
.end method

.method public final resetStatement(Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;Z)V
    .locals 4

    .prologue
    .line 1042
    iget-wide v0, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionPtr:J

    invoke-virtual {p1}, Lcom/tencent/wcdb/database/SQLiteConnection$PreparedStatement;->getPtr()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3, p2}, Lcom/tencent/wcdb/database/SQLiteConnection;->nativeResetStatement(JJZ)V

    .line 1043
    return-void
.end method

.method final setOnlyAllowReadOnlyOperations(Z)V
    .locals 0

    .prologue
    .line 479
    iput-boolean p1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mOnlyAllowReadOnlyOperations:Z

    .line 480
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1195
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "SQLiteConnection: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConfiguration:Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;

    iget-object v1, v1, Lcom/tencent/wcdb/database/SQLiteDatabaseConfiguration;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/tencent/wcdb/database/SQLiteConnection;->mConnectionId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
