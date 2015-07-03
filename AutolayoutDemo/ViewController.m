//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by alex on 15/6/25.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+AutoResize.h"
#import "UIViewAdditions.h"
#import "UIView+FreeLayout.h"

#import "UIView+LayoutAdditions.h"

#import "StraightLinelayoutViewController.h"
#import "FoldLinelayoutViewController.h"
#import "FreelayoutViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UILabel *lab1;
@property (nonatomic,strong)UILabel *lab2;
@property (nonatomic,strong)UILabel *lab3;
@property (nonatomic,strong)UILabel *lab4;

@property (nonatomic,strong)UILabel *lab5;
@property (nonatomic,strong)UILabel *lab6;
@property (nonatomic,strong)UILabel *lab7;

@property (nonatomic,strong)UILabel *lab8;
@property (nonatomic,strong)UILabel *lab9;
@property (nonatomic,strong)UILabel *lab10;
@property (nonatomic,strong)UILabel *lab11;
@property (nonatomic,strong)UILabel *lab12;



@property (nonatomic,strong)UITableView *tb;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Freelayout";

    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"1水费电费税费省电费省电费爽肤水";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab1 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"2水费电费税费省电费省电费爽肤水";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab2 = lab;
    }
    
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"3水费电费税费省电费省电费爽肤水";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab3 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"4 苹果";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab4 = lab;
    }
    
    
    //从左到右
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"5 火龙果";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:50];
        [self.view addSubview:lab];
        self.lab5 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"6 喜马拉雅";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab6 = lab;
    }
    
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"7 西瓜南瓜冬瓜";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab7 = lab;
    }
    
    //从左到右
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 90)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"8";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
//        [lab autoResizeWithMinWidth:10 maxWidth:50];
        [self.view addSubview:lab];
        self.lab8 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 50)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"9";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
//        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab9 = lab;
    }
    
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"10";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
//        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab10 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"11";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        //        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab11 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"12";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        //        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab12 = lab;
    }
    
    UITableView *tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)
                                                   style:UITableViewStylePlain];
    tb.delegate =self;
    tb.dataSource =self;
    [self.view addSubview:tb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    //所有子视图由一根直线串联起来
    if (indexPath.row == 0) {
        cell.textLabel.text=@"StraightLinelayout 直线";
    }
    //所有子视图由一根折线串联起来
    else if (indexPath.row == 1){
        cell.textLabel.text=@"FoldLinelayout 折线";
    }
    //所有子视图由一根曲线串联起来(任意图形)
    else if (indexPath.row == 2){
        cell.textLabel.text=@"Freelayout 任意曲线";
    }
    else if (indexPath.row == 3){
        cell.textLabel.text=@"浮动(未)";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0 ) {
        StraightLinelayoutViewController *controller = [[StraightLinelayoutViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row ==1){
        FoldLinelayoutViewController *controller = [[FoldLinelayoutViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row ==2){
        FreelayoutViewController *controller = [[FreelayoutViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }

}

#pragma mark - layoutSubviews 子视图布局
/*!
 *  @brief  将开始子视图布局
 */
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
}

/*!
 *  @brief  子视图布局
 *  @note   只能有子视图布局代码,严禁干其他任何事情。viewDidLayoutSubviews中不能修改self.view.frame
 */
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

    self.view.backgroundColor = [UIColor grayColor];
    
    //每次重新开始布局时需要复原布局参数
//    self.view.insets = UIEdgeInsetsMake(100, 20, 20, 20);  
}



@end
