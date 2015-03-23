//
//  ScaleView.m
//  ZKY
//
//  Created by jack on 1/28/15.
//  Copyright (c) 2015 jack. All rights reserved.
//

#import "ScaleView.h"

@interface ScaleView ()
{
    UIImageView *_midLine;
}
@end


@implementation ScaleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UIImageView *line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]];
        [self addSubview:line];
        line.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        
        _midLine = line;
        _midLine.alpha = 0.8;
    }
    
    return self;
}

- (void) showScale:(float)start space:(float)space max:(int)max
{
    
    float x = start;
    for(int i = 0; i <= max; i+=10)
    {
        
        UILabel *line0 = [[UILabel alloc] initWithFrame:CGRectMake(x,
                                                                   CGRectGetMinY(_midLine.frame)-14,
                                                                   1, 14)];
        line0.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
        [self addSubview:line0];
        
        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        lb.backgroundColor = [UIColor clearColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.font = [UIFont boldSystemFontOfSize:15];
        lb.textColor = line0.backgroundColor;
        [self addSubview:lb];
        lb.text = [NSString stringWithFormat:@"%d", i];
        lb.center = CGPointMake(line0.center.x, CGRectGetMaxY(_midLine.frame)+20);
        
        if(i == max)
        {
            lb.text = [NSString stringWithFormat:@"%d(CM)", i];
        }
        else
        {
            x+=space/2;
            
            UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(x,
                                                                       CGRectGetMinY(_midLine.frame)-7,
                                                                       1, 7)];
            line1.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
            [self addSubview:line1];
            
            x+=space/2;
        }
    
    }
}


@end
