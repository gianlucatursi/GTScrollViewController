//
//  GTProvaViewController.h
//  GTScrollViewController
//
//  Created by Gianluca Tursi on 29/04/13.
//  Copyright (c) 2013 Gianluca Tursi. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface GTScrollViewController : UIViewController

@property (strong, nonatomic)NSArray *myViews;
@property float paddingTopBottom;
@property float paddingLeftRight;
@property float cornerRadius;
@property float shadowRadius;
@property float shadowOpacity;

// init method passing array of view
-(id)init:(NSArray *)views;
// init method passing array of view and padding
-(id)init:(NSArray *)views andPaddingTopBottom:(float)padTB;

-(void)setBackgroundImage:(UIImage*) image;
// add one view
-(void)addView:(UIView *)view;
// add array of view
-(void)addViews:(NSArray *)views;
// set shadow and corner
-(void)setShadowRadius:(float)sr shadowOpacity:(float)so andCornerRadius:(float)cr;
// restore default value for shadow and radius
-(void)restoreShadowRadiusOpacityAndCornerRadius;

@end
