//
//  BaseAppCustomize.m
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/10/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import "BaseAppCustomize.h"

@implementation BaseAppCustomize

-(void)customizeNavigtionAppearance:(UIImage*)backgroundImage withBackTextColor:(UIColor *)color
{
    //Config system navigationbar text color
    if(color)
    {
        [[UINavigationBar appearance] setTintColor:color];
    }
    
    //Config system navigationbar Backgound image
    if(IOSVersion>=7.0)
    {
        //Funtion1: please use appeareance selector
        [[UINavigationBar appearance] setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
        
        //Funtion2:
        //UIColor * colorNavBackgound = [UIColor colorWithPatternImage: backgroundImage];
        //[[UINavigationBar appearance] setTintColor:colorNavBackgound];
        //[[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:43.0f/255.0f green:149.0f/255.0f blue:48.0f/255.0f alpha:1]];
        
        //Funtion2:
        //if([[UINavigationBar appearance] respondsToSelector:@selector(setBarTintColor:)])
        //{
        //    [[UINavigationBar appearance] performSelector:@selector(setBarTintColor:)
        //                                                  withObject:[UIColor colorWithRed:43.0f/255.0f green:149.0f/255.0f blue:48.0f/255.0f alpha:1]];
        //}
        
        //Notice: Error write
        //[self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
        //[self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    }
    else
    {
        UIColor * colorNavBackgound = [UIColor colorWithPatternImage: backgroundImage];
        [[UINavigationBar appearance] setTintColor:colorNavBackgound];
    }
}

@end
