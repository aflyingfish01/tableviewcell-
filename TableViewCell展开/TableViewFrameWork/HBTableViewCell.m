//
//  HBTableDataModel.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import "HBTableViewCell.h"

@interface HBTableViewCell ()
@property (nonatomic, strong, readwrite) NSIndexPath *indexPath;

@end

@implementation HBTableViewCell

#pragma mark - Live Method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}


#pragma mark - private methods(私有方法)

- (void)updateWithCellData:(id)aData {
    
}




@end
