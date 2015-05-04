//
//  NSString+MyString.h
//  HuiXin
//
//  Created by apple on 13-12-11.
//  Copyright (c) 2013年 惠卡. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MyString)

+ (NSString *)stringBySpaceTrim:(NSString *)string;

/// 替换@为#
- (NSString *)replacingAtWithOctothorpe;
- (NSString *)replacingOctothorpeWithAt;

/// 将回车转成空格
- (NSString *)replacingEnterWithNull;

//生成count位的**，用于用户隐私时替换字符串
+ (NSString *)creatStarWithCount:(NSUInteger)count;
+ (NSString *)hideStringWithStar:(NSString *)idStr;

/// 是否包含汉字
+ (BOOL)containsChinese:(NSString *)string;

+ (NSString *)stringByNull:(NSString*)string;
+ (BOOL)isNull:(NSString *)string;
+ (BOOL)isEmptyAfterSpaceTrim:(NSString *)string;

- (BOOL)isBlank;

/// 判断是否纯数字
+ (BOOL)isPureInt:(NSString*)string;

/// 判断浮点型
+ (BOOL)isPureFloat:(NSString*)string;

/// 手机号添加空格
+ (NSString *)addBlank:(NSString *)phone;

/// 浮点型数据不四舍五入
+(NSString *)notRounding:(double)price afterPoint:(int)position;

@end
