//
//  ViewController.m
//  LSForm
//
//  Created by Dylan on 16/4/18.
//  Copyright © 2016年 dylan. All rights reserved.
//

#import "ViewController.h"
#import "LSFormView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LSFormView* fromView = [[LSFormView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20) style:UITableViewStylePlain];
    fromView.cellHeight = 49;
    [self.view addSubview:fromView];
    
    [fromView fromCellBlock:^(LSFormBaseModel *model) {
        
        NSLog(@"点击");
        
    }];
    
    [self reloadFormViewWithView:fromView];
    
}


- (void)reloadFormViewWithView:(LSFormView*)view
{
    
    NSMutableArray* array = [NSMutableArray array];
    
    LSFormBaseModel* model = [[LSFormBaseModel alloc]init];
    model.className = @"LSFormViewCell";
    model.title = @"发票抬头";
    model.isSelect = YES;
    [array addObject:model];
    
    
    LSFormBaseModel* normalModel = [[LSFormBaseModel alloc]init];
    normalModel.className = @"LSFormViewCell";
    normalModel.title = @"发票内容";
    normalModel.isSelect = YES;
    [array addObject:normalModel];
    
    
    [view setFormContentWithArray:array];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
