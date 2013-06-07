//
//  GTAppDelegate.h
//  GTScrollViewController
//
//  Created by Gianluca Tursi on 29/04/13.
//  Copyright (c) 2013 Gianluca Tursi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTScrollViewController.h"
@interface GTAppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) GTScrollViewController *scroller;

@end
