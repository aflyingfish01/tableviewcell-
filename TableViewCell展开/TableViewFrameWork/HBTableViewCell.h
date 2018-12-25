//
//  HBTableDataModel.m
//  example
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@interface HBTableViewCell : UITableViewCell

/**
 *  cell根据数据显示ui
 *
 *  @param  aData 数据
 */
- (void)updateWithCellData:(id __nullable)aData;



@end

NS_ASSUME_NONNULL_END
