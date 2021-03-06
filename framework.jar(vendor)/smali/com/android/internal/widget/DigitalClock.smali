.class public Lcom/android/internal/widget/DigitalClock;
.super Landroid/widget/RelativeLayout;
.source "DigitalClock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/widget/DigitalClock$FormatChangeObserver;,
        Lcom/android/internal/widget/DigitalClock$AmPm;,
        Lcom/android/internal/widget/DigitalClock$TimeChangedReceiver;
    }
.end annotation


# static fields
.field private static final M12:Ljava/lang/String; = "h:mm"

.field private static final M24:Ljava/lang/String; = "kk:mm"

.field private static final SYSTEM:Ljava/lang/String; = "/system/fonts/"

.field private static final SYSTEM_FONT_TIME_BACKGROUND:Ljava/lang/String; = "/system/fonts/AndroidClock.ttf"

.field private static final SYSTEM_FONT_TIME_FOREGROUND:Ljava/lang/String; = "/system/fonts/AndroidClock_Highlight.ttf"

.field private static final sBackgroundFont:Landroid/graphics/Typeface;

.field private static final sForegroundFont:Landroid/graphics/Typeface;


# instance fields
.field private mAmPm:Lcom/android/internal/widget/DigitalClock$AmPm;

.field private mAttached:I

.field private mCalendar:Ljava/util/Calendar;

.field private mClockFormat:Ljava/text/SimpleDateFormat;

.field private mClockFormatString:Ljava/lang/String;

.field private mFormat:Ljava/lang/String;

.field private mFormatChangeObserver:Landroid/database/ContentObserver;

.field private final mHandler:Landroid/os/Handler;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mTimeDisplayBackground:Landroid/widget/TextView;

.field private mTimeDisplayForeground:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    const-string v0, "/system/fonts/AndroidClock.ttf"

    invoke-static {v0}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lcom/android/internal/widget/DigitalClock;->sBackgroundFont:Landroid/graphics/Typeface;

    .line 76
    const-string v0, "/system/fonts/AndroidClock_Highlight.ttf"

    invoke-static {v0}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lcom/android/internal/widget/DigitalClock;->sForegroundFont:Landroid/graphics/Typeface;

    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 167
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/widget/DigitalClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 168
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 171
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 65
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/widget/DigitalClock;->mAttached:I

    .line 68
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mHandler:Landroid/os/Handler;

    .line 172
    return-void
.end method

