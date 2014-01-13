//
//  Constant.h
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/8/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#ifndef FWFCustomTabBar_Constant_h
#define FWFCustomTabBar_Constant_h


#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)  //获取屏幕 宽度
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height) //获取屏幕 高度

#define IOSVersion      [[[UIDevice currentDevice] systemVersion] floatValue]   //6.1  7.0

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



#endif
