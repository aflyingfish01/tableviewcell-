//
//  ViewController.m
//  TableViewCell展开
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "ViewController.h"
#import "HBTableViewDataSource.h"
#import "NSObject+HBTableDataModel.h"
#import "HBTestModel.h"
#import "HBMenuItemModel.h"
#import "UIView+HBPageExtend.h"
#import "HBTestModelTableViewCell.h"
@interface ViewController ()

@property (nonatomic ,strong) NSMutableArray *dataArray;
@property (nonatomic ,strong)  UITableView *tableView;
@property (nonatomic ,strong) HBTableViewDataSource *dataSource;
/** 打开的cell*/
@property (nonatomic, strong) NSIndexPath *openMenuCellIndexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
    
    [self loadUI];
}

#pragma mark - private methods(私有方法)
- (void)loadData{
    
    
    HBTestModel *model = [[HBTestModel alloc] init];
    model.code = @"000001";
    model.name = @"平安银行";
    
    HBTestModel *model1 = [[HBTestModel alloc] init];
    model1.code = @"002839";
    model1.name = @"张家港银行";
    
    HBTestModel *model2 = [[HBTestModel alloc] init];
    model2.code = @"002450";
    model2.name = @"康德新";
    
    HBTestModel *model3 = [[HBTestModel alloc] init];
    model3.code = @"600022";
    model3.name = @"山东钢铁";
    
    self.dataArray = @[model,model1,model2,model3].mutableCopy;
    
    WEAK_SELF;
    HBMenuItemModel *item1 = [HBMenuItemModel menuItemModel:nil itemName:@"按钮1" handler:^{
       NSLog(@"按钮1响应了");
    }];
    HBMenuItemModel *item2 = [HBMenuItemModel menuItemModel:nil itemName:@"按钮2" handler:^{
        NSLog(@"按钮2响应了");
    }];
    
    HBMenuItemModel *item3 = [HBMenuItemModel menuItemModel:nil itemName:@"按钮2" handler:^{
        STRONG_SELF;
        NSLog(@"按钮3响应了");
    }];
    
    
    NSMutableArray *array =  [model requestCustomTableDataArray:self.dataArray  className:@"HBTestModelTableViewCell" isNib:YES];
    self.dataSource = [HBTableViewDataSource dataSourceViewModel:array dataConfigBlock:^(id cell, id model) {
      
        HBTestModelTableViewCell *cellView = (HBTestModelTableViewCell *)cell;
        [cellView.menuView initWithExtensiveItems:@[item1,item2,item3]];
        
    } didSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath, id rowData) {
        
        
        [self didOpenMenuAtCell:indexPath rowData:rowData];
        
    }];
}

- (void)loadUI{
    
    
    [self.view addSubview:self.tableView];
    //绑定代理
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    
    
}

- (void)didOpenMenuAtCell:(NSIndexPath *)indexPath rowData:(HBTestModel *)model{
    
    if (self.openMenuCellIndexPath) {
        if (self.openMenuCellIndexPath.row == indexPath.row) {
            // ：点的是自己 关闭
            model.isOpen = NO;
            [self.tableView reloadRowsAtIndexPaths:@[self.openMenuCellIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            self.openMenuCellIndexPath = nil;
        }
        else{
            //cell打开 但是点的是没有打开的indexPath 先把打开的cell关闭
            HBTestModel *modelA = self.dataArray[self.openMenuCellIndexPath.row];
            modelA.isOpen = NO;
            
            //点的是没有打开的indexPath
            model.isOpen = YES;
            [self.tableView reloadRowsAtIndexPaths:@[self.openMenuCellIndexPath,indexPath] withRowAnimation:UITableViewRowAnimationFade];
            //最后点击的indexPath
            self.openMenuCellIndexPath = indexPath;
        }
    }
    else{
        
        //没有cell打开
        model.isOpen = YES;
        //当前的cell等于
        self.openMenuCellIndexPath = indexPath;
        
        [self.tableView reloadRowsAtIndexPaths:@[self.openMenuCellIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tableView scrollToRowAtIndexPath:self.openMenuCellIndexPath
                              atScrollPosition:UITableViewScrollPositionNone
                                      animated:YES];
        
    }
    
}
#pragma mark - getters and setters
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}



- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0);//UI偏移
    }
    return _tableView;
}
@end
