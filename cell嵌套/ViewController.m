//
//  ViewController.m
//  cell嵌套
//
//  Created by 王俊钢 on 2017/4/18.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "ViewController.h"
#import "Cell0.h"
#import "Cell1.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) UILabel *textlab;
@end
static NSString *cellidentfid = @"cellidentfid";
static NSString *cellidentfid2 = @"cellidentfid2";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // [self.view addSubview:self.table];
    
    [self.view addSubview:self.textlab];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UILabel *)textlab
{
    if(!_textlab)
    {
        _textlab = [[UILabel alloc] init];
        _textlab.frame = CGRectMake(40, 50, 400, 40);
        _textlab.font = [UIFont systemFontOfSize:10];
        NSString *str1 = @"javr";
        NSString *str2 = @"回复";
        NSString *str3 = @"tony";
        NSString *str4 = @"费雪莲台色白了多少积分拿了空间";
//        
//        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"javr回复tony费雪莲台色白了多少积分拿了空间"];
        
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@%@",str1,str2,str3,str4]];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0,str1.length)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(str1.length,str2.length)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(str1.length+str2.length,str3.length)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(str1.length+str2.length+str3.length,str4.length)];

        _textlab.attributedText = str;
    }
    return _textlab;
}













-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.table.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(UITableView *)table
{
    if(!_table)
    {
        _table = [[UITableView alloc] init];
        _table.dataSource = self;
        _table.delegate = self;
    }
    return _table;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==self.table) {
        return 120;
    }
    else
    {
        return 30;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==self.table) {
        return 4;
    }
    else
    {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.table) {
        Cell0 *cell  = [tableView dequeueReusableCellWithIdentifier:cellidentfid];
        if (!cell) {
            cell = [[Cell0 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentfid];
        }
        cell.celltable.dataSource = self;
        cell.celltable.delegate = self;
        return cell;
    }else
    {
        Cell1 *cell  = [tableView dequeueReusableCellWithIdentifier:cellidentfid2];
        if (!cell) {
            cell = [[Cell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentfid2];
        }
        cell.backgroundColor = [UIColor blueColor];
        return cell;
    }
    return nil;
}
@end
