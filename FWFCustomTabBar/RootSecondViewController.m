//
//  RootSecondViewController.m
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import "RootSecondViewController.h"
#import "RootFifthViewController.h"

typedef enum {
    kCellStateCenter,
    kCellStateLeft,
    kCellStateRight
} CellState;

@interface RootSecondViewController ()
{
    IBOutlet UIScrollView * scView;
    CellState cellState;
    UILabel *buttonLeft;
    UILabel *buttonMid;
    UILabel *buttonRight;
}
@end

@implementation RootSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = [UIColor orangeColor];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setLeftNavigateButtonImages:@[[UIImage imageNamed:@"nav_icon_refresh"]]
                        withHighlight:@[[UIImage imageNamed:@"nav_icon_refresh_click"]]
                               target:self
                       buttonSelector:@selector(clickLeftNavBarButtonItem:)];
    
    [self setRightNavigateButtonImages:@[[UIImage imageNamed:@"nav_icon_refresh"]]
                         withHighlight:@[[UIImage imageNamed:@"nav_icon_refresh_click"]]
                                target:self
                        buttonSelector:@selector(clickRightNavBarButtonItem:)];
    
//    
//    2014-01-12 15:21:55.116 SWTableViewCell[708:60b] 1:layout cellScrollView frame = {{0, 0}, {320, 90}}, contentSize = {760, 90}, contentOffset = {260, 0}
//    2014-01-12 15:21:55.118 SWTableViewCell[708:60b] 2:layout scrollViewButtonViewLeft frame = {{260, 0}, {260, 90}}
//    2014-01-12 15:21:55.120 SWTableViewCell[708:60b] 3:layout scrollViewButtonViewRight frame = {{320, 0}, {180, 90}}
//    2014-01-12 15:21:55.122 SWTableViewCell[708:60b] 4:layout scrollViewContentView frame = {{260, 0}, {320, 90}}
//
    
    cellState = kCellStateCenter;
    scView.frame = CGRectMake(0,0,320,90);//{{0, 0}, {320, 480}};
    scView.contentSize = CGSizeMake(760, 90); //{760, 480};
    scView.contentOffset = CGPointMake(260, 0); //{260, 0};
    scView.delegate = self;
    
    buttonLeft = [[UILabel alloc] init];
    buttonLeft.frame = CGRectMake(260, 100, 260,90);
    buttonLeft.backgroundColor = [UIColor grayColor];
    buttonLeft.text = @"左边划块左边划块左边划块左边划块左边划块";
    buttonRight = [[UILabel alloc] init];
    buttonRight.frame = CGRectMake(320, 100, 180,90);
    buttonRight.backgroundColor = [UIColor redColor];
    buttonRight.text = @"右边划块右边划块右边划块右边划块";
    
    buttonMid = [[UILabel alloc] init];
    buttonMid.frame = CGRectMake(260, 100, 320,90);
    buttonMid.backgroundColor = [UIColor blueColor];
    buttonMid.text = @"中间划块";
    
    [scView addSubview:buttonLeft];
    [scView addSubview:buttonRight];
    [scView addSubview:buttonMid];
    
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

-(void)clickLeftNavBarButtonItem:(UIButton*)button
{
    if(button.tag == 0)  //addChat
    {
        
    }
}

-(void)clickRightNavBarButtonItem:(UIButton*)button
{
    if(button.tag == 0)  //addChat
    {
        RootFifthViewController * test  = [[RootFifthViewController alloc] init];
        [self.navigationController pushViewController:test animated:YES];
    }
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    switch (cellState)
    {
        case kCellStateCenter:
            if (velocity.x >= 0.5f) //scrollToRight
            {
                targetContentOffset->x = 440;
                cellState = kCellStateRight;
            }
            else if (velocity.x <= -0.5f) //scrollToLeft
            {
                targetContentOffset->x = 0;
                cellState = kCellStateLeft;
            }
            else
            {
                CGFloat rightThreshold = 260 + 180/2;
                CGFloat leftThreshold = 260 / 2;
                if (targetContentOffset->x > rightThreshold)
                {
                    targetContentOffset->x = 440;
                    cellState = kCellStateRight;
                }
                else if (targetContentOffset->x < leftThreshold)
                {
                    targetContentOffset->x = 0;
                    cellState = kCellStateLeft;
                }
                else
                {
                    targetContentOffset->x = 260;
                    cellState = kCellStateCenter;
                }
            }
            break;
        case kCellStateLeft:
            if (velocity.x >= 0.5f)
            {
                targetContentOffset->x = 260;
                cellState = kCellStateCenter;
            }
            else if (velocity.x <= -0.5f)
            {
                // No-op
            }
            else
            {
                if (targetContentOffset->x >= (440 - 180/2))
                {
                    targetContentOffset->x = 440;
                    cellState = kCellStateRight;
                }
                else if (targetContentOffset->x > 260/2)
                {
                    targetContentOffset->x = 260;
                    cellState = kCellStateCenter;
                }
                else
                {
                    targetContentOffset->x = 0;
                    cellState = kCellStateLeft;
                }
            }
            break;
        case kCellStateRight:
            if (velocity.x >= 0.5f)
            {
                // No-op
            }
            else if (velocity.x <= -0.5f)
            {
                targetContentOffset->x = 260;
                cellState = kCellStateCenter;
            }
            else
            {
                if (targetContentOffset->x <= 260 / 2)
                {
                    targetContentOffset->x = 0;
                    cellState = kCellStateLeft;
                }
                else if (targetContentOffset->x < (440- 180/2))
                {
                    targetContentOffset->x = 260;
                    cellState = kCellStateCenter;
                }
                else
                {
                    targetContentOffset->x = 440;
                    cellState = kCellStateRight;
                }
            }
            break;
        default:
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > 260)
    {
        // Expose the right button view
        CGRect frame = self->buttonRight.frame;
        frame.origin.x = scrollView.contentOffset.x + 320 - 180;
        self->buttonRight.frame = frame;
    }
    else
    {
        // Expose the left button view
        CGRect frame = self->buttonLeft.frame;
        frame.origin.x = scrollView.contentOffset.x;
        self->buttonLeft.frame = frame;
    }
}


@end
