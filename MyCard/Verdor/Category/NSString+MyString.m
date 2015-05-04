//
//  NSString+MyString.m
//  HuiXin
//
//  Created by apple on 13-12-11.
//  Copyright (c) 2013年 惠卡. All rights reserved.
//

#import "NSString+MyString.h"

@implementation NSString (MyString)

// 去空格
+ (NSString *)stringBySpaceTrim:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)replacingAtWithOctothorpe
{
    return [self stringByReplacingOccurrencesOfString:@"@" withString:@"#"];
}

- (NSString *)replacingOctothorpeWithAt
{
    return [self stringByReplacingOccurrencesOfString:@"#" withString:@"@"];
}

// 将回车转成空格
- (NSString *)replacingEnterWithNull
{
    return [self stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}

// 是否包含汉字
+ (BOOL)containsChinese:(NSString *)string
{
    for (int i = 0; i < [string length]; i++)
    {
        int a = [string characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    
    return NO;
}

/*
// 回车转@""
+ (NSString *)stringByEnter:(NSString*)string
{
    for (int i = 0; i < [string length]; i++)
    {
        int a = [string characterAtIndex:i];
        if (a == 0x0d)
        {
            a = 0x20;
        }
    }
    return string;
}
 */

// null转@""
+ (NSString*)stringByNull:(NSString*)string
{
    if (!string)
    {
        return @"";
    }
    return string;
}

// null或者@""都返回yes
+ (BOOL)isNull:(NSString *)string
{
    if (!string || [string isEqualToString:@""])
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)isBlank
{
    if([[self stringByStrippingWhitespace] length] == 0)
    {
        return YES;
    }
    
    return NO;
}

- (NSString *)stringByStrippingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

// 判断是否为整形：
+ (BOOL)isPureInt:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

// 判断是否为浮点形：
+ (BOOL)isPureFloat:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

+ (BOOL)isEmptyAfterSpaceTrim:(NSString *)string
{
    NSString *str = [self stringBySpaceTrim:string];
    if (str.length == 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//生成count位的**，用于用户隐私时替换字符串
+ (NSString *)creatStarWithCount:(NSUInteger)count
{
    NSString *star = @"";
    for (int i = 0; i < count; i++) {
        star = [star stringByAppendingString:@"*"];
    }
    return star;
}


// 手机号添加空格
+ (NSString *)addBlank:(NSString *)phone
{
    // 去掉-
    phone = [phone stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSMutableString *string = [NSMutableString string];
    for (int i = 0;i< phone.length; i++)
    {
        if (i == 2 ||i == 6)
        {
            [string appendString:[NSString stringWithFormat:@"%@ ",[phone substringWithRange:NSMakeRange(i, 1)]]];
        }
        else
        {
            [string appendString:[phone substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    return string;
}

// 浮点型数据不四舍五入
+ (NSString *)notRounding:(double)price afterPoint:(int)position
{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal = nil;
    NSDecimalNumber *roundedOunces = nil;
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithDouble:price];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    return [NSString stringWithFormat:@"%.2f",[roundedOunces doubleValue]];
}

@end
