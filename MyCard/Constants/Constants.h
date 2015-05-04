//
//  Constants.h
//  MyCard
//
//  Created by xujiaqi on 15/4/28.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#define MR_SHORTHAND

//-------------------导入头文件-------------------------

#import "SuperVC.h"
#import "SuperScrollVC.h"
#import "SandboxFile.h"
#import "DataHelper.h"
#import "TimeUtil.h"
#import "UIImage+Tool.h"
#import "CoreData+MagicalRecord.h"
#import "NSString+MyString.h"

//-------------------导入头文件-------------------------


//-------------------环境切换-------------------------

#define isTrueEnvironment 1

#if isTrueEnvironment

#pragma mark- 真实环境

#define kServerHost     @""
#define kServerResourceHost @""

#else

#pragma mark- 测试环境

#define kServerHost     @""
#define kServerResourceHost @""

#endif

//-------------------环境切换-------------------------


//-------------------获取设备大小-------------------------

//除去状态栏
#define kScreenWidth [UIScreen mainScreen].applicationFrame.size.width
#define kScreenHeight       [UIScreen mainScreen].applicationFrame.size.height
#define kAllHeight          ([UIScreen mainScreen].applicationFrame.size.height + 20.0)
#define kBodyHeight         ([UIScreen mainScreen].applicationFrame.size.height - 44.0)
#define kTabbarHeight       49
#define kSearchBarHeight    45

//-------------------获取设备大小-------------------------



//----------------------系统----------------------------

#define ISiPhone    [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define ISiPad      [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad
#define ISiPhone5   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define ISiPhone6p   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define ISIOS6      ([[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define ISIOS7      ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define ISIOS8      ([[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )

//----------------------系统----------------------------



//----------------------颜色类---------------------------
/// 设置颜色
#define UIColorRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

/// 设置颜色 示例：UIColorHex(0x26A7E8)
#define UIColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/// 设置颜色与透明度 示例：UIColorHEX_Alpha(0x26A7E8, 0.5)
#define UIColorHex_Alpha(rgbValue, al) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:al]

/// 导航栏背景颜色
#define kColorNavBground UIColorHex(0x232736)

// 主题背景色
//#define kBackgroundColor UIColorHex(0xe6e6e6)
#define kBackgroundColor UIColorRGB(238,241,241)
// cell高亮颜色
#define kCellHightedColor UIColorHex(0xe6e6e9)
/// 通用的红色文字颜色
#define kColorFontRed UIColorHex(0xe12228)

/// 透明色
#define kColorClear [UIColor clearColor]

/// 白色-如导航栏字体颜色
#define kColorWhite UIColorHex(0xffffff)

/// 淡灰色-如普通界面的背景颜色
#define kColorLightgrayBackground UIColorHex(0xf5f5f5)

/// 灰色—如内容字体颜色
#define kColorLightgrayContent UIColorHex(0x969696)

/// 灰色-如输入框占位符字体颜色
#define kColorLightgrayPlaceholder UIColorRGB(198,198,204)

/// 深灰色
#define kColorDarkgray UIColorHex(0x666666)

/// 黑色-如输入框输入字体颜色或标题颜色
#define kColorBlack UIColorHex(0x333333)

/// 黑色-细黑
#define kColorBlacklight UIColorHex(0x999999)

/// 黑色-纯黑
#define kColorDeepBlack UIColorHex(0x000000)

/// 灰色—如列表cell分割线颜色
// begin

#define kColorSeparatorlineDark UIColorHex(0xd1d1d1)

#define kColorSeparatorline UIColorHex(0xdfdfe1)
// end

/// 淡灰色-输入框字色
#define kColorLightGray UIColorHex(0xb1b1b1)

/// 灰色—如列表cell分割线颜色较深e5样式
#define kColorSeparatorline5 UIColorHex(0xe5e5e5)

/// 灰色-边框线颜色
#define kColorBorderline UIColorHex(0xb8b8b8)

/// 绿色-如导航栏背景颜色
#define kColorGreenNavBground UIColorHex(0x38ad7a)

/// 绿色
#define kColorGreen UIColorHex(0x349c6f)

/// 深绿色
#define kColorDarkGreen UIColorHex(0x188d5a)

/// 橙色
#define kColorOrange UIColorHex(0xf39700)

/// 深橙色
#define kColorDarkOrange UIColorHex(0xe48437)

/// 淡紫色
#define kColorLightPurple UIColorHex(0x909af8)

/// 红色
#define kColorRed UIColorHex(0xfd492e)

/// 蓝色
#define kColorBlue UIColorHex(0x00a0e9)

/// 高雅黑
#define kColorElegantBlack UIColorRGB(29, 31, 38)

/// 白色
#define kColorWhitelight UIColorHex(0xfefefe)

/// 背景色
#define kColorBackGroundColor UIColorHex(0xeff0f2)


//----------------------颜色类--------------------------


/********************** time ****************************/

#pragma mark - 时间格式

#define kDateFormatDefault     @"yyyy-MM-dd HH:mm:ss"
#define kDateFormat_yyMdHm     @"yy-MM-dd HH:mm"
#define kDateFormat_yyyyMdHm   @"yyyy-MM-dd HH:mm"
#define kDateFormat_yMd        @"yyyy-MM-dd"
#define kDateFormat_MdHms      @"MM-dd HH:mm:ss"
#define kDateFormat_MdHm       @"MM-dd HH:mm"
#define kDateFormat_MdHm1      @"MM/dd HH:mm"
#define kDateFormatTime        @"HH:mm:ss"
#define kDateFormat_Hm         @"HH:mm"
#define kDateFormat_Md         @"MM-dd"
#define kDateFormat_yyMd       @"yy-MM-dd"
#define kDateFormat_YYMMdd     @"yyyyMMdd"
#define kDateFormat_yyyyMdHms  @"yyyyMMddHHmmss"
#define kDateFormat_yyyyMMddHHmmssSSS @"yyyy-MM-dd HH:mm:ss.SSS" // 精确到毫秒 张绍裕 20150204

/********************** time ****************************/


/// Dlog
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif


/// int to str
#define NSIntegerToNSString(intValue) [NSString stringWithFormat:@"%d", intValue]
#define CGfloatToNSString(floatValue) [NSString stringWithFormat:@"%f", floatValue]





