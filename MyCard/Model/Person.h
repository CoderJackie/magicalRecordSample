//
//  Person.h
//  MyCard
//
//  Created by xujiaqi on 15/5/4.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * name;

@end
