//
//  GTAppDelegate.m
//  GTScrollViewController
//
//  Created by Gianluca Tursi on 29/04/13.
//  Copyright (c) 2013 Gianluca Tursi. All rights reserved.
//

#import "GTAppDelegate.h"

@implementation GTAppDelegate
@synthesize nav,scroller;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Two view with label for Demo app
    // IMPORTANT: x and y are calculate automatically
    UIView *first = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    [first setBackgroundColor:[UIColor orangeColor]];
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    [lbl setText:@"1"];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setFont:[UIFont boldSystemFontOfSize:50]];
    [lbl setTextColor:[UIColor whiteColor]];
    
    [first addSubview:lbl];
    
    UIView *second = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    [second setBackgroundColor:[UIColor greenColor]];
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    [lbl setText:@"2"];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setFont:[UIFont boldSystemFontOfSize:50]];
    [lbl setTextColor:[UIColor whiteColor]];
    [second addSubview:lbl];

    /* Init the ScrollController with top and bottom padding = 10*/
    scroller = [[GTScrollViewController alloc] init:nil andPaddingTopBottom:10];
    /* set shadowRadius, opacity and cornerRadius for any view */
    [scroller setShadowRadius:3 shadowOpacity:0.5 andCornerRadius:2];
    /* add all view */
    [scroller addViews:[[NSArray alloc] initWithObjects: first,second, nil]];
    /* set background image */

    [scroller setBackgroundImage:[UIImage imageNamed:@"texture.png"]];
    /* for add other view:

    [scroller addView:newView];
     */
    nav = [[UINavigationController alloc] initWithRootViewController:scroller];

    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"Add view" style:UIBarButtonItemStyleBordered target:self action:@selector(aggiungi:)];
    
    [scroller.navigationItem setRightBarButtonItem:right animated:NO];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(IBAction)aggiungi:(id)sender{
    
    UIView *third = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    
    [third setBackgroundColor:[UIColor brownColor]];
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    [lbl setText:@"3"];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setFont:[UIFont boldSystemFontOfSize:50]];
    [lbl setTextColor:[UIColor whiteColor]];
    [third addSubview:lbl];
    
    [scroller addView:third];
    third = nil;
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
