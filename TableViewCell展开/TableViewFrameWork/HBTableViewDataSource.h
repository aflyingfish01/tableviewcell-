//
//  HBTableDataSource.h
//  HBListTableControll_Example
//
//  Copyright © 2018年 lishuailibertine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

 


//配置cell的数据

typedef void (^configCellBlock)(id cell, id model);

/**
  cell 点击的响应事件

 @param tableView 表
 @param indexPath
 @param rowData
 @return
 */
typedef  void(^didSelectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData);

@interface HBTableViewDataSource : NSObject <UITableViewDataSource,UITableViewDelegate>


/** 头部数据源 */
@property (nonatomic, copy) void(^configSectionHeaderData)(NSInteger section,UIView *view, id sectionHeaderData);

/** 尾部数据源 */
@property (nonatomic, copy) void(^configSectionFooterData)(NSInteger section,UIView *view, id sectionFooterData);


/**
 *  根据外界传入的数据以及标识返回一个数据源
 *
 *  @param dataArray  外界传入的数据
 *  @param block      回调block用于配置cell数据 如果不实现且继承了HBTableViewCell 系统自动调用实现
 *
 *  @return 数据源对象
 */
+ (instancetype)dataSourceViewModel:(id)dataViewModel dataConfigBlock:(configCellBlock)block;


/**
 根据外界传入的数据以及标识返回一个数据源

 @param dataViewModel 外界传入的用于初始化表格数据
 @param block
 @param didSelectRowAtIndexPath  响应事件
 @return
 */
+ (instancetype)dataSourceViewModel:(id)dataViewModel dataConfigBlock:(configCellBlock)block didSelectRowAtIndexPath:(didSelectRowAtIndexPath)didSelectRowAtIndexPath;

@end
