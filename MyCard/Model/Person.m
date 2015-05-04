//
//  Person.m
//  MyCard
//
//  Created by xujiaqi on 15/5/4.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import "Person.h"


@implementation Person

@dynamic age;
@dynamic name;

+ (NSString *)entityName
{
    return @"Person";
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"姓名：%@, 年龄：%@", self.name, self.age];
}
@end
