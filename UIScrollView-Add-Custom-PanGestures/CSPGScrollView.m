//
//  CSPGScrollView.m
//  UIScrollView-Add-Custom-PanGestures
//
//  Created by George Poenaru on 3/29/13.
//  Copyright (c) 2013 George Poenaru. All rights reserved.
//

#import "CSPGScrollView.h"

@implementation CSPGScrollView

@synthesize label, accumulator;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //Add Label
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/10)];
        [label setCenter:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        [label setBackgroundColor:[UIColor greenColor]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setText:@" NSLog:"];
        [label setTextColor:[UIColor redColor]];
        [self addSubview:label];
        
        
        //set scroll container size
        [self setContentSize:CGSizeMake(CGRectGetWidth(self.frame)*2, CGRectGetHeight(self.frame)*2)];
        
        
        //add vertical gesture recognition
        UIPanGestureRecognizer *verticalPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(verticalPan:)];
        [self addGestureRecognizer:verticalPan];
        
        //init the accumulator array
        accumulator = [NSMutableArray array];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


//don't forget to conform to the UIGestureRecognizerDelegate protocol to be able to recognize self.panGestureRecognition and your verticalPan gesture in the same time
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}

//custom method
- (void)verticalPan :(UIPanGestureRecognizer *) sender {
    
    CGPoint touch  = [sender translationInView:self];
    NSValue *value = [NSValue valueWithCGPoint:touch];
    [accumulator addObject:value];
    
    int firstXObjectValue = (int)[[accumulator objectAtIndex:0] CGPointValue].x ;
    int lastXObjectValue =  (int)[[accumulator lastObject] CGPointValue].x;
    
    int firstYObjectValue = (int)[[accumulator objectAtIndex:0] CGPointValue].y;
    int lastYObjectValue =  (int)[[accumulator lastObject] CGPointValue].y;
    
    if (abs(lastYObjectValue - firstYObjectValue) < 4 && abs(lastXObjectValue - firstXObjectValue) > 4) {
        [label setText:@"Horizontal Pan"];
        
        //do something here
    }
    else if (abs(lastYObjectValue - firstYObjectValue) > 4 && abs(lastXObjectValue - firstXObjectValue) < 4){
        [label setText:@"Vertical Pan"];
        
        //do something here
    }
    
    if (accumulator.count > 3)
        [accumulator removeAllObjects];
    
}

@end
