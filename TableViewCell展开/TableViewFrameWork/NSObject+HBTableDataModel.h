//
//  NSObject+HBTableDataModel.h
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HBTableDataModel)

 
/**
 请求的数据源
 
 @param model list
 @param height cell的高度
 @param identifier 标示符
 @param isNib 是否是Nib
 */
+ (NSMutableArray *)requestTableDataSource:(id)dataArray rowHeight:(CGFloat)height className:(NSString *)className isNib:(BOOL)isNib;
/**
 请求的数据源
 
 @param model list
 @param height cell的高度
 @param identifier 标示符
 @param isNib 是否是Nib
 @param headerHeight 头部视图高度
 @param headerView 头部视图View
 
 */
+ (NSMutableArray *)requestTableDataSource:(NSMutableArray *)dataArray rowHeight:(CGFloat)height className:(NSString *)className isNib:(BOOL)isNib sectionHeaderHeight:(CGFloat)headerHeight sectionHeaderView:(UIView * __nullable)headerView;
/**
 数据请求 子类重写
 */
- (NSMutableArray *)requestTableDataSource:(id)dataArray;

@end

NS_ASSUME_NONNULL_END
