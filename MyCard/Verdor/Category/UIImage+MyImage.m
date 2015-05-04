//
//  UIImage+MyImage.m
//  JHAPP
//
//  Created by wenjun on 13-5-21.
//  Copyright (c) 2013年 wenjun. All rights reserved.
//

#import "UIImage+MyImage.h"

@implementation UIImage (MyImage)

+ (UIImage *)imageWithName:(NSString *)name
{
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    // 最低要求系统7.0以上时原方法读取不出图片，这里做区分。
    return [UIImage imageNamed:name];
#else
    NSString *fileString = nil;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        fileString = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_ipad@2x",name] ofType:@"png"];
        if (!fileString)
        {
            fileString = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_ipad",name] ofType:@"png"];
        }
    }
    else
    {
        if (ISiPhone5)
        {
            fileString = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@-568h@2x", name] ofType:@"png"];
            if (!fileString)
            {
                fileString = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@2x",name] ofType:@"png"];
                if (!fileString)
                {
                    fileString = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",name] ofType:@"png"];
                }
            }
        }
        else
        {
            fileString = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@2x", name] ofType:@"png"];
            if (!fileString)
            {
                fileString = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",name] ofType:@"png"];
            }
        }
    }
    
    if (fileString)
    {
        UIImage *image = [UIImage imageWithContentsOfFile:fileString];
        return image;
    }
    else
    {
        return nil;
    }
#endif
}

@end
