//
//  CSPGScrollView.h
//  UIScrollView-Add-Custom-PanGestures
//
//  Created by George Poenaru on 3/29/13.
//  Copyright (c) 2013 George Poenaru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSPGScrollView : UIScrollView <UIGestureRecognizerDelegate>

//don't forget to conform to the UIGestureRecognizerDelegate protocol to be able to recognize self.panGestureRecognition and your verticalPan gesture in the same time

@property(nonatomic) UILabel *label;
@property(nonatomic) NSMutableArray *accumulator;

@end
