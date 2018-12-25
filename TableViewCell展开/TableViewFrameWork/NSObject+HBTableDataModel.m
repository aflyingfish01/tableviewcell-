//
//  NSObject+HBTableDataModel.m
//  TableViewTest
//
//  Created by hbzq on 2018/12/8.
//  Copyright © 2018 遇见远洋. All rights reserved.
//

#import "NSObject+HBTableDataModel.h"
#import "HBTableViewSectionViewModel.h"
#import <objc/runtime.h>

@implementation NSObject (HBTableDataModel)

#pragma mark - private methods(私有方法)
- (NSMutableArray *)requestTableDataSource:(id)dataArray rowHeight:(CGFloat)height className:(NSString *)className isNib:(BOOL)isNib{
    return [self requestTableDataSource:dataArray rowHeight:height className:className isNib:isNib sectionHeaderHeight:0 sectionHeaderView:nil];
}
- (NSMutableArray *)requestTableDataSource:(NSMutableArray *)dataArray rowHeight:(CGFloat)height className:(NSString *)className  isNib:(BOOL)isNib sectionHeaderHeight:(CGFloat)headerHeight sectionHeaderView:(UIView *  __nullable)headerView{
    if (dataArray.count == 0) {
        return nil;
    }
    id type = dataArray[0];
    if ([type isKindOfClass:[NSArray class]]) {//如果第0位是数组说明是二维数组
        return [self requestTable2dDataArray:dataArray rowHeight:height className:className isNib:isNib sectionHeaderHeight:headerHeight sectionHeaderView:headerView];
    }else{//数组
        return [self requestTableDataArray:dataArray rowHeight:height className:className isNib:isNib sectionHeaderHeight:headerHeight sectionHeaderView:headerView];
    }
    return nil;
}
    

//数组的数据整理
- (NSMutableArray *)requestTableDataArray:(id)dataArray rowHeight:(CGFloat)height className:(NSString *)className isNib:(BOOL)isNib sectionHeaderHeight:(CGFloat)headerHeight sectionHeaderView:(UIView *  __nullable)headerView{

    NSMutableArray *array = [NSMutableArray array];
    HBTableViewSectionViewModel *sectionModel =[[HBTableViewSectionViewModel alloc] init];
    [sectionModel configSectionHeaderHeight:^CGFloat(NSInteger section) {
        return headerHeight == 0 ? 0 : headerHeight;
    } sectionHeaderView:^UIView *(NSInteger section) {
        return headerView == nil ? nil : headerView;
    }];
    NSMutableArray *list = (NSMutableArray *)dataArray;
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        HBTableViewCellModel *rowModel = [HBTableViewCellModel cellViewModelClassName:className rowData:obj isNib:isNib rowHeight:^CGFloat(NSIndexPath *indexPath) {
            return height;
        }];
        [sectionModel.rowDataArray addObject:rowModel];
    }];
    [array addObject:sectionModel];

    return array;
}
//二维数组的数据整理
- (NSMutableArray *)requestTable2dDataArray:(id)dataArray rowHeight:(CGFloat)height className:(NSString *)className  isNib:(BOOL)isNib sectionHeaderHeight:(CGFloat)headerHeight sectionHeaderView:(UIView *  __nullable)headerView{
    NSMutableArray *array = [NSMutableArray array];
    
    NSMutableArray *sectionModels = [NSMutableArray array];
    
    NSMutableArray *list = (NSMutableArray *)dataArray;
    
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        HBTableViewSectionViewModel *sectionModel =[[HBTableViewSectionViewModel alloc] init];
        [sectionModel configSectionHeaderHeight:^CGFloat(NSInteger section) {
            return headerHeight == 0 ? 0 : headerHeight;
        } sectionHeaderView:^UIView *(NSInteger section) {
            return headerView == nil ? nil : headerView;
        }];
       
        [sectionModel configSectionHeaderHeight:^CGFloat(NSInteger section) {
            return headerHeight == 0 ? 0 : headerHeight;
            
        } sectionHeaderView:^UIView *(NSInteger section) {
            return headerView;
        }];
        
        [obj enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HBTableViewCellModel *rowModel = [HBTableViewCellModel cellViewModelClassName:className rowData:obj isNib:isNib rowHeight:^CGFloat(NSIndexPath *indexPath) {
                return height;
            }];
            [sectionModel.rowDataArray addObject:rowModel];
        }];
        [sectionModels addObject:sectionModel];
    }];
    return sectionModels;
    
}







- (NSMutableArray *)requestTableDataSource:(id)dataArray{
    return nil;
}
//二维数组
//- (void)requestTableDataSource:(NSArray <HBGlobalPlateModel *>*)plateModels{
//    WEAK_SELF;
//    NSMutableArray *sectionModels =[NSMutableArray array];
//    [plateModels enumerateObjectsUsingBlock:^(HBGlobalPlateModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        STRONG_SELF;
//        int rowCounts =obj.globalPlateList.count%obj.singleRowCount.intValue>0?obj.globalPlateList.count/obj.singleRowCount.intValue+1:obj.globalPlateList.count/obj.singleRowCount.intValue;
//        HBTableSectionModel *sectionModel =[[HBTableSectionModel alloc] init];
//        [sectionModel setConfigSectionView:^UIView *(NSInteger section) {
//            HBSectionGlobalPlateHeaderView *headerView =[HBSectionGlobalPlateHeaderView createSectionGlobalPlateHeaderView];
//            return headerView;
//        }];
//        [sectionModel setConfigSectionHeight:^float(NSInteger section) {
//            return obj.sectionHeight.intValue;
//        }];
//        [sectionModel setConfigFooterHeight:^float(NSInteger section) {
//            return 0.1;
//        }];
//        HBTableRowModel *rowModel =[[HBTableRowModel alloc] init];
//        [rowModel setConfigRowHeight:^float(NSIndexPath *indexPath) {
//            return [self getTableCellHeight:obj rowCounts:rowCounts];
//        }];
//        [rowModel setConfigCellReusable:^NSString *(UITableView *tableView, NSIndexPath *indexPath) {
//            return NSStringFromClass([HBGlobalPlateTableViewCell class]);
//        }];
//        rowModel.rowData =obj;
//        sectionModel.sectionData =obj;
//        [sectionModel.rowDataArray safeAddObject:rowModel];
//        [sectionModels safeAddObject:sectionModel];
//    }];
//    [self.dataArray removeAllObjects];
//    [self.dataArray addObjectsFromArray:sectionModels];
//}
//#pragma mark - getters and setters



@end
