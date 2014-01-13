//
//  FWFCustomTabBarView.h
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>


//FWFCustomTabBarViewDelegate
@protocol FWFCustomTabBarViewDelegate <NSObject>
@optional
-(void)selectedButtonWithIndex:(NSInteger)index;
@end


#pragma mark ---------FWFCustomTabBarView-------------
@interface FWFCustomTabBarView : UIView

@property (nonatomic, weak) id<FWFCustomTabBarViewDelegate> delegate;
@property (nonatomic, strong) NSArray *itemTitles;
@property (nonatomic, strong) NSArray *normalItemImages;
@property (nonatomic, strong) NSArray *normalItemBackgroundImages;
@property (nonatomic, strong) NSArray *highlightItemImages;
@property (nonatomic, strong) NSArray *highlightItemBackgroundImages;
@property (nonatomic, assign, setter = setSelectedIndex:) NSInteger selectedIndex;

@end


