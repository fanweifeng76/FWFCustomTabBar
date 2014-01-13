//
//  FWFCustomTabBarView.m
//  FWFCustomTabBar
//
//  Created by Weifeng Fan on 1/7/14.
//  Copyright (c) 2014 Weifeng Fan. All rights reserved.
//

#import "FWFCustomTabBarView.h"


@interface FWFCustomTabBarView()
@property (strong) NSMutableArray * buttonItems;
@end


@implementation FWFCustomTabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.backgroundColor = [UIColor blackColor];
        self.buttonItems = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)layoutSubviews
{
    NSInteger maxCount = MAX( MAX(_normalItemImages.count, _normalItemBackgroundImages.count),
                              MAX(_highlightItemImages.count, _highlightItemBackgroundImages.count));
    CGRect tabBarFrame = self.frame;
    CGFloat buttonWidth = (tabBarFrame.size.width - (maxCount+1)*TABBARITEM_OFFSET) / maxCount;
    
    for(int index = 0 ; index< maxCount; index++)
    {
        CGFloat buttonX = TABBARITEM_OFFSET + (buttonWidth + TABBARITEM_OFFSET) * index;
        CGRect butttonFrame = CGRectMake(buttonX, TABBARITEM_OFFSET, buttonWidth,tabBarFrame.size.height- TABBARITEM_OFFSET);
        //UIButton * button = [[UIButton alloc] initWithFrame:frame];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = butttonFrame;
        
        //Setting Background image
        UIImage * normalBackgroundImage = [_normalItemBackgroundImages objectAtIndex:0];
        [button setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
        UIImage * highlightBackgroundImage = [_highlightItemBackgroundImages objectAtIndex:0];
        [button setBackgroundImage:highlightBackgroundImage forState:UIControlStateSelected];
        
        //Setting Selected image and Highlight image
        UIImage * normalImage = nil;
        UIImage * highlightImage = nil;
        if(_normalItemImages.count > index)
        {
           normalImage = [_normalItemImages objectAtIndex:index];
        }
        else
        {
            normalImage = [_normalItemImages objectAtIndex:0];
        }

        if(_highlightItemImages.count > index)
        {
            highlightImage = [_highlightItemImages objectAtIndex:index];
        }
        else
        {
            highlightImage = [_highlightItemImages objectAtIndex:0];
        }
        
        UIImageView *btnImgView = [[UIImageView alloc] initWithImage:normalImage highlightedImage:highlightImage];
        btnImgView.frame = CGRectMake((butttonFrame.size.width - 32)/2, 0, 32, 32);
        [button addSubview:btnImgView];

        //Setting Title
        UILabel * label = [[UILabel alloc] initWithFrame: CGRectMake(0, 32, buttonWidth, 17)];
        label.text = [self.itemTitles objectAtIndex:index];
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor colorWithWhite:1 alpha:1];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [button addSubview:label];
        
        //Other
        button.tag = index;
        [button addTarget:self action:@selector(clickTabbarButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttonItems addObject:button];
    }
    
    [self setSelectedIndex:0 ];
}

-(void)setSelectedIndex:(NSInteger)index
{
    _selectedIndex = index;
    UIButton *button = [self.buttonItems objectAtIndex:index];
    [self clickTabbarButton:button];
}

- (void)clickTabbarButton:(UIButton*)button
{
    //clear all highlight and select status
    for (UIButton * tabButton in self.subviews)
    {
        for (UIView *subView in [tabButton subviews])
        {
            if ([subView isKindOfClass:[UIImageView class]])
            {
                UIImageView * imgView = (UIImageView *)subView;
                imgView.highlighted = NO;
            }
        }
        
        tabButton.selected = NO;
    }
    
    //settinghighlight and select status
    for (UIView *subView in [button subviews])
    {
        if ([subView isKindOfClass:[UIImageView class]])
        {
            UIImageView * imgView = (UIImageView *)subView;
            imgView.highlighted = YES;
        }
    }
    button.selected = YES;
    
    //Send deleget msg
    if([self.delegate respondsToSelector:@selector(selectedButtonWithIndex:)])
    {
        [self.delegate selectedButtonWithIndex:button.tag];
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
