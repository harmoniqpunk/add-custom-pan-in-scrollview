//
//  CSPGViewController.m
//  UIScrollView-Add-Custom-PanGestures
//
//  Created by George Poenaru on 3/29/13.
//  Copyright (c) 2013 George Poenaru. All rights reserved.
//

#import "CSPGViewController.h"
#import "CSPGScrollView.h"

@interface CSPGViewController ()

@end

@implementation CSPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   CSPGScrollView  *customScrollView = [[CSPGScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,
                                                                       self.view.frame.size.height)];
    
    [self.view addSubview:customScrollView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
