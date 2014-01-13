//
//  MainManageTabBarController.m
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import "MainManageTabBarController.h"
#import "RootFirstViewController.h"
#import "RootSecondViewController.h"
#import "RootThirdViewController.h"
#import "RootFourthViewController.h"
#import "RootFifthViewController.h"

//Key
static NSString * keyRootFirstTitle = @"银行";
static NSString * keyRootSecondTitle = @"聚众";
static NSString * keyRootThirdTitle = @"发现";
static NSString * keyRootFourthTitle = @"哥们";


@interface MainManageTabBarController ()
{
    FWFCustomTabBarView *_customTabBar;
}

@end

#pragma mark
@implementation MainManageTabBarController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

#pragma mark
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self loadSystemTabBarView];
    [self loadCustomTabBarView];
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark

-(void)selectedButtonWithIndex:(NSInteger)index
{
    self.selectedIndex = index;
    
}

#pragma mark
-(void)loadSystemTabBarView
{
    //init view controller
    RootFirstViewController * rootFirstViewController = [[RootFirstViewController alloc] initWithNibName:@"RootFirstViewController" bundle:nil];
    RootSecondViewController * rootSecondViewController = [[RootSecondViewController alloc] initWithNibName:@"RootSecondViewController" bundle:nil];
    RootThirdViewController * rootThirdViewController = [[RootThirdViewController alloc] initWithNibName:@"RootThirdViewController" bundle:nil];
    RootFourthViewController * rootFourthViewController = [[RootFourthViewController alloc] initWithNibName:@"RootFourthViewController" bundle:nil];
    
    //init navigation controller
    UINavigationController* navRootFirstViewController = [[UINavigationController alloc] initWithRootViewController:rootFirstViewController];
    UINavigationController* navRootSecondViewController = [[UINavigationController alloc] initWithRootViewController:rootSecondViewController];
    UINavigationController* navRootThirdViewController = [[UINavigationController alloc] initWithRootViewController:rootThirdViewController];
    UINavigationController* navRootFourthViewController = [[UINavigationController alloc] initWithRootViewController:rootFourthViewController];
    
    //set root Title
    rootFirstViewController.title = keyRootFirstTitle;
    rootSecondViewController.title = keyRootSecondTitle;
    rootThirdViewController.title = keyRootThirdTitle;
    rootFourthViewController.title = keyRootFourthTitle;
    
    //load into tabbar controller
    self.viewControllers = @[navRootFirstViewController,navRootSecondViewController,navRootThirdViewController,navRootFourthViewController];
    
    self.delegate = self;
}

-(void)loadCustomTabBarView
{
    BOOL bSubViewIntoTabBar = 1;
    
    if(bSubViewIntoTabBar)
    {
        CGRect customBarFram = self.tabBar.frame;
        customBarFram.origin = CGPointZero;
        NSLog(@"customBarFram = %@",NSStringFromCGRect(customBarFram));
        
        _customTabBar = [[FWFCustomTabBarView alloc] initWithFrame:customBarFram];
        
        _customTabBar.itemTitles = [[NSArray alloc] initWithObjects:keyRootFirstTitle,keyRootSecondTitle,keyRootThirdTitle,keyRootFourthTitle,nil];
        //
        UIImage * timelineIcon = [UIImage imageNamed:@"tab_icon_chat"];
        UIImage * mentionsIcon = [UIImage imageNamed:@"tab_icon_friends"];
        UIImage * messagesIcon = [UIImage imageNamed:@"tab_icon_feeds"];
        UIImage * searchIcon = [UIImage imageNamed:@"tab_icon_more"];
        
        UIImage * timelineIconHighlighted = [UIImage imageNamed:@"tab_icon_chat_selected"];
        UIImage * mentionsIconHighlighted = [UIImage imageNamed:@"tab_icon_friends_selected"];
        UIImage * messagesIconHighlighted = [UIImage imageNamed:@"tab_icon_feeds_selected"];
        UIImage * searchIconHighlighted = [UIImage imageNamed:@"tab_icon_more_selected"];
        
        UIImage *tabButtonBackground = [[UIImage imageNamed:@"tabBar"]
                                        stretchableImageWithLeftCapWidth:4 topCapHeight:4];
        UIImage *tabButtonBackgroundHighlighted = [[UIImage imageNamed:@"tabBar_selected"]
                                                   stretchableImageWithLeftCapWidth:4 topCapHeight:4];

        _customTabBar.normalItemImages = @[timelineIcon,mentionsIcon,messagesIcon,searchIcon];
        _customTabBar.highlightItemImages = @[timelineIconHighlighted,mentionsIconHighlighted,messagesIconHighlighted,searchIconHighlighted];
        _customTabBar.normalItemBackgroundImages = @[tabButtonBackground];
        _customTabBar.highlightItemBackgroundImages = @[tabButtonBackgroundHighlighted];
        
        _customTabBar.delegate = self;
        
        [self.tabBar addSubview:_customTabBar];
    }
    else
    {
        
        CGRect viewFrame = self.view.frame;
        CGRect systemBarFrame = self.tabBar.frame;
        CGRect customBarFram = CGRectMake(0, viewFrame.size.height - systemBarFrame.size.height, systemBarFrame.size.width, systemBarFrame.size.height);
        NSLog(@"viewFrame = %@",NSStringFromCGRect(viewFrame));
        NSLog(@"systemBarFrame = %@",NSStringFromCGRect(systemBarFrame));
        NSLog(@"customBarFram = %@",NSStringFromCGRect(customBarFram));
        
        _customTabBar = [[FWFCustomTabBarView alloc] initWithFrame:customBarFram];
        
        _customTabBar.itemTitles = [[NSArray alloc] initWithObjects:keyRootFirstTitle,keyRootSecondTitle,keyRootThirdTitle,keyRootFourthTitle,nil];
        //
        UIImage * timelineIcon = [UIImage imageNamed:@"tab_icon_chat"];
        UIImage * mentionsIcon = [UIImage imageNamed:@"tab_icon_friends"];
        UIImage * messagesIcon = [UIImage imageNamed:@"tab_icon_feeds"];
        UIImage * searchIcon = [UIImage imageNamed:@"tab_icon_more"];
        
        UIImage * timelineIconHighlighted = [UIImage imageNamed:@"tab_icon_chat_selected"];
        UIImage * mentionsIconHighlighted = [UIImage imageNamed:@"tab_icon_friends_selected"];
        UIImage * messagesIconHighlighted = [UIImage imageNamed:@"tab_icon_feeds_selected"];
        UIImage * searchIconHighlighted = [UIImage imageNamed:@"tab_icon_more_selected"];
        
        UIImage *tabButtonBackground = [[UIImage imageNamed:@"tabBar"]
                                        stretchableImageWithLeftCapWidth:4 topCapHeight:4];
        UIImage *tabButtonBackgroundHighlighted = [[UIImage imageNamed:@"tabBar_selected"]
                                                   stretchableImageWithLeftCapWidth:4 topCapHeight:4];
        
        _customTabBar.normalItemImages = @[timelineIcon,mentionsIcon,messagesIcon,searchIcon];
        _customTabBar.highlightItemImages = @[timelineIconHighlighted,mentionsIconHighlighted,messagesIconHighlighted,searchIconHighlighted];
        _customTabBar.normalItemBackgroundImages = @[tabButtonBackground];
        _customTabBar.highlightItemBackgroundImages = @[tabButtonBackgroundHighlighted];
        
        _customTabBar.delegate = self;
        
        [self.view addSubview:_customTabBar];
        
    }
}

@end
