//
//  BankWebLinkController
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/9/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import "BankWebLinkController.h"
#import "MainManageTabBarController.h"
@interface BankWebLinkController ()

@end

@implementation BankWebLinkController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.hidesBottomBarWhenPushed = YES;
        self.title= @"网站";
        self.view.backgroundColor = [UIColor yellowColor];
        
        
        self.navigationItem.hidesBackButton =YES;

        [self setLeftNavigateButtonImages:@[[UIImage imageNamed:@"nav_icon_back"]]
                            withHighlight:@[[UIImage imageNamed:@"nav_icon_back_click"]]
                                   target:self
                           buttonSelector:@selector(clickLeftNavBarButtonItem:)];
        
        [self setRightNavigateButtonImages:@[[UIImage imageNamed:@"nav_icon_sub"]]
                             withHighlight:@[[UIImage imageNamed:@"nav_icon_sub_click"]]
                                    target:self
                            buttonSelector:@selector(clickRightNavBarButtonItem:)];
        
  
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void) setLinkString:(NSString*)link
{
    NSURL* urlString = [NSURL URLWithString:link];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:urlString];
    [_myWebView loadRequest:request];
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

-(void)clickLeftNavBarButtonItem:(UIButton*)button //
{
    if(button.tag ==0)  //nav_icon_right_quit
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)clickRightNavBarButtonItem:(UIButton*)button
{
    if(button.tag == 0)  //
    {
    
    }
}





@end
