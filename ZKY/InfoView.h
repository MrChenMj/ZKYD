//
//  InfoView.h
//  ZKY
//
//  Created by jack on 1/28/15.
//  Copyright (c) 2015 jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoView : UIImageView
{
    int _yearIndex;
}
@property (nonatomic, strong) NSMutableArray *_datas;
@property (nonatomic, assign) int _yearIndex;

- (void) layoutAtIndex:(int)index;
@end
