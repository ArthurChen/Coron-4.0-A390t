.class Landroid/content/res/AssetManager$baidu_1;
.super Landroid/database/ContentObserver;
.source "AssetManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/content/res/AssetManager;->setContext(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/content/res/AssetManager;


# direct methods
.method constructor <init>(Landroid/content/res/AssetManager;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    iput-object p1, p0, Landroid/content/res/AssetManager$baidu_1;->this$0:Landroid/content/res/AssetManager;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .parameter "selfChange"

    .prologue
    iget-object v0, p0, Landroid/content/res/AssetManager$baidu_1;->this$0:Landroid/content/res/AssetManager;

    #calls: Landroid/content/res/AssetManager;->readChannelPkgsBackgroud()V
    invoke-static {v0}, Landroid/content/res/AssetManager;->access$invoke-readChannelPkgsBackgroud-e69f20(Landroid/content/res/AssetManager;)V

    return-void
.end method
