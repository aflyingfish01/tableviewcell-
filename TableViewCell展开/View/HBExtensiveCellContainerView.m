//
//  HBExtensiveCellContainerTableViewCell.m
//  HBStockWarning
//
//  Created by hbzq on 16/8/11.
//  Copyright © 2016年 Touker. All rights reserved.
//
#define MAX_ITEM_COUNT      5
#import "HBExtensiveCellContainerView.h"
#import "HBExpandableCellButton.h"
#import "UIView+HBPageExtend.h"
@interface HBExtensiveCellContainerView()

//是否已经绘制了下拉菜单
@property (nonatomic, assign) BOOL isAlreadyDrawMenu;

@end

@implementation HBExtensiveCellContainerView




#pragma mark - 根据模型初始化


- (void)initWithExtensiveItems:(NSArray *)itemsArray{
       [self configMenuItemArray:itemsArray];
}



- (void)configMenuItemArray:(NSArray *)array{
    
     //避免多次绘制下拉菜单
    if (self.isAlreadyDrawMenu){
        return;
    }
 
    for (int i = 0; i < array.count; i++) {
    
        
        CGRect menuItemRect = CGRectMake(i * kPAGE_SCREEN_WIDTH/array.count, 0, kPAGE_SCREEN_WIDTH/array.count, 44);
        HBExpandableCellButton *menuItemButton = [[HBExpandableCellButton alloc] initWithFrame:menuItemRect model:array[i]];
         menuItemButton.tag = i + 100;
         [self addSubview:menuItemButton];
        
      
        
        
        
    }
    
    //创建竖线
    for (int i = 0; i < array.count; i++) {
        //获取到对应的按钮
        UIButton *btn = [self viewWithTag:i + 100];
        
        UIView *label = [[UIView alloc] init];
        label.hb_x = CGRectGetMaxX(btn.frame);
        label.hb_y = 4;
        label.hb_width = 0.5;
        label.hb_height = 36;
        label.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0  blue:221/255.0  alpha:221/255.0 ];
        label.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:label];
        
    }
    UIView *bottemLabel = [[UIView alloc] init];
    bottemLabel.hb_x = 0;
    bottemLabel.hb_y =  0;
    bottemLabel.hb_width = kPAGE_SCREEN_WIDTH;
    bottemLabel.hb_height = 0.5;
    bottemLabel.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0  blue:221/255.0  alpha:221/255.0 ];
    [self addSubview:bottemLabel];
    
    self.isAlreadyDrawMenu = YES;
}

#pragma mark - private methods(私有方法)

#pragma mark - getters and setters

@end
