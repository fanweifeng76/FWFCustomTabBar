//
//  BaseViewController.h
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@end

@interface BaseViewController (CustomNavigateImage)

-(void)setRightNavigateButtonImages:(NSArray*)imageArray withHighlight:(NSArray*)highlightImages target:(id)target buttonSelector:(SEL)buttonSelector;
-(void)setLeftNavigateButtonImages: (NSArray*)imageArray withHighlight:(NSArray*)highlightImages target:(id)target buttonSelector:(SEL)buttonSelector;
-(void)setMiddleNavigateTitle:(NSString*)title;

@end
