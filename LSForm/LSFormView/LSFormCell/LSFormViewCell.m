//
//  LSFormViewCell.m
//  LSForm
//
//  Created by Dylan on 16/4/18.
//  Copyright © 2016年 dylan. All rights reserved.
//

#import "LSFormViewCell.h"

@implementation LSFormViewCell

{
    NSMutableAttributedString *attributedString;
    
    UIImageView* accessoryView;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        accessoryView = [[UIImageView alloc]init];
        [accessoryView setFrame:CGRectMake(0, 0, 11, 21)];
    }
    return self;
}


- (void)setFromCellContentWithModel:(LSFormBaseModel*)model
{
    if (model) {
        if (model.title) {
            
            NSString* title =model.title;
            
            if (model.isFill) {
                self.textLabel.textColor = [UIColor grayColor];
                title = [NSString stringWithFormat:@"%@*",title];
                NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:title];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(title.length-1,1)];
                self.textLabel.attributedText = str;
                
            }else{
                
                self.textLabel.text = title;
                
            }
            
        }
        
        [self.textLabel setFont:[UIFont systemFontOfSize:16]];
        
    }
    
    
    if (model.isAccessory) {
        if (model.accessoryName) {
            [accessoryView setImage:[UIImage imageNamed:model.accessoryName]];
        }else{
            [accessoryView setImage:[UIImage imageNamed:@"ic_jiantou.png"]];
        }
        
        self.accessoryView = accessoryView;
    }else{
        self.accessoryView = nil;
    }
}


- (void)fromCellBlock:(CellBlock)clickBlock
{
    self.block = clickBlock;
}


@end
