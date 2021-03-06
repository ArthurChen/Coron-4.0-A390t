.class public abstract Landroid/theme/IThemeManager$Stub;
.super Landroid/os/Binder;
.source "IThemeManager.java"

# interfaces
.implements Landroid/theme/IThemeManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/theme/IThemeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/theme/IThemeManager$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "android.theme.IThemeManager"

.field static final TRANSACTION_getAppliedTheme:I = 0x4

.field static final TRANSACTION_getThemes:I = 0x1

.field static final TRANSACTION_setTheme:I = 0x2

.field static final TRANSACTION_unsetTheme:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 18
    const-string v0, "android.theme.IThemeManager"

    invoke-virtual {p0, p0, v0}, Landroid/theme/IThemeManager$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 19
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/theme/IThemeManager;
    .locals 2
    .parameter "obj"

    .prologue
    .line 26
    if-nez p0, :cond_0

    .line 27
    const/4 v0, 0x0

    .line 33
    :goto_0
    return-object v0

    .line 29
    :cond_0
    const-string v1, "android.theme.IThemeManager"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 30
    .local v0, iin:Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/theme/IThemeManager;

    if-eqz v1, :cond_1

    .line 31
    check-cast v0, Landroid/theme/IThemeManager;

    goto :goto_0

    .line 33
    :cond_1
    new-instance v0, Landroid/theme/IThemeManager$Stub$Proxy;

    .end local v0           #iin:Landroid/os/IInterface;
    invoke-direct {v0, p0}, Landroid/theme/IThemeManager$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    .line 37
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 6
    .parameter "code"
    .parameter "data"
    .parameter "reply"
    .parameter "flags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 41
    sparse-switch p1, :sswitch_data_0

    .line 103
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v4

    :goto_0
    return v4

    .line 45
    :sswitch_0
    const-string v3, "android.theme.IThemeManager"

    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 50
    :sswitch_1
    const-string v3, "android.theme.IThemeManager"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 51
    invoke-virtual {p0}, Landroid/theme/IThemeManager$Stub;->getThemes()Ljava/util/List;

    move-result-object v2

    .line 52
    .local v2, _result:Ljava/util/List;,"Ljava/util/List<Landroid/theme/ThemeInfo;>;"
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 53
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    goto :goto_0

    .line 58
    .end local v2           #_result:Ljava/util/List;,"Ljava/util/List<Landroid/theme/ThemeInfo;>;"
    :sswitch_2
    const-string v5, "android.theme.IThemeManager"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_1

    .line 61
    sget-object v5, Landroid/theme/ThemeInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v5, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/theme/ThemeInfo;

    .line 66
    .local v0, _arg0:Landroid/theme/ThemeInfo;
    :goto_1
    invoke-virtual {p0, v0}, Landroid/theme/IThemeManager$Stub;->setTheme(Landroid/theme/ThemeInfo;)Z

    move-result v1

    .line 67
    .local v1, _result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 68
    if-eqz v1, :cond_0

    move v3, v4

    :cond_0
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 64
    .end local v0           #_arg0:Landroid/theme/ThemeInfo;
    .end local v1           #_result:Z
    :cond_1
    const/4 v0, 0x0

    .restart local v0       #_arg0:Landroid/theme/ThemeInfo;
    goto :goto_1

    .line 73
    .end local v0           #_arg0:Landroid/theme/ThemeInfo;
    :sswitch_3
    const-string v5, "android.theme.IThemeManager"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_3

    .line 76
    sget-object v5, Landroid/theme/ThemeInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v5, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/theme/ThemeInfo;

    .line 81
    .restart local v0       #_arg0:Landroid/theme/ThemeInfo;
    :goto_2
    invoke-virtual {p0, v0}, Landroid/theme/IThemeManager$Stub;->unsetTheme(Landroid/theme/ThemeInfo;)Z

    move-result v1

    .line 82
    .restart local v1       #_result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 83
    if-eqz v1, :cond_2

    move v3, v4

    :cond_2
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 79
    .end local v0           #_arg0:Landroid/theme/ThemeInfo;
    .end local v1           #_result:Z
    :cond_3
    const/4 v0, 0x0

    .restart local v0       #_arg0:Landroid/theme/ThemeInfo;
    goto :goto_2

    .line 88
    .end local v0           #_arg0:Landroid/theme/ThemeInfo;
    :sswitch_4
    const-string v5, "android.theme.IThemeManager"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, _arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/theme/IThemeManager$Stub;->getAppliedTheme(Ljava/lang/String;)Landroid/theme/ThemeInfo;

    move-result-object v1

    .line 92
    .local v1, _result:Landroid/theme/ThemeInfo;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 93
    if-eqz v1, :cond_4

    .line 94
    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 95
    invoke-virtual {v1, p3, v4}, Landroid/theme/ThemeInfo;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_0

    .line 98
    :cond_4
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 41
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
