//
//  Cell0.m
//  cell嵌套
//
//  Created by 王俊钢 on 2017/4/18.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "Cell0.h"

@implementation Cell0

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.celltable];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.celltable.frame = CGRectMake(40, 20, 100, 60);
    
}

#pragma mark - getters


-(UITableView *)celltable
{
    if(!_celltable)
    {
        _celltable = [[UITableView alloc] init];
        _celltable.backgroundColor = [UIColor greenColor];
    }
    return _celltable;
}



@end
