//
//  LSFormView.m
//  LSForm
//
//  Created by Dylan on 16/4/18.
//  Copyright © 2016年 dylan. All rights reserved.
//

#import "LSFormView.h"



@interface LSFormView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy)FromClickBlock ClickBlock;

@end


@implementation LSFormView
{
    UITableView* formTableView;
    
    NSArray* sectionArr;
    NSArray* cellArr;
    
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        
        formTableView = [[UITableView alloc]initWithFrame:self.bounds style:style];
        formTableView.delegate = self;
        formTableView.dataSource = self;
        [self addSubview:formTableView];
        
        formTableView.tableFooterView = [[UIView alloc]init];
    }
    return self;
}


- (void)setFormContentWithArray:(NSArray*)array
{
    cellArr = array;
    
    [formTableView reloadData];
}


- (void)fromCellBlock:(FromClickBlock)clickBlock
{
    self.ClickBlock = clickBlock;
}


#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return cellArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeight) {
        return self.cellHeight;
    }else{
        return 44;
    }
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LSFormBaseModel* model = [cellArr objectAtIndex:indexPath.row];
    NSString* cellIdentifier = model.className;
    Class cellClass = NSClassFromString(cellIdentifier);
    
    LSFormViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    [cell setFromCellContentWithModel:model];
    
    [cell fromCellBlock:^(LSFormBaseModel *model) {
        
        model.indexPath = indexPath;
        
        [self clickBlockWithModel:model];
        
    }];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LSFormBaseModel* model = [[LSFormBaseModel alloc]init];
    model = [cellArr objectAtIndex:indexPath.row];
    if (model.isSelect) {
        
        model.indexPath = indexPath;
        
        [self clickBlockWithModel:model];
    }
}


- (void)clickBlockWithModel:(LSFormBaseModel*)model
{
    if (self.ClickBlock) {
        self.ClickBlock(model);
    }
}


@end
