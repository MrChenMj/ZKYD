//
//  TimeLine.m
//  ZKY
//
//  Created by jack on 1/25/15.
//  Copyright (c) 2015 jack. All rights reserved.
//

#import "TimeLine.h"

@interface TimeLine()
{
    UIImageView *p1;
    UIImageView *p2;
    UIImageView *p3;
    UIImageView *p4;
    UIImageView *p5;
    UIImageView *p6;
    UIImageView *p7;
    UIImageView *p8;
    UIImageView *p9;
    
    UILabel *_line1;
    UILabel *_line2;
    UILabel *_line3;
    UILabel *_line4;
    UILabel *_line5;
    UILabel *_line6;
    UILabel *_line7;
    UILabel *_line8;
    UILabel *_line9;
    UILabel *_line10;
    
    UIImageView *_tipView;//307*85
    UILabel *_titleL;
    UILabel *_flag;
    UILabel *_abstract;
}
@property (nonatomic, strong) NSArray *_timeTitles;

@end

@implementation TimeLine
@synthesize delegate_;
@synthesize _timeTitles;

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
        
        self._timeTitles = @[@{@"title":@"早寒武世（距今约5．3亿年）",@"subtitle":@"代表生物：海口鱼",@"fenbu":@"云南省昆明市海口镇耳材村"},
                                           @{@"title":@"志留纪（距今约4.28亿年）",@"subtitle":@"代表生物：浙江曙鱼",@"fenbu":@"浙江北部，长兴、煤山一带"},
                                           @{@"title":@"晚泥盆世（距今约3.6亿年",@"subtitle":@"代表生物：鱼石螈",@"fenbu":@"格陵兰岛"},
                                           @{@"title":@"石炭纪（距今约3.12亿年）",@"subtitle":@"代表生物：林蜥",@"fenbu":@"北美洲"},
                                           @{@"title":@"二叠纪（距今约2.7亿年）",@"subtitle":@"代表生物：中龙",@"fenbu":@"南美洲和南非"},
                                           @{@"title":@"晚侏罗世（距今约1.6-1.5亿年）",@"subtitle":@"代表生物：宁城热河翼龙",@"fenbu":@"燕辽生物群（辽宁西部，内蒙古东南部以及河北北部）"},
                                           @{@"title":@"侏罗纪中晚期（距今约1.6亿年）",@"subtitle":@"代表生物：赫氏近鸟龙",@"fenbu":@"辽宁建昌"},
                                           @{@"title":@"早侏罗世（距今约1.9亿年",@"subtitle":@"代表生物：中国尖齿兽",@"fenbu":@"云南禄丰"},
                                           @{@"title":@"中新世（距今约700万年前）",@"subtitle":@"代表生物：乍得人",@"fenbu":@"目前乍得人只发现于非洲中部的乍得共和国"}
                                           ];
        
        UIImageView *p0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p0.center = CGPointMake(frame.size.width/2, p0.center.y);
        [self addSubview:p0];
        p0.layer.cornerRadius = 9;
        p0.layer.borderWidth = 5;
        p0.clipsToBounds = YES;
        p0.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.5].CGColor;
        
        _themeC = [UIColor colorWithWhite:1.0 alpha:0.5];
        
        UIImageView *pLast = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height-18, 18, 18)];
        pLast.center = CGPointMake(frame.size.width/2, pLast.center.y);
        [self addSubview:pLast];
        pLast.layer.cornerRadius = 9;
        pLast.layer.borderWidth = 5;
        pLast.clipsToBounds = YES;
        pLast.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.5].CGColor;
        
        float hh = CGRectGetMinY(pLast.frame) - CGRectGetMaxY(p0.frame);
        int space_h = hh/10.0+4;
        
        p1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p1.layer.cornerRadius = 9;
        p1.clipsToBounds = YES;
        p1.backgroundColor = _themeC;
        [self addSubview:p1];
        p1.center = CGPointMake(frame.size.width/2, space_h);//136/2
        
        p2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p2.layer.cornerRadius = 9;
        p2.clipsToBounds = YES;
        p2.backgroundColor = _themeC;
        [self addSubview:p2];
        p2.center = CGPointMake(frame.size.width/2, space_h*2);// 278/2
        
        p3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p3.layer.cornerRadius = 9;
        p3.clipsToBounds = YES;
        p3.backgroundColor = _themeC;
        [self addSubview:p3];
        p3.center = CGPointMake(frame.size.width/2, space_h*3);//380/2
        
        p4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p4.layer.cornerRadius = 9;
        p4.clipsToBounds = YES;
        p4.backgroundColor = _themeC;
        [self addSubview:p4];
        p4.center = CGPointMake(frame.size.width/2, space_h*4);//303
        
        p5 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p5.layer.cornerRadius = 9;
        p5.clipsToBounds = YES;
        p5.backgroundColor = _themeC;
        [self addSubview:p5];
        p5.center = CGPointMake(frame.size.width/2, space_h*5);//714/2
        
        p6 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p6.layer.cornerRadius = 9;
        p6.clipsToBounds = YES;
        p6.backgroundColor = _themeC;
        [self addSubview:p6];
        p6.center = CGPointMake(frame.size.width/2, space_h*6);//784/2
        
        p7 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p7.layer.cornerRadius = 9;
        p7.clipsToBounds = YES;
        p7.backgroundColor = _themeC;
        [self addSubview:p7];
        p7.center = CGPointMake(frame.size.width/2, space_h*7);//1024/2
        
        p8 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p8.layer.cornerRadius = 9;
        p8.clipsToBounds = YES;
        p8.backgroundColor = _themeC;
        [self addSubview:p8];
        p8.center = CGPointMake(frame.size.width/2, space_h*8);//1114/2

        p9 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        p9.layer.cornerRadius = 10;
        p9.clipsToBounds = YES;
        p9.backgroundColor = _themeC;
        [self addSubview:p9];
        p9.center = CGPointMake(frame.size.width/2, space_h*9);//1114/2

        
        //p0.tag = 0;
        p1.tag = 1;
        p2.tag = 2;
        p3.tag = 3;
        p4.tag = 4;
        p5.tag = 5;
        p6.tag = 6;
        p7.tag = 7;
        p8.tag = 8;
        p9.tag = 9;
        
        _line1 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p0.frame), 3, CGRectGetMinY(p1.frame)-CGRectGetMaxY(p0.frame))];
        _line1.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line1.center = CGPointMake(p1.center.x, _line1.center.y);
        [self addSubview:_line1];
     
        _line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p1.frame), 3, CGRectGetMinY(p2.frame)-CGRectGetMaxY(p1.frame))];
        _line2.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line2.center = CGPointMake(p1.center.x, _line2.center.y);
        [self addSubview:_line2];
        
        _line3 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p2.frame), 3, CGRectGetMinY(p3.frame)-CGRectGetMaxY(p2.frame))];
        _line3.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line3.center = CGPointMake(p1.center.x, _line3.center.y);
        [self addSubview:_line3];
        
        _line4 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p3.frame), 3, CGRectGetMinY(p4.frame)-CGRectGetMaxY(p3.frame))];
        _line4.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line4.center = CGPointMake(p1.center.x, _line4.center.y);
        [self addSubview:_line4];
        
        
        _line5 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p4.frame), 3, CGRectGetMinY(p5.frame)-CGRectGetMaxY(p4.frame))];
        _line5.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line5.center = CGPointMake(p1.center.x, _line5.center.y);
        [self addSubview:_line5];
        
        _line6 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p5.frame), 3, CGRectGetMinY(p6.frame)-CGRectGetMaxY(p5.frame))];
        _line6.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line6.center = CGPointMake(p1.center.x, _line6.center.y);
        [self addSubview:_line6];
        
        _line7 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p6.frame), 3, CGRectGetMinY(p7.frame)-CGRectGetMaxY(p6.frame))];
        _line7.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line7.center = CGPointMake(p1.center.x, _line7.center.y);
        [self addSubview:_line7];
        
        _line8 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p7.frame), 3, CGRectGetMinY(p8.frame)-CGRectGetMaxY(p7.frame))];
        _line8.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line8.center = CGPointMake(p1.center.x, _line8.center.y);
        [self addSubview:_line8];
        
        
        _line9 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p8.frame), 3, CGRectGetMinY(p9.frame)-CGRectGetMaxY(p8.frame))];
        _line9.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line9.center = CGPointMake(p1.center.x, _line9.center.y);
        [self addSubview:_line9];
        
        _line10 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(p9.frame), 3, CGRectGetMinY(pLast.frame)-CGRectGetMaxY(p9.frame))];
        _line10.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        _line10.center = CGPointMake(p1.center.x, _line10.center.y);
        [self addSubview:_line10];
        
        //136
        
        UIImage *img = [UIImage imageNamed:@"tip_frame.png"];
        
        _tipView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 85)];
        _tipView.image = [img stretchableImageWithLeftCapWidth:50 topCapHeight:40];
        
        _titleL = [[UILabel alloc] initWithFrame:CGRectMake(30, 15, 260, 20)];
        _titleL.backgroundColor = [UIColor clearColor];
        _titleL.font = [UIFont boldSystemFontOfSize:18];
        _titleL.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
        [_tipView addSubview:_titleL];
        _titleL.text = @"志留纪早期-4亿多年前";
        
        _flag = [[UILabel alloc] initWithFrame:CGRectMake(30, 35, 260, 20)];
        _flag.backgroundColor = [UIColor clearColor];
        _flag.font = [UIFont systemFontOfSize:14];
        _flag.textColor = [UIColor colorWithWhite:1.0 alpha:0.8];
        [_tipView addSubview:_flag];
        _flag.text = @"代表生物：浙江曙鱼";
        
        _abstract = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, 280, 50)];
        _abstract.backgroundColor = [UIColor clearColor];
        _abstract.font = [UIFont systemFontOfSize:14];
        _abstract.textColor = [UIColor colorWithWhite:1.0 alpha:0.8];
        _abstract.numberOfLines = 0;
        [_tipView addSubview:_abstract];
        _abstract.text = @"";
        
