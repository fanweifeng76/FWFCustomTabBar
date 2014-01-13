//
//  RootFirstViewController.m
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import "RootFirstViewController.h"
#import "BankWebLinkController.h"
#import "MainManageTabBarController.h"

@interface RootFirstViewController ()

@end

#pragma mark
@implementation RootFirstViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        //_tableFWFView.tableFooterView = frame;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Navigation bar Item
    UIImage * leftImage1 = [UIImage imageNamed:@"nav_icon_quickArrow"];
    UIImage * leftHLImage1 = [UIImage imageNamed:@"nav_icon_quickArrow_click"];
    
    UIImage * rightImage1 = [UIImage imageNamed:@"nav_icon_edit_event"];
    UIImage * rightImage2 = [UIImage imageNamed:@"nav_icon_addChat"];
    UIImage * rightHLImage1 = [UIImage imageNamed:@"nav_icon_edit_event_click"];
    UIImage * rightHLImage2 = [UIImage imageNamed:@"nav_icon_addChat_click"];
    
    [self setLeftNavigateButtonImages:@[leftImage1]
                        withHighlight:@[leftHLImage1]
                               target:self
                       buttonSelector:@selector(clickLeftNavBarButtonItem:)];
    
    [self setRightNavigateButtonImages:@[rightImage1,rightImage2]
                         withHighlight:@[rightHLImage1,rightHLImage2]
                                target:self
                        buttonSelector:@selector(clickRightNavBarButtonItem:)];
    
    
    //Table
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"banklist" ofType:@"plist"];
    _arrList = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    _tableFWFView.delegate = self;
    _tableFWFView.dataSource = self;
    _tableFWFView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableFWFView.rowHeight = 50.0f;
    _tableFWFView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableFWFView.separatorColor = [UIColor colorWithRed:43.0f/255.0f green:149.0f/255.0f blue:48.0f/255.0f alpha:1];//[UIColor colorWithWhite:0.5 alpha:0.8];
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

#pragma mark

-(void)clickLeftNavBarButtonItem:(UIButton*)button
{
    if(button.tag ==0)  //quickArrow
    {
        
    }
}


-(void)clickRightNavBarButtonItem:(UIButton*)button
{
    if(button.tag == 1) //nav_icon_addChat
    {
        BankWebLinkController * chatDetail  = [[BankWebLinkController alloc] init];
        [self.navigationController pushViewController:chatDetail animated:YES];
    }
}


#pragma mark
- (void)swippableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index
{
    
}

- (void)swippableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    NSIndexPath *indexPath1 = [_tableFWFView indexPathForCell:cell];
    NSInteger row = indexPath1.row;
    [_arrList removeObjectAtIndex:row];
    
    [_tableFWFView deleteRowsAtIndexPaths:@[indexPath1] withRowAnimation:UITableViewRowAnimationLeft];
}

- (void)swippableTableViewCell:(SWTableViewCell *)cell scrollingToState:(SWCellState)state
{
    
}


#pragma mark
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [self.arrList count];
    return count;
}

