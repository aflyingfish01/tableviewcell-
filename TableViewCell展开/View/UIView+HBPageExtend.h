//
//  UIView+YNPageExtend.h
//  HBPageViewController
//
//  Created by ZYN on 2018/4/22.
//  Copyright © 2018年 yongneng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPAGE_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define kPAGE_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define kPAGE_IS_IPHONE_X  ((kPAGE_SCREEN_HEIGHT == 812.0f && kPAGE_SCREEN_WIDTH == 375.0f) ? YES : NO)

#define kPAGE_NAVHEIGHT (kPAGE_IS_IPHONE_X ? 88 : 64)

#define kPAGE_TABBARHEIGHT (kPAGE_IS_IPHONE_X ? 83 : 49)
//强弱引用
#define WEAK_SELF __weak typeof(self)weakSelf = self
#define STRONG_SELF __strong typeof(weakSelf)self = weakSelf


@interface UIView (HBPageExtend)

@property (nonatomic, assign) CGFloat hb_x;

@property (nonatomic, assign) CGFloat hb_y;

@property (nonatomic, assign) CGFloat hb_width;

@property (nonatomic, assign) CGFloat hb_height;

@property (nonatomic, assign) CGFloat hb_bottom;

@end