.method static synthetic access$002(Lcom/android/internal/widget/DigitalClock;Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 47
    iput-object p1, p0, Lcom/android/internal/widget/DigitalClock;->mCalendar:Ljava/util/Calendar;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/internal/widget/DigitalClock;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/android/internal/widget/DigitalClock;->updateTime()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/internal/widget/DigitalClock;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 47
    iget-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/internal/widget/DigitalClock;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/android/internal/widget/DigitalClock;->setDateFormat()V

    return-void
.end method

.method private setDateFormat()V
    .locals 3

    .prologue
    .line 321
    invoke-virtual {p0}, Lcom/android/internal/widget/DigitalClock;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "kk:mm"

    :goto_0
    iput-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mFormat:Ljava/lang/String;

    .line 323
    iget-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mAmPm:Lcom/android/internal/widget/DigitalClock$AmPm;

    iget-object v1, p0, Lcom/android/internal/widget/DigitalClock;->mFormat:Ljava/lang/String;

    const-string v2, "h:mm"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/DigitalClock$AmPm;->setShowAmPm(Z)V

    .line 324
    return-void

    .line 321
    :cond_0
    const-string v0, "h:mm"

    goto :goto_0
.end method

.method private updateTime()V
    .locals 22

    .prologue
    .line 241
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/widget/DigitalClock;->mCalendar:Ljava/util/Calendar;

    move-object/from16 v19, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    invoke-virtual/range {v19 .. v21}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 245
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/widget/DigitalClock;->getContext()Landroid/content/Context;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v18

    .line 249
    .local v18, timeFormat:Z
    if-eqz v18, :cond_2

    .line 250
    const v15, 0x104007e

    .line 255
    .local v15, res:I
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/widget/DigitalClock;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 256
    .local v7, format:Ljava/lang/String;
    const v2, 0xef00

    .line 257
    .local v2, MAGIC1:C
    const v3, 0xef01

    .line 259
    .local v3, MAGIC2:C
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/widget/DigitalClock;->mClockFormatString:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_8

    .line 260
    const/4 v4, -0x1

    .line 261
    .local v4, a:I
    const/4 v14, 0x0

    .line 262
    .local v14, quoted:Z
    const/4 v9, 0x0

    .local v9, i:I
    :goto_1
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v19

    move/from16 v0, v19

    if-ge v9, v0, :cond_1

    .line 263
    invoke-virtual {v7, v9}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 265
    .local v6, c:C
    const/16 v19, 0x27

    move/from16 v0, v19

    if-ne v6, v0, :cond_0

    .line 266
    if-nez v14, :cond_3

    const/4 v14, 0x1

    .line 268
    :cond_0
    :goto_2
    if-nez v14, :cond_4

    const/16 v19, 0x61

    move/from16 v0, v19

    if-ne v6, v0, :cond_4

    .line 269
    move v4, v9

    .line 274
    .end local v6           #c:C
    :cond_1
    if-ltz v4, :cond_6

    .line 277
    move v5, v4

    .line 278
    .local v5, b:I
    :goto_3
    if-lez v4, :cond_5

    add-int/lit8 v19, v4, -0x1

    move/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->charAt(I)C

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 279
    add-int/lit8 v4, v4, -0x1

    goto :goto_3

    .line 252
    .end local v2           #MAGIC1:C
    .end local v3           #MAGIC2:C
    .end local v4           #a:I
    .end local v5           #b:I
    .end local v7           #format:Ljava/lang/String;
    .end local v9           #i:I
    .end local v14           #quoted:Z
    .end local v15           #res:I
    :cond_2
    const v15, 0x104007d

    .restart local v15       #res:I
    goto :goto_0

    .line 266
    .restart local v2       #MAGIC1:C
    .restart local v3       #MAGIC2:C
    .restart local v4       #a:I
    .restart local v6       #c:C
    .restart local v7       #format:Ljava/lang/String;
    .restart local v9       #i:I
    .restart local v14       #quoted:Z
    :cond_3
    const/4 v14, 0x0

    goto :goto_2

    .line 262
    :cond_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 281
    .end local v6           #c:C
    .restart local v5       #b:I
    :cond_5
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v7, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const v20, 0xef00

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "a"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const v20, 0xef01

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v19

    add-int/lit8 v20, v5, 0x1

    move/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 285
    .end local v5           #b:I
    :cond_6
    new-instance v16, Ljava/text/SimpleDateFormat;

    move-object/from16 v0, v16

    invoke-direct {v0, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .local v16, sdf:Ljava/text/SimpleDateFormat;
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/widget/DigitalClock;->mClockFormat:Ljava/text/SimpleDateFormat;

    .line 286
    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/internal/widget/DigitalClock;->mClockFormatString:Ljava/lang/String;

    .line 290
    .end local v4           #a:I
    .end local v9           #i:I
    .end local v14           #quoted:Z
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/widget/DigitalClock;->mCalendar:Ljava/util/Calendar;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v13

    .line 292
    .local v13, newTime:Ljava/lang/String;
    const v19, 0xef00

    move/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    .line 293
    .local v11, magic1:I
    const v19, 0xef01

    move/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    .line 294
    .local v12, magic2:I
    new-instance v8, Landroid/text/SpannableStringBuilder;

    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v8, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 295
    .local v8, formatted:Landroid/text/SpannableStringBuilder;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v10

    .line 296
    .local v10, language:Ljava/lang/String;
    if-ltz v11, :cond_7

    if-le v12, v11, :cond_7

    .line 297
    if-eqz v18, :cond_9

    .line 298
    add-int/lit8 v19, v12, 0x1

    move/from16 v0, v19

    invoke-virtual {v8, v11, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 316
    :cond_7
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/widget/DigitalClock;->mTimeDisplayBackground:Landroid/widget/TextView;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/widget/DigitalClock;->mTimeDisplayForeground:Landroid/widget/TextView;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/widget/DigitalClock;->mAmPm:Lcom/android/internal/widget/DigitalClock$AmPm;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/widget/DigitalClock;->mCalendar:Ljava/util/Calendar;

    move-object/from16 v19, v0

    const/16 v21, 0x9

    move-object/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v19

    if-nez v19, :cond_c

    const/16 v19, 0x1

    :goto_6
    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/DigitalClock$AmPm;->setIsMorning(Z)V

    .line 319
    return-void

    .line 288
    .end local v8           #formatted:Landroid/text/SpannableStringBuilder;
    .end local v10           #language:Ljava/lang/String;
    .end local v11           #magic1:I
    .end local v12           #magic2:I
    .end local v13           #newTime:Ljava/lang/String;
    .end local v16           #sdf:Ljava/text/SimpleDateFormat;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/widget/DigitalClock;->mClockFormat:Ljava/text/SimpleDateFormat;

    move-object/from16 v16, v0

    .restart local v16       #sdf:Ljava/text/SimpleDateFormat;
    goto/16 :goto_4

    .line 300
    .restart local v8       #formatted:Landroid/text/SpannableStringBuilder;
    .restart local v10       #language:Ljava/lang/String;
    .restart local v11       #magic1:I
    .restart local v12       #magic2:I
    .restart local v13       #newTime:Ljava/lang/String;
    :cond_9
    new-instance v17, Landroid/text/style/RelativeSizeSpan;

    const v19, 0x3ecccccd

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-direct {v0, v1}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 301
    .local v17, style:Landroid/text/style/CharacterStyle;
    const-string/jumbo v19, "zh"

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_a

    const-string v19, "ko"

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_b

    .line 302
    :cond_a
    const/16 v19, 0x12

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v8, v0, v11, v12, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 304
    add-int/lit8 v19, v12, 0x2

    move/from16 v0, v19

    invoke-virtual {v8, v12, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 305
    add-int/lit8 v19, v11, 0x1

    move/from16 v0, v19

    invoke-virtual {v8, v11, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    goto :goto_5

    .line 307
    :cond_b
    const/16 v19, 0x12

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v8, v0, v11, v12, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 309
    add-int/lit8 v19, v12, 0x1

    move/from16 v0, v19

    invoke-virtual {v8, v12, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 310
    add-int/lit8 v19, v11, 0x1

    move/from16 v0, v19

    invoke-virtual {v8, v11, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_5

    .line 318
    .end local v17           #style:Landroid/text/style/CharacterStyle;
    :cond_c
    const/16 v19, 0x0

    goto :goto_6
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 5

    .prologue
    .line 193
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onAttachedToWindow()V

    .line 195
    iget v1, p0, Lcom/android/internal/widget/DigitalClock;->mAttached:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/internal/widget/DigitalClock;->mAttached:I

    .line 198
    iget-object v1, p0, Lcom/android/internal/widget/DigitalClock;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    if-nez v1, :cond_0

    .line 199
    new-instance v1, Lcom/android/internal/widget/DigitalClock$TimeChangedReceiver;

    invoke-direct {v1, p0}, Lcom/android/internal/widget/DigitalClock$TimeChangedReceiver;-><init>(Lcom/android/internal/widget/DigitalClock;)V

    iput-object v1, p0, Lcom/android/internal/widget/DigitalClock;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 200
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 201
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.TIME_TICK"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 202
    const-string v1, "android.intent.action.TIME_SET"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 203
    const-string v1, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 204
    iget-object v1, p0, Landroid/view/View;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/widget/DigitalClock;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 208
    .end local v0           #filter:Landroid/content/IntentFilter;
    :cond_0
    iget-object v1, p0, Lcom/android/internal/widget/DigitalClock;->mFormatChangeObserver:Landroid/database/ContentObserver;

    if-nez v1, :cond_1

    .line 209
    new-instance v1, Lcom/android/internal/widget/DigitalClock$FormatChangeObserver;

    invoke-direct {v1, p0}, Lcom/android/internal/widget/DigitalClock$FormatChangeObserver;-><init>(Lcom/android/internal/widget/DigitalClock;)V

    iput-object v1, p0, Lcom/android/internal/widget/DigitalClock;->mFormatChangeObserver:Landroid/database/ContentObserver;

    .line 210
    iget-object v1, p0, Landroid/view/View;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/android/internal/widget/DigitalClock;->mFormatChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 214
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/widget/DigitalClock;->updateTime()V

    .line 215
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 219
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    .line 221
    iget v0, p0, Lcom/android/internal/widget/DigitalClock;->mAttached:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/android/internal/widget/DigitalClock;->mAttached:I

    .line 223
    iget-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 224
    iget-object v0, p0, Landroid/view/View;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/internal/widget/DigitalClock;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 226
    :cond_0
    iget-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mFormatChangeObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_1

    .line 227
    iget-object v0, p0, Landroid/view/View;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/widget/DigitalClock;->mFormatChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 231
    :cond_1
    iput-object v2, p0, Lcom/android/internal/widget/DigitalClock;->mFormatChangeObserver:Landroid/database/ContentObserver;

    .line 232
    iput-object v2, p0, Lcom/android/internal/widget/DigitalClock;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 233
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 176
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 179
    const v0, 0x10202a5

    invoke-virtual {p0, v0}, Lcom/android/internal/widget/DigitalClock;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mTimeDisplayBackground:Landroid/widget/TextView;

    .line 180
    iget-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mTimeDisplayBackground:Landroid/widget/TextView;

    sget-object v1, Lcom/android/internal/widget/DigitalClock;->sBackgroundFont:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 181
    iget-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mTimeDisplayBackground:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 183
    const v0, 0x10202a6

    invoke-virtual {p0, v0}, Lcom/android/internal/widget/DigitalClock;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mTimeDisplayForeground:Landroid/widget/TextView;

    .line 184
    iget-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mTimeDisplayForeground:Landroid/widget/TextView;

    sget-object v1, Lcom/android/internal/widget/DigitalClock;->sForegroundFont:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 185
    new-instance v0, Lcom/android/internal/widget/DigitalClock$AmPm;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/internal/widget/DigitalClock$AmPm;-><init>(Landroid/view/View;Landroid/graphics/Typeface;)V

    iput-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mAmPm:Lcom/android/internal/widget/DigitalClock$AmPm;

    .line 186
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/widget/DigitalClock;->mCalendar:Ljava/util/Calendar;

    .line 188
    invoke-direct {p0}, Lcom/android/internal/widget/DigitalClock;->setDateFormat()V

    .line 189
    return-void
.end method

.method updateTime(Ljava/util/Calendar;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 236
    iput-object p1, p0, Lcom/android/internal/widget/DigitalClock;->mCalendar:Ljava/util/Calendar;

    .line 237
    invoke-direct {p0}, Lcom/android/internal/widget/DigitalClock;->updateTime()V

    .line 238
    return-void
.end method
