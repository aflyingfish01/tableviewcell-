//
//  HBMenuItemModel.m
//  HBStockWarning
//
//  Created by hulailin on 16/7/12.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import "HBMenuItemModel.h"

@implementation HBMenuItemModel


+ (instancetype)menuItemModel:(NSString *)imageNormal title:(NSString *)itemText{
    HBMenuItemModel *cellModel = [[self alloc]init];
    cellModel.imageName = imageNormal;
    cellModel.itemText = itemText;
    return cellModel;
}


+(instancetype)menuItemModel:(NSString *)imageName itemName:(NSString *)itemText handler:(HBItemHandler)itemHandler{
    HBMenuItemModel *cellModel =[[HBMenuItemModel alloc] init];
    cellModel.imageName = imageName;
    cellModel.itemText = itemText;
    cellModel.itemHandler = itemHandler;
    return cellModel;
}
@end
