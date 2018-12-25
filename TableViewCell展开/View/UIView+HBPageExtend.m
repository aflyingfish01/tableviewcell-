//
//  UIView+hbPageExtend.m
//  HBPageViewController
//
//  Created by Zhb on 2018/4/22.
//  Copyright © 2018年 yongneng. All rights reserved.
//

#import "UIView+HBPageExtend.h"

@implementation UIView (HBPageExtend)
- (void)setHb_x:(CGFloat)hb_x {
    CGRect frame = self.frame;
    frame.origin.x = hb_x;
    self.frame = frame;
}


- (CGFloat)hb_x {
    return self.frame.origin.x;
}

- (void)setHb_y:(CGFloat)hb_y {
    CGRect frame = self.frame;
    frame.origin.y = hb_y;
    self.frame = frame;
}

- (CGFloat)hb_y {
    return self.frame.origin.y;
}

- (CGFloat)hb_width {
    return self.frame.size.width;
}

- (void)setHb_width:(CGFloat)hb_width {
    CGRect frame = self.frame;
    frame.size.width = hb_width;
    self.frame = frame;
}

- (CGFloat)hb_height {
    return self.frame.size.height;
}

- (void)setHb_height:(CGFloat)hb_height {
    CGRect frame = self.frame;
    frame.size.height = hb_height;
    self.frame = frame;
}

- (void)setHb_bottom:(CGFloat)hb_bottom{
    
}

- (CGFloat)hb_bottom {
    return self.frame.size.height + self.frame.origin.y;
}

@end
