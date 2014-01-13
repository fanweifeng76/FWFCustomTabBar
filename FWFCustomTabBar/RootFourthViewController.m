//
//  RootFourthViewController.m
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import "RootFourthViewController.h"
#import "RNBlurModalView.h"
@interface RootFourthViewController ()

@end

@implementation RootFourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = [UIColor cyanColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    self.dicList = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    // self.tableView.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger numberOfSections = [[self.dicList allKeys] count];
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
    if(section == 0)
    {
        numberOfRows = [[self.dicList objectForKey:@"FirstSection"] count];
    }
    else if(section == 1)
    {
        numberOfRows = [[self.dicList objectForKey:@"SecondSection"] count];
    }
    else if(section == 2)
    {
        numberOfRows = [[self.dicList objectForKey:@"ThirdSection"] count];
    }
    else if(section == 3)
    {
        numberOfRows = [[self.dicList objectForKey:@"FourthSection"] count];
    }
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifierString = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifierString ];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifierString];
    }
    
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    NSArray * arrList = nil;
    if(section == 0)
        arrList = [self.dicList objectForKey:@"FirstSection"];
    else if(section == 1)
        arrList = [self.dicList objectForKey:@"SecondSection"];
    else if(section == 2)
        arrList = [self.dicList objectForKey:@"ThirdSection"];
    else if(section == 3)
        arrList = [self.dicList objectForKey:@"FourthSection"];
    
    NSDictionary * dicItem = [arrList objectAtIndex:row];
    if(dicItem)
    {
        cell.imageView.image = [UIImage imageNamed:[dicItem objectForKey:@"image"]];
        cell.textLabel.text = [dicItem objectForKey:@"name"];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:16];
        
        if([[dicItem objectForKey:@"detailname"] length])
        {
            cell.detailTextLabel.text = [dicItem objectForKey:@"detailname"];
            cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:11];
            cell.detailTextLabel.textColor = [UIColor blackColor];
            
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    NSArray * arrList = nil;
    if(section == 0)
        arrList = [self.dicList objectForKey:@"FirstSection"];
    else if(section == 1)
        arrList = [self.dicList objectForKey:@"SecondSection"];
    else if(section == 2)
        arrList = [self.dicList objectForKey:@"ThirdSection"];
    else if(section == 3)
        arrList = [self.dicList objectForKey:@"FourthSection"];
    
    NSDictionary * dicItem = [arrList objectAtIndex:row];
    if(dicItem)
    {
        NSString * strName = [dicItem objectForKey:@"name"];
        RNBlurModalView * modalView = [[RNBlurModalView alloc] initWithTitle:@"你正在偷看" message:strName];
        
        modalView.defaultHideBlock = ^(void){NSLog(@"clolse this window!!");};
        
        [modalView show];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    NSArray * arrList = nil;
    if(section == 0)
        arrList = [self.dicList objectForKey:@"FirstSection"];
    else if(section == 1)
        arrList = [self.dicList objectForKey:@"SecondSection"];
    else if(section == 2)
        arrList = [self.dicList objectForKey:@"ThirdSection"];
    else if(section == 3)
        arrList = [self.dicList objectForKey:@"FourthSection"];
    
    NSDictionary * dicItem = [arrList objectAtIndex:row];
    CGFloat hight =  [[dicItem objectForKey:@"detailname"] length] ? 70.0f : 30.0f;
    
    return hight;
}

@end
