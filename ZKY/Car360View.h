//
//  Car360View.h
//
//
//  Created by Jack Chen on 10-7-22.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
@interface UITouch (TouchSorting)

- (NSComparisonResult)compareAddress:(id)obj;

@end
 */


@protocol Car360ViewDelegate

@optional
- (void) didTouchBmw360View;


@end

@interface Car360View : UIView {
	
    CGPoint touchBeginPoint;

	UIImageView *carImageView;
    int currentIndex;
    

}

@property (nonatomic, strong) NSString * _prex;

- (void) fixedDirect;

- (void)reloadCar:(BOOL)animated;

- (void) car360view:(Car360View *)c360view showNextImage:(int)flag;



@end
