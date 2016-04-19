//
//  LSFormViewCell.h
//  LSForm
//
//  Created by Dylan on 16/4/18.
//  Copyright © 2016年 dylan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFormBaseModel.h"


/**
 *  cell点击的回调的block的回调
 *
 *  @param model 回调的参数
 */
typedef void (^CellBlock)(LSFormBaseModel* model);



@interface LSFormViewCell : UITableViewCell



@property (nonatomic,copy)CellBlock block;


/**
 *  cell点击的回调
 *
 *  @param clickBlock 回调的block
 */
- (void)fromCellBlock:(CellBlock)clickBlock;


/**
 *  设置cell的内容
 *
 *  @param model cell的数据模型
 */
- (void)setFromCellContentWithModel:(LSFormBaseModel*)model;

@end
