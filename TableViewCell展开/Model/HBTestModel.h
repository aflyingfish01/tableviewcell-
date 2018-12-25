//
//  HBTestModel.h
//  TableViewCell展开
//
//  Created by hbzq on 2018/12/25.
//  Copyright © 2018 hulailin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBTestModel : NSObject
/* 用来记录cell是否展开*/
@property (nonatomic) BOOL isOpen;

@property(nonatomic, copy) NSString *code;
@property(nonatomic, copy) NSString *name;

- (NSMutableArray *)requestCustomTableDataArray:(id)dataArray className:(NSString *)className isNib:(BOOL)isNib;
@end

NS_ASSUME_NONNULL_END
