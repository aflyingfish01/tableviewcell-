//
//  HBTableDataModel.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBTableViewSectionViewModel.h"

@interface HBTableViewCellModel()


@end
@implementation HBTableViewCellModel

+ (instancetype)cellViewModelClassName:(NSString *)className rowData:(id)rowData isNib:(BOOL)isNib rowHeight:(configRowHeight)rowHeight{
    HBTableViewCellModel *cellModel = [[HBTableViewCellModel alloc] init];
    cellModel.className = className;
    cellModel.rowData = rowData;
    cellModel.isNib = isNib;
    cellModel.configRowHeight = rowHeight;
    return cellModel;
}
@end

@interface HBTableViewSectionViewModel()

@end
@implementation HBTableViewSectionViewModel


- (void)configSectionHeaderHeight:(configSectionHeaderHeight)configSectionHeaderHeight sectionHeaderView:(configSectionHeaderView)configSectionHeaderView{
    self.configSectionHeaderHeight = configSectionHeaderHeight;
    self.configSectionHeaderView = configSectionHeaderView;
}

- (void)configSectionFooterHeight:(configSectionFooterHeight)configSectionFooterHeight sectionFooterView:(configSectionFooterView)configSectionFooterView{
    self.configSectionFooterHeight = configSectionFooterHeight;
    self.configSectionFooterHeight = configSectionFooterHeight;
}
- (NSMutableArray *)rowDataArray{
    if (!_rowDataArray) {
        _rowDataArray =[NSMutableArray array];
    }return _rowDataArray;
}
@end

