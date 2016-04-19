//
//  LSFormBaseModel.h
//  LSForm
//
//  Created by Dylan on 16/4/18.
//  Copyright © 2016年 dylan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSFormBaseModel : NSObject

// tableViewCell 点击   YES可点击  NO 不可点击
@property (nonatomic) BOOL isSelect;


// tableViewCell 的名字
@property (nonatomic,copy) NSString* className;


@property (nonatomic,copy) NSString* title;

// 是否必填  yes 必填   no非必填
@property (nonatomic) BOOL isFill;

// 右边的箭头
@property (nonatomic) BOOL isAccessory;

// 右边的箭头的image
@property (nonatomic,copy) NSString* accessoryName;


@property (nonatomic,strong) NSIndexPath* indexPath;


@end
