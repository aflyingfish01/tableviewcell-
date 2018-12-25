//
//  HBExpandableCellButton.m
//  HBStockWarning
//
//  Created by Jimmy on 16/6/30.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import "HBExpandableCellButton.h"

@interface HBExpandableCellButton()
@property(nonatomic, strong) HBMenuItemModel *menuItemModel;
@end

@implementation HBExpandableCellButton


- (instancetype)initWithFrame:(CGRect)frame  model:(HBMenuItemModel *)menuItemModel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.menuItemModel = menuItemModel;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addTarget:self
                           action:@selector(menuItemhandler:)
                 forControlEvents:UIControlEventTouchUpInside];
        [self customViewWithModel:menuItemModel];
    }
    return self;
}

- (void)menuItemhandler:(UIButton *)btn{
    btn.backgroundColor = [UIColor clearColor];
    //执行模型响应事件
    if (self.menuItemModel.itemHandler) {
        self.menuItemModel.itemHandler();
    }
    
}

#pragma mark  设置自己image图片以及title
-(void)setImageForStateSelected:(UIImage *)selected andImageForNormal:(UIImage *)normal andTitle:(NSString*)normalTitle andSelectedTitle:(NSString *)selectedTitle
{
  
    [self setImage:normal forState:UIControlStateNormal];
    [self setImage:selected forState:UIControlStateSelected];
    [self setTitle:normalTitle forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1]  forState:UIControlStateNormal];
    [self setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
     self.backgroundColor =  [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    self.titleLabel.font = [UIFont systemFontOfSize: 12.5];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    if (normalTitle) {
        self.imageEdgeInsets = UIEdgeInsetsMake(0,-2,0,self.titleLabel.bounds.size.width);//设置
        self.contentEdgeInsets = UIEdgeInsetsMake(0,5,0,0);
    }
    [self setTitle:selectedTitle forState:UIControlStateSelected];
 
}


- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}
- (void)customViewWithModel:(HBMenuItemModel *)menuItemModel
{
    [self setImageForStateSelected:[UIImage imageNamed:menuItemModel.imageName] andImageForNormal:[UIImage imageNamed:menuItemModel.imageName ] andTitle:menuItemModel.itemText andSelectedTitle:menuItemModel.itemText];
    
}



@end
