//
//  SplashView.m
//  ZKY
//
//  Created by jack on 2/8/15.
//  Copyright (c) 2015 jack. All rights reserved.
//

#import "SplashView.h"

@interface SplashView ()
{
    NSMutableArray *_labels;
    NSMutableArray *_images;
    
    int _index;
    
    UIImageView *_pictureCur;
    UIImageView *_pictureNext;
    
    
    BOOL _isStop;
    
    int _snapIndex;
    
  //  UIImageView *_snapImageView;
}

@end

@implementation SplashView


- (UIImage *)imageWithIndex:(int)indx{
    
    NSString *maskJpg = [NSString stringWithFormat:@"splash_mask%d.jpg", indx];
    NSString *path = [[NSBundle mainBundle] pathForResource:maskJpg ofType:nil];
    
    return [UIImage imageWithContentsOfFile:path];
    
}

- (id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor blackColor];
        
        NSArray *titles = @[@"我是谁？",
                            @"我曾经是鱼、是鸟、是古猿",
                            @"会游、会飞、会爬树",
                            @"但关于我的一切，都起始于",
                            @"鱼",
                            @"鱼是人类的远祖，从鱼到人，经历了极为漫长的演化历程",
                            @"其中隐含着脊椎动物进化历程中的九次重大革命",
                            @"从外形、身体结构以及生活方式上都有了天翻地覆的变化......"
                            ];
        
        _labels = [[NSMutableArray alloc] init];
        
        _index = 0;
        
        _pictureCur = [[UIImageView alloc] initWithFrame:self.bounds];
        _pictureNext = [[UIImageView alloc] initWithFrame:self.bounds];
        
        _pictureCur.image = [self imageWithIndex:_index];
        _pictureNext.image = [self imageWithIndex:_index+1];
        
        [self addSubview:_pictureNext];
        [self addSubview:_pictureCur];
        
        
        
        UIImageView *mask = [[UIImageView alloc] initWithFrame:self.bounds];
        mask.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        [self addSubview:mask];
        
        
        _images = [[NSMutableArray alloc] init];
        
        NSArray *images = @[@"1_snapshot.png",
                            @"2_snapshot.png",
                            @"3_snapshot.png",
                            @"4_snapshot.png",
                            @"5_snapshot.png",
                            @"6_snapshot.png",
                            @"7_snapshot.png",
                            @"8_snapshot.png",
                            @"9_snapshot.png"
                            ];
        
        NSArray *names = @[@"海口鱼 & 脊椎的出现",
                           @"浙江曙鱼 & 颌的出现",
                           @"鱼石螈 & 登陆",
                           @"林蜥 & 羊膜卵",
                           @"中龙 & 重返海洋",
                           @"宁城热河翼龙 & 飞行",
                           @"赫氏近鸟龙 & 羽毛",
                           @"中国尖齿兽 & 飞哺乳",
                           @"乍得人 & 人类"
                           ];
        
        for(int i = 1; i < 10; i++)
        {
            UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
            icon.center  = CGPointMake(1024/2, 550);
            icon.image = [UIImage imageNamed:[images objectAtIndex:i-1]];
            icon.layer.contentsGravity = kCAGravityCenter;
            [self addSubview:icon];
            icon.clipsToBounds = NO;
            icon.alpha = 0;
            [_images addObject:icon];
            
            UILabel *tL = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 400, 30)];
            tL.backgroundColor = [UIColor clearColor];
            tL.font = [UIFont boldSystemFontOfSize:25];
            tL.text = [names objectAtIndex:i-1];
            [icon addSubview:tL];
            tL.textAlignment = NSTextAlignmentCenter;
            tL.textColor = [UIColor whiteColor];
            
        }
        
        float x = 170;
        float y = 130;
        for(NSString *t in titles)
        {
            UILabel *tL = [[UILabel alloc] initWithFrame:CGRectMake(x, y, 1000, 30)];
            tL.backgroundColor = [UIColor clearColor];
            tL.font = [UIFont boldSystemFontOfSize:25];
            tL.text = t;
            [self addSubview:tL];
            tL.textColor = [UIColor whiteColor];
            
            y+=40;
            
            [_labels addObject:tL];
            tL.alpha = 0;
        }
        
    }
    
    //增加点击事件
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedSkipView:)];
    tapped.cancelsTouchesInView = NO;
    tapped.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapped];
    
    return self;
}

- (void) tappedSkipView:(id)sender{
    
    _isStop = YES;
    [self fly];
}


- (void) animateShow{
    
    _isStop = NO;
    
    _index = 0;
    if(_index < [_labels count])
    {
        UILabel *tL = [_labels objectAtIndex:_index];
        
        CGPoint pt = tL.center;
        tL.center = CGPointMake(pt.x, pt.y + 40);
        
        //UIImageView *icon = [_images objectAtIndex:_index];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(nextLabel)];
        [UIView setAnimationDuration:1.2];
        [UIView setAnimationDelay:0.5];
        tL.alpha = 1.0;
        tL.center = pt;
        //icon.alpha = 0.5;
        //icon.center = CGPointMake(1024/2, 600);
       // _pictureCur.alpha = 0.0;
        [UIView commitAnimations];
    }
    
    
    
    
}

- (void) nextLabel{
    
    if(_isStop)
        return;
    
    _index++;
    
    if(_index < [_labels count])
    {
        UILabel *tL = [_labels objectAtIndex:_index];
        
        CGPoint pt = tL.center;
        tL.center = CGPointMake(pt.x, pt.y + 40);
        
        if(_index > 1)
        {
            UIImageView *tmp = _pictureCur;
            _pictureCur = _pictureNext;
            _pictureNext = tmp;
            
            [self sendSubviewToBack:_pictureNext];
            _pictureNext.image = [self imageWithIndex:_index+1];
            _pictureNext.alpha = 1.0;
        }
        
//        UIImageView *iconLast = [_images objectAtIndex:_index-1];
//        UIImageView *icon = [_images objectAtIndex:_index];
//        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(nextLabel)];
        [UIView setAnimationDuration:1.2];
        [UIView setAnimationDelay:0.5];
        tL.alpha = 1.0;
        tL.center = pt;
        _pictureCur.alpha = 0.0;
//        icon.alpha = 0.5;
//        icon.center = CGPointMake(1024/2, 600);
//        iconLast.center = CGPointMake(-30, 600);
        
        [UIView commitAnimations];
    }
    else
    {
        
        [self snapshotPlaying];
        
        
    }
}

- (void) snapshotPlaying{
    
    _snapIndex = 0;
    UIView *snap = [_images objectAtIndex:_snapIndex];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(nextSnap)];
    [UIView setAnimationDuration:0.5];
    snap.alpha = 1.0;
    [UIView commitAnimations];
    
    
}

- (void) nextSnap{
    
    if(_isStop)
        return;
    
    _snapIndex++;
  
    
    if(_snapIndex < [_images count])
    {
        UIView *snaplast = [_images objectAtIndex:_snapIndex-1];
        UIView *snap = [_images objectAtIndex:_snapIndex];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(nextSnap)];
        [UIView setAnimationDuration:0.5];
        snap.alpha = 1.0;
        snaplast.alpha = 0.0;
        [UIView commitAnimations];
    }
    else
    {
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self
                                       selector:@selector(fly)
                                       userInfo:nil
                                        repeats:NO];
    }
}

- (void) fly
{
    [UIView animateWithDuration:0.5
                     animations:^{
                         
                         self.transform = CGAffineTransformMakeScale(2.0, 2.0);
                         self.alpha = 0.0;
                         
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
