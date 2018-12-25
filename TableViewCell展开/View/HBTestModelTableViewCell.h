//
//  HBFinacingQueryTableViewCell.h
//  HBStockWarning
//
//  Created by hbzq on 2018/12/24.
//  Copyright © 2018 Touker. All rights reserved.
//

#import "HBTableViewCell.h"
#import "HBExtensiveCellContainerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface HBTestModelTableViewCell : HBTableViewCell



/**
 下拉箭头block

 @param menuCell cell
 @param moreButton 按钮
 */
typedef void(^HBOpenMenuCellHandler)(HBTestModelTableViewCell *menuCell,UIButton *moreButton);
/**
 点击的按钮
 
 @param menuCell menuCell description
 @param menuItemIndex 位数
 */
typedef void (^HBDidSeletedMentItemHandler)(HBTestModelTableViewCell * menuCell,NSInteger menuItemIndex);


/** 下拉菜单视图*/
@property (weak, nonatomic) IBOutlet HBExtensiveCellContainerView *menuView;



@property(nonatomic, copy) HBOpenMenuCellHandler openMenuCellHandler;
@property(nonatomic, copy) HBDidSeletedMentItemHandler didSeletedMentItemHandler;





@end

NS_ASSUME_NONNULL_END
