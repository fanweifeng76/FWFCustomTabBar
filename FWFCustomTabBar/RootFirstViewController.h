//
//  RootFirstViewController.h
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SWTableViewCell.h"

@interface RootFirstViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate, SWTableViewCellDelegate>

@property (nonatomic, retain) IBOutlet UITableView * tableFWFView;
@property (nonatomic, retain) NSDictionary* dicData;
@property (nonatomic, retain) NSMutableArray*      arrList;

@end
