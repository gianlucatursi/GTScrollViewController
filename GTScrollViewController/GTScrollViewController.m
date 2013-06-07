//
//  GTProvaViewController.m
//  GTScrollViewController
//
//  Created by Gianluca Tursi on 29/04/13.
//  Copyright (c) 2013 Gianluca Tursi. All rights reserved.
//


#import "GTScrollViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface GTScrollViewController ()
@property (strong, nonatomic)UIScrollView *scroll;
@end

@implementation GTScrollViewController
@synthesize scroll;
@synthesize myViews;
@synthesize paddingTopBottom;
@synthesize paddingLeftRight;
@synthesize cornerRadius;
@synthesize shadowRadius;
@synthesize shadowOpacity;

-(id)init:(NSArray *)views{

    return [self init:views andPaddingTopBottom:10];
}

-(id)init:(NSMutableArray *)views andPaddingTopBottom:(float)padTB{
    if(self){
        // init the scroll view with default parameter
        scroll = [[UIScrollView alloc] init];
        [scroll setContentSize:CGSizeMake(320, 900)];
        [scroll setScrollEnabled:YES];
        [scroll setBackgroundColor:[UIColor greenColor]];
        [scroll setShowsVerticalScrollIndicator:NO];
        [scroll setShowsHorizontalScrollIndicator:NO];
        [self setView:scroll];
        [self setMyViews:views];
        [self setPaddingLeftRight:10];
        [self setPaddingTopBottom:padTB];
        
        if(myViews != nil){
            [self addViews:myViews];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(void)addViews:(NSArray *)views{
    
    for(UIView *view in views){

        [self addView:view];
    }

}
// add single view
-(void)addView:(UIView *)view{
    
    // get last view in subviews

    UIView *lastView = [self.view.subviews lastObject];
    myViews = [[NSMutableArray alloc] initWithArray:self.view.subviews];
    
    // this is the new position, if view ara GCRectMake(0,0,...)
    // otherwise the new position is y + GCRectMake(0,0,...) y value
    NSLog(@"Count : %d", [self.view.subviews count]);
    float y = lastView.frame.origin.y+lastView.frame.size.height+paddingTopBottom;
    if(lastView == nil)
        y = 10;

    CGRect frame = view.frame;
    frame.origin.y = y;
    frame.origin.x = paddingLeftRight;
    view.frame = frame;
    
    NSNumber *num = [NSNumber numberWithFloat:shadowOpacity];
    // test if shadowOpacity is set
    if (num != nil) {
        
        view.layer.masksToBounds = NO;
        view.layer.cornerRadius = cornerRadius;
        view.layer.shadowOffset = CGSizeMake(0, 0);
        view.layer.shadowRadius = shadowRadius;
        view.layer.shadowOpacity = shadowOpacity;
    }
    
    // if the new view exceeds the view of scroller I must resize scroller. 
    if((view.frame.origin.y + view.frame.size.height) >= self.view.frame.size.height){

        // the new height
        float newHeight = view.frame.origin.y+view.frame.size.height+paddingTopBottom;
        
        [self.scroll setContentSize:
         CGSizeMake(self.view.frame.size.width, newHeight)];
    }
    // add subview

    [self.view addSubview:view];
    
}

-(void)setBackgroundImage:(UIImage *)image{
    // change background
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

-(void)setShadowRadius:(float)sr shadowOpacity:(float)so andCornerRadius:(float)cr{
    [self setShadowRadius:sr];
    [self setCornerRadius:cr];
    [self setShadowOpacity:so];
}

-(void)restoreShadowRadiusOpacityAndCornerRadius{
    [self setShadowRadius:3 shadowOpacity:0.5 andCornerRadius:2];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
