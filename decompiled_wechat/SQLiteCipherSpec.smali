.class public Lcom/tencent/wcdb/database/SQLiteCipherSpec;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CIPHER_AES256CBC:Ljava/lang/String; = "aes-256-cbc"

.field public static final CIPHER_XXTEA:Ljava/lang/String; = "xxtea"


# instance fields
.field public cipher:Ljava/lang/String;

.field public hmacEnabled:Z

.field public kdfIteration:I

.field public pageSize:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->hmacEnabled:Z

    .line 11
    sget v0, Lcom/tencent/wcdb/database/SQLiteGlobal;->defaultPageSize:I

    iput v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->pageSize:I

    .line 14
    return-void
.end method

.method public constructor <init>(Lcom/tencent/wcdb/database/SQLiteCipherSpec;)V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->hmacEnabled:Z

    .line 11
    sget v0, Lcom/tencent/wcdb/database/SQLiteGlobal;->defaultPageSize:I

    iput v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->pageSize:I

    .line 17
    iget-object v0, p1, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->cipher:Ljava/lang/String;

    iput-object v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->cipher:Ljava/lang/String;

    .line 18
    iget v0, p1, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->kdfIteration:I

    iput v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->kdfIteration:I

    .line 19
    iget-boolean v0, p1, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->hmacEnabled:Z

    iput-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->hmacEnabled:Z

    .line 20
    iget v0, p1, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->pageSize:I

    iput v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->pageSize:I

    .line 21
    return-void
.end method


# virtual methods
.method public setCipher(Ljava/lang/String;)Lcom/tencent/wcdb/database/SQLiteCipherSpec;
    .locals 0

    .prologue
    .line 24
    iput-object p1, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->cipher:Ljava/lang/String;

    return-object p0
.end method

.method public setKDFIteration(I)Lcom/tencent/wcdb/database/SQLiteCipherSpec;
    .locals 0

    .prologue
    .line 28
    iput p1, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->kdfIteration:I

    return-object p0
;.end method

.method public setPageSize(I)Lcom/tencent/wcdb/database/SQLiteCipherSpec;
    .locals 0

    .prologue
    .line 36
    iput p1, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->pageSize:I

    return-object p0
.end method

.method public setSQLCipherVersion(I)Lcom/tencent/wcdb/database/SQLiteCipherSpec;
    .locals 3

    .prologue
    const/16 v1, 0xfa0

    const/4 v0, 0x1

    .line 40
    packed-switch p1, :pswitch_data_0

    .line 44
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Unsupported SQLCipher version: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :pswitch_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->hmacEnabled:Z

    iput v1, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->kdfIteration:I

    .line 46
    :goto_0
    return-object p0

    .line 42
    :pswitch_1
    iput-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->hmacEnabled:Z

    iput v1, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->kdfIteration:I

    goto :goto_0

    .line 43
    :pswitch_2
    iput-boolean v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->hmacEnabled:Z

    const v0, 0xfa00

    iput v0, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->kdfIteration:I

    goto :goto_0

    .line 40
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public withHMACEnabled(Z)Lcom/tencent/wcdb/database/SQLiteCipherSpec;
    .locals 0

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/tencent/wcdb/database/SQLiteCipherSpec;->hmacEnabled:Z

    return-object p0
.end method
