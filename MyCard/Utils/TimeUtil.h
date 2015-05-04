//
//  TimeUtil.h
//  wq
//
//  Created by berwin on 13-7-20.
//  Copyright (c) 2013年 Weqia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtil : NSObject

+ (NSString*)getTimeStr:(long) createdAt;

+ (NSString*)getFullTimeStr:(long long)time;

+ (NSString*)getMDStr:(long long)time;

+(NSDateComponents*) getComponent:(long long)time;

+(NSString*) getTimeStrStyle1:(long long)time;

+(NSString*) getTimeStrStyle2:(long long)time;

+(NSString*) getTimeStrStyle3:(long long)time;

//dataFormat
+ (NSString*)getDate:(NSDate*)date withFormat:(NSString*)dataFormat;
+ (NSDate*)getDateWithDateString:(NSString*)date dateFormat:(NSString*)format;
//默认格式时间，聊天用
+ (NSString*)getDefaultDateFormat:(NSDate*)date;
//获取消息列表时间格式
+ (NSString*)getMessageDateFormat:(NSDate*)date;
//聊天时间格式
+ (NSString*)getChatDateFormat:(NSDate*)date;
//获取朋友圈时间格式
+ (NSString*)getFriendsCircleDateFormat:(NSDate*)date;
//
+ (NSString*)getTimeStrStyle4:(NSDate *)date;

// begin 新增方法 张绍裕 20150204

/// 时间格式 n分钟前，或n小时前，或n天前，或n个月前
+ (NSString *)GetTimeDayStyleWithTimeInterval:(NSTimeInterval)time;

// 时间格式 n分钟前，或n小时前，或n天前，或n个月前（时间差，服务器时间与比较时间）
+ (NSString *)GetTimeStyleWithTimeInterval:(NSTimeInterval)time;

/// 时间格式 根据格式获取相应字符 2015-02-04 12:30:44:333
+ (NSString *)GetTimeStrWithTimeInterval:(NSTimeInterval)time format:(NSString *)format;
+ (NSString *)GetTimeStrWithDate:(NSDate *)date format:(NSString *)format;


// end

@end
