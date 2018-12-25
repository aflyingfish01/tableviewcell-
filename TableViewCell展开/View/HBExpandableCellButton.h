//
//  HBExpandableCellButton.h
//  HBStockWarning
//
//  Created by Jimmy on 16/6/30.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBMenuItemModel.h"
@interface HBExpandableCellButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame  model:(HBMenuItemModel *)menuItemModel;

@end