//
        [self checkIsTouchIcon:p1.center iconView:p1];
        
        [self fillTextDataByIndex:1];
    }
    
    return self;
}

- (void) fillTextDataByIndex:(int)index{
    
    NSDictionary *d = [_timeTitles objectAtIndex:index-1];
    _titleL.text = [d objectForKey:@"title"];
    _flag.text = [d objectForKey:@"subtitle"];
    _abstract.text = [NSString stringWithFormat:@"分布: %@",[d objectForKey:@"fenbu"]];
    
}


- (void) cancelTipShowing{
    
    if([_tipView superview])
    {
        [UIView animateWithDuration:0.35
                         animations:^{
                             
                             _tipView.alpha = 0.0;
                             
                         } completion:^(BOOL finished) {
                             
                             [_tipView removeFromSuperview];
                             _tipView.alpha = 1.0;
                         }];
    }
}


- (void) cancelTouchCurrent{
    
    UIImageView *iconView = _currentSel;
    _currentSel = nil;
    CGPoint pc = iconView.center;
    [UIView animateWithDuration:0.2 animations:^{
        
        iconView.transform = CGAffineTransformMakeScale(18/44.0, 18/44.0);
        
        
        
    } completion:^(BOOL finished) {
        
        iconView.image = nil;
        iconView.transform = CGAffineTransformIdentity;
        iconView.layer.borderWidth = 0;
        iconView.frame = CGRectMake(0, 0, 18, 18);
        iconView.center = pc;
        iconView.layer.cornerRadius = 9;
        iconView.backgroundColor = _themeC;
    }];
}


