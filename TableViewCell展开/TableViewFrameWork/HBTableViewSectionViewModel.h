//
//  HBTableDataModel.h
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NSString *(^configCellIdentifier)(UITableView *tableView,NSIndexPath *indexPath);
typedef CGFloat (^configRowHeight)(NSIndexPath *indexPath);

@interface HBTableViewCellModel: NSObject
/** 当前cell的Class,要保证当前aClass名称与当前identifier标识符一致 */
@property (nonatomic ,copy) NSString* className;
/** cell的高度 用block是为了能动态计算cell的高度*/
@property (nonatomic, copy ) configRowHeight configRowHeight;
/** 是否通过nib加载cell，默认为NO isNib */
@property (nonatomic) BOOL isNib;
/** cell填充数据 */
@property (nonatomic, strong) id rowData;

/**
 <#Description#>

 @param identifier cell标示符
 @param rowData cell 对应的数据源
 @param isNib 是否Nib YES 是 NO 不是
 @param rowHeight cell 的高度
 @return cellModel
 */
+ (instancetype)cellViewModelClassName:(NSString *)className rowData:(id)rowData isNib:(BOOL)isNib rowHeight:(configRowHeight)rowHeight;
@end

#pragma mark - mark HBTableViewSectionViewModel

typedef CGFloat(^configSectionHeaderHeight)(NSInteger section);
typedef UIView *(^configSectionHeaderView)(NSInteger section);
typedef CGFloat(^configSectionFooterHeight)(NSInteger section);
typedef UIView *(^configSectionFooterView)(NSInteger section);

@interface HBTableViewSectionViewModel: NSObject


#pragma mark - 分区视图2个属性必须配置，否则不显示
/** 分区头视图高度 configSectionHeaderHeight*/
@property (nonatomic, copy) configSectionHeaderHeight configSectionHeaderHeight;
/** 分区头视图 configSectionHeaderView*/
@property (nonatomic, strong) configSectionHeaderView configSectionHeaderView;

#pragma mark - 分区视图2个属性必须配置，否则不显示
/** 分区尾视图高度 configSectionFooterHeight*/
@property (nonatomic, copy) configSectionFooterHeight configSectionFooterHeight;
/** 分区尾视图 configFooterView*/
@property (nonatomic, strong) configSectionFooterView configFooterView;

/** 分区尾部视图数据 sectionFooterData*/
@property (nonatomic, strong) id sectionFooterData;
/** 分区头部头部视图数据 sectionHeaderData*/
@property (nonatomic, strong) id sectionHeaderData;

/** 分区内的数据模型 rowDataArray*/
@property (nonatomic, strong) NSMutableArray <HBTableViewCellModel *>*rowDataArray;

/**
 设置分区头部视图

 @param configSectionHeaderHeight 高度
 @param configSectionHeaderView 视图View
 */
- (void)configSectionHeaderHeight:(configSectionHeaderHeight)configSectionHeaderHeight sectionHeaderView:(configSectionHeaderView)configSectionHeaderView;


/**
 设置分区尾视图

 @param configSectionFooterHeight 尾部视图高度
 @param configSectionFooterView 尾部视图View
 */
- (void)configSectionFooterHeight:(configSectionFooterHeight)configSectionFooterHeight sectionFooterView:(configSectionFooterView)configSectionFooterView;
@end



//@interface HBTableUIModel : NSObject
 
//@property (nonatomic, copy) void(^scrollOffset)(CGPoint point);
//@property (nonatomic, copy) void(^willDisplayCell)(UITableView *tableView,UITableViewCell *cell,NSIndexPath *indexPath);
//@property (nonatomic, copy) void(^shouldHighlightRow)(UITableView *tableView,NSIndexPath *indexPath);
//@property (nonatomic, copy) void(^didSelectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData);
//@end
