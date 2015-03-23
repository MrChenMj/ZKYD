//
//  TimeLine.h
//  ZKY
//
//  Created by jack on 1/25/15.
//  Copyright (c) 2015 jack. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TimeLineDelegate <NSObject>

- (void) didSelectedAtIndex:(int)index;

@end


@interface TimeLine : UIView
{
    UIImageView *_currentSel;
    UIColor *_themeC;
}
@property (nonatomic, weak) id <TimeLineDelegate> delegate_;

- (void) hiddenTipView;
- (void) cancelTipShowing;

@end
