//
//  BankWebLinkController.h
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/9/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface BankWebLinkController : BaseViewController

@property (nonatomic, retain) IBOutlet UIWebView* myWebView;
@property (nonatomic, retain) NSString * linkString;

@end
