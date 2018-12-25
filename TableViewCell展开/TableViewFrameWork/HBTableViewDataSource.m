//
//  HBTableDataSource.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBTableViewDataSource.h"
#import "HBTableViewSectionViewModel.h"
#import "HBTableViewCell.h"
#import "NSObject+HBTableDataModel.h"
@interface HBTableViewDataSource()

/** 填充数据的block*/
@property (nonatomic,copy) configCellBlock configBlock;

/** 响应事件*/
@property (nonatomic ,copy) didSelectRowAtIndexPath didSelectRowAtIndexPath;

@property (nonatomic, strong) NSMutableArray *modelViewArray;

@end
@implementation HBTableViewDataSource

+ (instancetype)dataSourceViewModel:(id)dataViewModel dataConfigBlock:(configCellBlock)block{
    return [self dataSourceViewModel:dataViewModel dataConfigBlock:block didSelectRowAtIndexPath:nil];
}
+ (instancetype)dataSourceViewModel:(id )dataViewModel dataConfigBlock:(configCellBlock)block didSelectRowAtIndexPath:(didSelectRowAtIndexPath)didSelectRowAtIndexPath{
    HBTableViewDataSource *dataSource= [[HBTableViewDataSource alloc]init];
    dataSource.modelViewArray = dataViewModel;
    dataSource.configBlock = block;
    dataSource.didSelectRowAtIndexPath = didSelectRowAtIndexPath;
    return dataSource;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.modelViewArray) {
        return self.modelViewArray.count;
    }return 0;
}


#pragma mark - tableViewDelegate tableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    HBTableViewSectionViewModel *sectionModel =[self.modelViewArray objectAtIndex:section];
    return sectionModel.configSectionHeaderHeight?sectionModel.configSectionHeaderHeight(section):0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    HBTableViewSectionViewModel *sectionModel =[self.modelViewArray objectAtIndex:section];
    return sectionModel.configSectionFooterHeight?sectionModel.configSectionFooterHeight(section):0.01;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HBTableViewSectionViewModel *sectionModel =[self.modelViewArray objectAtIndex:section];
    UIView *sectionView =nil;
    sectionView = sectionModel.configSectionHeaderView?sectionModel.configSectionHeaderView(section):[[UIView alloc] init];
    if (self.configSectionHeaderData) {
        self.configSectionHeaderData(section, sectionView, sectionModel.sectionHeaderData);
    }
    return sectionView;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;{
    HBTableViewSectionViewModel *footerModel =[self.modelViewArray objectAtIndex:section];
    UIView *footerView =nil;
    footerView = footerModel.configFooterView?footerModel.configFooterView(section):[[UIView alloc] init];
    if (self.configSectionFooterData) {
        self.configSectionFooterData(section, footerView, footerModel.sectionFooterData);
    }
    return footerView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HBTableViewSectionViewModel *sectionModel =[self.modelViewArray objectAtIndex:section];
    return sectionModel.rowDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HBTableViewSectionViewModel *sectionModel =[self.modelViewArray objectAtIndex:indexPath.section];
    HBTableViewCellModel *cellModel =[sectionModel.rowDataArray objectAtIndex:indexPath.row];

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellModel.className];
    if (!cell) {
        if(cellModel.isNib){
            cell =[[NSBundle mainBundle] loadNibNamed:cellModel.className owner:nil options:nil][0];
         }else{
            cell = [[NSClassFromString(cellModel.className) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellModel.className];
             cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
             
         }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.separatorInset = UIEdgeInsetsZero; 分割线从0位置开始
     if ([cell isKindOfClass:[HBTableViewCell class]]){
        HBTableViewCell *cellView = (HBTableViewCell *)cell;
        [cellView updateWithCellData:cellModel.rowData];
         if (self.configBlock){
            self.configBlock(cell, cellModel.rowData);
         }
     }else if (self.configBlock) {
         self.configBlock(cell, cellModel.rowData);
     }
    return cell;
}

/**
 cell 点击响应f

 @param tableView tableView
 @param indexPath indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HBTableViewSectionViewModel *sectionModel =[self.modelViewArray objectAtIndex:indexPath.section];
    HBTableViewCellModel *rowModel =[sectionModel.rowDataArray objectAtIndex:indexPath.row];
    if (self.didSelectRowAtIndexPath) {
        self.didSelectRowAtIndexPath(tableView, indexPath,rowModel.rowData);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HBTableViewSectionViewModel *sectionModel =[self.modelViewArray objectAtIndex:indexPath.section];
    HBTableViewCellModel *rowModel =[sectionModel.rowDataArray objectAtIndex:indexPath.row];
    return rowModel.configRowHeight?rowModel.configRowHeight(indexPath):0;
}
//UI
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.tableUIModel.willDisplayCell) {
//        self.tableUIModel.willDisplayCell(tableView, cell, indexPath);
//    }
//}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (self.tableUIModel.scrollOffset) {
//        self.tableUIModel.scrollOffset(scrollView.contentOffset);
//    }
//}
//- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.tableUIModel.shouldHighlightRow) {
//        self.tableUIModel.shouldHighlightRow(tableView, indexPath);
//    }
//    return YES;
//}
@end
