//
//  HBMenuItemModel.h
//  HBStockWarning
//
//  Created by hulailin on 16/7/12.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBMenuItemModel : NSObject

 
//旧代码 等待废弃
+ (instancetype)menuItemModel:(NSString *)imageNormal title:(NSString *)itemText;


typedef void (^HBItemHandler)(void);
/** 正常状态下图片名称 */
@property(nonatomic, copy) NSString *imageName;
/** 名称 */
@property (nonatomic, strong) NSString *itemText;
/** 响应代码块 */
@property (nonatomic, copy) HBItemHandler itemHandler;

+(instancetype)menuItemModel:(NSString *)imageName itemName:(NSString *)itemText handler:(HBItemHandler)itemHandler;

@end
