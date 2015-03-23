//
//  Car360View.m
//
//
//  Created by Jack Chen on 10-7-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Car360View.h"


#define STARTUP_INDEX 3
#define STARTUP_COLOR 0
#define STARTUP_WHEEL 0
#define MOVE_OFFSET 7.5

@interface Car360View ()
{
    BOOL _isDirect;
}
@end


@implementation Car360View
@synthesize _prex;



- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
        
        carImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 1024, 768)];//614
        carImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:carImageView];
        carImageView.center = CGPointMake(self.center.x, self.center.y);
        carImageView.userInteractionEnabled = YES;
        
        _isDirect = YES;
        
    }
    return self;
}


- (void) fixedDirect{
    
    if(![self._prex isEqualToString:@"2-3D/00_1_000"])
    {
        _isDirect = NO;
    }
}


- (void)scaleIn:(int)zoom
{
    
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    
    if(finished)
    {
        
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */



#pragma mark -
#pragma mark BMW360ViewDelegate method
- (void) car360view:(Car360View *)c360view showNextImage:(int)flag {
    currentIndex += flag;
    if (flag > 0) {
        // Show next img
        if (currentIndex > 71) currentIndex -= 72;
    } else {
        // Show previous img
        if (currentIndex < 0) currentIndex += 72;
    }
    
    
     [self reloadCar:NO];
       
    //NSLog(@"%d",currentIndex);
}


#pragma mark -
#pragma mark Helper method
- (void)reloadCar:(BOOL)animated {
    

    
    NSString *imgName = [NSString stringWithFormat:@"%@%02d.png", _prex, currentIndex];
    NSString* carImgPath = [[NSBundle mainBundle] pathForResource:imgName ofType:nil];
    
    //carImageView.image = nil;
    carImageView.image = [UIImage imageWithContentsOfFile:carImgPath];
    

}


#pragma mark -
#pragma mark Touch events
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    touchBeginPoint = [touch locationInView:self];
    
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    NSSet *allTouches = [event allTouches];
    if([allTouches count] == 2){
        
    }
    else {
        CGPoint currentPoint = [touch locationInView:self];
        for (int i = 5; i > 0; i--) {
            if (currentPoint.x - touchBeginPoint.x < -i * MOVE_OFFSET) {
                [self car360view:self showNextImage:i];
                touchBeginPoint = currentPoint;
                return ;
            } else if (currentPoint.x - touchBeginPoint.x > i * MOVE_OFFSET) {
                [self car360view:self showNextImage:-i];
                touchBeginPoint = currentPoint;
                return ;
            }
        }
    }
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSSet *allTouches = [event allTouches];
    switch ([allTouches count]) {
        case 2:
            
            
            break;
        default:
            break;
    }
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}




- (void)dealloc {
    
    
}

@end