#if 1
//Now Use SWTableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"ScrollCell";
    SWTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    
    if(cell)
    {
        for(UIView * subView in cell.contentView.subviews)
        {
          [subView removeFromSuperview];
        }
        
    }
    else
    {
        NSMutableArray *rightUtilityButtons = [NSMutableArray new];
        [rightUtilityButtons addUtilityButtonWithColor:[UIColor redColor]
                                                 title:@"删除"];

        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier
                                  containingTableView:_tableFWFView // Used for row height and selection
                                   leftUtilityButtons:nil
                                  rightUtilityButtons:rightUtilityButtons];
        cell.delegate = self;
    }
    
    
    NSDictionary* data = [_arrList objectAtIndex:[indexPath row]];

    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[data objectForKey:@"image"]]];
    imageView.frame = CGRectMake(10,8,30,30);
    
    UILabel * labName = [[UILabel alloc] initWithFrame:CGRectMake(60,3,200,25)];
    labName.text = [data objectForKey:@"name"];
    labName.backgroundColor = [UIColor clearColor];
    labName.font = [UIFont boldSystemFontOfSize:14];

    UILabel * labURL = [[UILabel alloc] initWithFrame:CGRectMake(60,25,250,15)];
    labURL.text = [NSString stringWithFormat:@"投资理财,欢迎访问: %@",[data objectForKey:@"url"]];
    labURL.backgroundColor = [UIColor clearColor];
    labURL.font = [UIFont systemFontOfSize:10];
    labURL.textColor = [UIColor grayColor];
    
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:MM:SS"];//@"YYYY-MM-DD HH:MM:SS"];
    NSString *strDate = [formatter stringFromDate:date];
    UILabel * labTime = [[UILabel alloc] initWithFrame:CGRectMake(240,3,60,15)];
    labTime.text = strDate;
    labTime.backgroundColor = [UIColor clearColor];
    labTime.font = [UIFont systemFontOfSize:10];
    labTime.textColor = [UIColor grayColor];
    labTime.textAlignment = NSTextAlignmentRight;

    [cell.contentView addSubview:imageView];
    [cell.contentView addSubview:labName];
    [cell.contentView addSubview:labURL];
    [cell.contentView addSubview:labTime];

    return cell;
}

#else

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"ScrollCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];//[tableView cellForRowAtIndexPath:indexPath];
    
    if(cell)
    {
        NSDictionary* data = [_arrList objectAtIndex:[indexPath row]];
        NSLog(@"Reusable row = %d, bank = %@ ",[indexPath row] , [data objectForKey:@"name"]);
        for(UIView * subView in cell.contentView.subviews)
        {
            [subView removeFromSuperview];
        }
    }
    else
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    NSDictionary* data = [_arrList objectAtIndex:[indexPath row]];
    NSLog(@"table row = %d, bank = %@ , image = %@",[indexPath row] , [data objectForKey:@"name"],[data objectForKey:@"image"]);
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[data objectForKey:@"image"]]];
    imageView.frame = CGRectMake(10,8,30,30);
    
    UILabel * labName = [[UILabel alloc] initWithFrame:CGRectMake(60,3,200,25)];
    labName.text = [data objectForKey:@"name"];
    labName.backgroundColor = [UIColor clearColor];
    labName.font = [UIFont boldSystemFontOfSize:14];

    UILabel * labURL = [[UILabel alloc] initWithFrame:CGRectMake(60,25,200,15)];
    labURL.text = [NSString stringWithFormat:@"投资理财,欢迎访问: %@",[data objectForKey:@"url"]];
    labURL.backgroundColor = [UIColor clearColor];
    labURL.font = [UIFont systemFontOfSize:10];
    labURL.textColor = [UIColor grayColor];
    
    NSDate * date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:MM:SS"];//@"YYYY-MM-DD HH:MM:SS"];
    NSString *strDate = [formatter stringFromDate:date];
    
    
    UILabel * labTime = [[UILabel alloc] initWithFrame:CGRectMake(220,3,60,15)];
    labTime.text = strDate;
    labTime.backgroundColor = [UIColor clearColor];
    labTime.font = [UIFont systemFontOfSize:10];
    labTime.textColor = [UIColor grayColor];
 
    labTime.textAlignment = NSTextAlignmentRight;
    
    [cell.contentView addSubview:imageView];
    [cell.contentView addSubview:labName];
    [cell.contentView addSubview:labURL];
    [cell.contentView addSubview:labTime];
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}
#endif

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSDictionary* data = [_arrList objectAtIndex:[indexPath row]];
    
    BankWebLinkController* bankWebLinkController = [[BankWebLinkController alloc] initWithNibName:@"BankWebLinkController" bundle:nil];
    bankWebLinkController.linkString = [data objectForKey:@"url"];
    
    [self.navigationController pushViewController:bankWebLinkController animated:YES];
    //[self presentViewController:bankWebLinkController animated:YES completion:nil];
    
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


@end