- (UIImageView*) testClickP:(CGPoint)pt{
    
    CGRect rc = p1.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, pt))
    {
        return p1;
    }
    
    rc = p2.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, pt))
    {
        return p2;
    }
    
    rc = p3.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, pt))
    {
        return p3;
    }
    
    rc = p4.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, pt))
    {
        return p4;
    }
    
    rc = p5.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, pt))
    {
        return p5;
    }
    
    rc = p6.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, pt))
    {
        return p6;
    }
    
    rc = p7.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, pt))
    {
        return p7;
    }
    
    rc = p8.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, pt))
    {
        return p8;
    }
    
    rc = p9.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, pt))
    {
        return p9;
    }
    
    return nil;
}

- (void) hiddenTipView{
    [_tipView removeFromSuperview];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    
    UIImageView *iconView = [self testClickP:currentPoint];
    
    if(_currentSel)
    {
        CGRect rc = _currentSel.frame;
        rc.size.width += 20;
        rc.size.height += 20;
        rc.origin.x -= 10;
        rc.origin.y -= 10;
        
        if(CGRectContainsPoint(rc, currentPoint))
        {
            return;
        }
        else
        {
            if(iconView)
                [self cancelTouchCurrent];
        }
    }
    
   
    [self checkIsTouchIcon:currentPoint iconView:iconView];
    
    
}

