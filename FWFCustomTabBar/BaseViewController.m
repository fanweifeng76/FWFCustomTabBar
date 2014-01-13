//
//  BaseViewController.m
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTitle:(NSString *)title
{
    [self setMiddleNavigateTitle:title];
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
@end

#pragma mark
@implementation BaseViewController (CustomNavigateImage)

#define kButtonsWidthMax 130.0f
#define kButtonWidthDefault 62.0f

-(void)setRightNavigateButtonImages:(NSArray*)imageArray withHighlight:(NSArray*)highlightImages target:(id)target buttonSelector:(SEL)buttonSelector
{
    CGFloat imageOffset = 15.0f;
    CGFloat imageSpace = 0.0f;
    CGFloat imageWidth = kButtonWidthDefault;
    CGFloat imageHigh = 44.0f;
    
    NSInteger count = MIN([imageArray count], [highlightImages count]);
    if (imageWidth * count > kButtonsWidthMax)
    {
        imageWidth -=(imageWidth * count - kButtonsWidthMax) /count;
    }
   
    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageWidth * count, imageHigh)];
    for(NSInteger index = 0; index < count; index++)
    {
        UIButton * rightButton = [[UIButton alloc] initWithFrame:CGRectMake((imageWidth+imageSpace)*index + imageOffset, 0, imageWidth, imageHigh)];
        [rightButton setImage:[imageArray objectAtIndex:index] forState:UIControlStateNormal];
        [rightButton setImage:[highlightImages objectAtIndex:index] forState:UIControlStateHighlighted];
        rightButton.tag = index;
        [rightButton addTarget:target action:buttonSelector forControlEvents:UIControlEventTouchUpInside];
        
        [rightView addSubview: rightButton];
    }
    UIBarButtonItem * rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

-(void)setLeftNavigateButtonImages:(NSArray*)imageArray withHighlight:(NSArray*)highlightImages target:(id)target buttonSelector:(SEL)buttonSelector
{
    CGFloat imageOffset = 15.0f;
    CGFloat imageSpace = 0.0f;
    CGFloat imageWidth = kButtonWidthDefault;
    CGFloat imageHigh = 44.0f;
    
    NSInteger count = MIN([imageArray count], [highlightImages count]);
    if (imageWidth * count > kButtonsWidthMax)
    {
        imageWidth -=(imageWidth * count - kButtonsWidthMax) /count;
    }
    
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageWidth * count, imageHigh)];
    for(NSInteger index = 0; index < count; index++)
    {
        UIButton * leftButton = [[UIButton alloc] initWithFrame:CGRectMake((imageWidth+imageSpace)*index + imageOffset, 0, imageWidth, imageHigh)];
        [leftButton setImage:[imageArray objectAtIndex:index] forState:UIControlStateNormal];
        [leftButton setImage:[highlightImages objectAtIndex:index] forState:UIControlStateHighlighted];
        leftButton.tag = index;
        [leftButton addTarget:target action:buttonSelector forControlEvents:UIControlEventTouchUpInside];
        
        [leftView addSubview: leftButton];
    }
    UIBarButtonItem * leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
 
}

-(void)setMiddleNavigateTitle:(NSString*)title;
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,44,44)];
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:19.0f];
    label.textColor = [UIColor colorWithWhite:1 alpha:1];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
}

@end