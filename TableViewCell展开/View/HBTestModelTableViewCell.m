//
//  HBFinacingQueryTableViewCell.m
//  HBStockWarning
//
//  Created by hbzq on 2018/12/24.
//  Copyright © 2018 Touker. All rights reserved.
//

#import "HBTestModelTableViewCell.h"
#import "HBTestModel.h"
@interface HBTestModelTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
/** code.市场 */
@property (weak, nonatomic) IBOutlet UILabel *exchangeMarket;
/** 方向 */
@property (weak, nonatomic) IBOutlet UIButton *transactionDirction;
/** 价格 */
@property (weak, nonatomic) IBOutlet UILabel *price;


/** 平仓时间 */
@property (weak, nonatomic) IBOutlet UILabel *time;
/** 成交状态 */
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuViewHeight;


@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end
@implementation HBTestModelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     self.price.adjustsFontSizeToFitWidth = YES;
    self.transactionDirction.layer.borderWidth = 1;
    self.transactionDirction.layer.masksToBounds = YES;
    self.transactionDirction.layer.cornerRadius = 8;
    [self customCell];
}

- (void)customCell
{
    //最重要的一句代码！没有的话单元格直接全部显示下拉菜单了！两句随便选一句
    self.layer.masksToBounds = YES;
    
    //设置cell自身属性(必须设置，不然收起下拉菜单动画可能有问题)
    self.selectionStyle = UITableViewCellSelectionStyleNone;
 
    //绑定事件
    [self.moreButton addTarget:self
                        action:@selector(moreClick:)
              forControlEvents:UIControlEventTouchUpInside];
    
    
}
/**
 *  下拉菜单按钮
 *
 *  @param sender 下拉菜单按钮
 */
- (void)moreClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if(self.openMenuCellHandler){
        self.openMenuCellHandler(self, sender);
    }
    
}
- (void)updateWithCellData:(id)aData{
    
    HBTestModel *viewModel = (HBTestModel *)aData;
    if (viewModel.isOpen) { // 打开
        self.moreButton.selected = YES;
        self.menuViewHeight.constant = 44.0;
        self.menuView.hidden = NO;
    }else{
        self.moreButton.selected = NO;
        self.menuViewHeight.constant = 0;
        self.menuView.hidden = YES;
    }
}

@end
