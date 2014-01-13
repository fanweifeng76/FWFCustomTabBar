//
//  RootFifthViewController.m
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import "RootFifthViewController.h"

@interface RootFifthViewController ()

@end

@implementation RootFifthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        self.title = @"更多";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