- (void) checkIsTouchIcon:(CGPoint)currentPoint iconView:(UIImageView*)iconView{
    
    CGRect rc = iconView.frame;
    rc.size.width += 20;
    rc.size.height += 20;
    rc.origin.x -= 10;
    rc.origin.y -= 10;
    
    if(CGRectContainsPoint(rc, currentPoint))
    {

        if(_currentSel != iconView)
        {
            _currentSel = iconView;
            
            CGPoint pc = iconView.center;
            
            iconView.frame = CGRectMake(0, 0, 44, 44);
            iconView.center = pc;
            iconView.layer.cornerRadius = 22;
            iconView.layer.borderColor = _themeC.CGColor;
            iconView.layer.borderWidth = 4;
            iconView.backgroundColor = [UIColor clearColor];
            
            NSString *iconImgName = [NSString stringWithFormat:@"yy_%d.png", _currentSel.tag];
            iconView.image = [UIImage imageNamed:iconImgName];
            
            iconView.transform = CGAffineTransformMakeScale(18/44.0, 18/44.0);
            
            [UIView animateWithDuration:0.2 animations:^{
                
                iconView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                
            } completion:^(BOOL finished) {
        
                [self addSubview:_tipView];
                _tipView.frame = CGRectMake(CGRectGetMaxX(iconView.frame)+5,
                                            CGRectGetMinY(iconView.frame),
                                            _tipView.frame.size.width,
                                            120);
                
                [self fillTextDataByIndex:_currentSel.tag];
                
            }];
        }
    }
    else
    {
        if(_currentSel == iconView)
        {
            _currentSel = nil;
            CGPoint pc = iconView.center;
            
            
            
            [UIView animateWithDuration:0.2 animations:^{
                
                iconView.transform = CGAffineTransformMakeScale(18/44.0, 18/44.0);
                
                
                
            } completion:^(BOOL finished) {
                
                iconView.image = nil;
                iconView.transform = CGAffineTransformIdentity;
                iconView.layer.borderWidth = 0;
                iconView.frame = CGRectMake(0, 0, 18, 18);
                iconView.center = pc;
                iconView.layer.cornerRadius = 9;
                iconView.backgroundColor = _themeC;
            }];
        }
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    NSSet *allTouches = [event allTouches];
    if([allTouches count] == 2){
        
    }
    else {
        CGPoint currentPoint = [touch locationInView:self];
        
        UIImageView *iconView = [self testClickP:currentPoint];
        if(_currentSel)
        {
            CGRect rc = _currentSel.frame;
            rc.size.width += 20;
            rc.size.height += 20;
            rc.origin.x -= 10;
            rc.origin.y -= 10;
            
            if(CGRectContainsPoint(rc, currentPoint))
            {
                return;
            }
            else
            {
                if(iconView)
                    [self cancelTouchCurrent];
            }
        }
        
        
        [self checkIsTouchIcon:currentPoint iconView:iconView];
       
        
    }
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(delegate_ && [delegate_ respondsToSelector:@selector(didSelectedAtIndex:)])
    {
        [delegate_ didSelectedAtIndex:_currentSel.tag];
    }
    
    [self cancelTipShowing];
}




@end
