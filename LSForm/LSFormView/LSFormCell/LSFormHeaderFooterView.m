//
//  LSFormHeaderFooterView.m
//  LSForm
//
//  Created by Dylan on 16/4/19.
//  Copyright © 2016年 dylan. All rights reserved.
//

#import "LSFormHeaderFooterView.h"

@implementation LSFormHeaderFooterView


- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        
        
    }
    
    return self;
}




@end
