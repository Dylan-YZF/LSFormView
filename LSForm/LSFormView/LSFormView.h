//
//  LSFormView.h
//  LSForm
//
//  Created by Dylan on 16/4/18.
//  Copyright © 2016年 dylan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFormBaseModel.h"
#import "LSFormViewCell.h"


typedef void (^FromClickBlock)(LSFormBaseModel* model);

@interface LSFormView : UIView


@property (nonatomic)CGFloat cellHeight;



- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;



- (void)setFormContentWithArray:(NSArray*)array;



- (void)fromCellBlock:(FromClickBlock)clickBlock;


@end
