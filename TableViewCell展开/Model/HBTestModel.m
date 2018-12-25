//
//  HBTestModel.m
//  TableViewCell展开
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBTestModel.h"
#import "HBTableViewSectionViewModel.h"
@implementation HBTestModel
//数组的数据整理
- (NSMutableArray *)requestCustomTableDataArray:(id)dataArray className:(NSString *)className isNib:(BOOL)isNib {
    
    NSMutableArray *array = [NSMutableArray array];
    HBTableViewSectionViewModel *sectionModel =[[HBTableViewSectionViewModel alloc] init];
    [sectionModel configSectionHeaderHeight:^CGFloat(NSInteger section) {
        return 10;
    } sectionHeaderView:^UIView *(NSInteger section) {
        UIView *sectionView = [[UIView alloc] init];
        sectionView.backgroundColor = [UIColor clearColor];
        return sectionView;
    }];
    NSMutableArray *list = (NSMutableArray *)dataArray;
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        HBTableViewCellModel *rowModel = [HBTableViewCellModel cellViewModelClassName:className rowData:obj isNib:isNib rowHeight:^CGFloat(NSIndexPath *indexPath) {
            HBTestModel *model = (HBTestModel *)obj;
            if (model.isOpen) {
                return 184;
            } else {
                return 140;
            }
            
            
            
        }];
        [sectionModel.rowDataArray addObject:rowModel];
    }];
    [array addObject:sectionModel];
    
    return array;
}
@end
