//
//  ViewController.m
//  ZKY
//
//  Created by jack on 1/25/15.
//  Copyright (c) 2015 jack. All rights reserved.
//

#import "ViewController.h"
#import "Car360View.h"
#import "TimeLine.h"
#import "UIImage+ImageEffects.h"
#import "ScaleView.h"
#import "InfoView.h"
#import "SplashView.h"

@interface ViewController () <TimeLineDelegate>
{
    Car360View  *_fish;
    
    ScaleView   *_scale;
    UIButton    *btnPlay;
    
    BOOL        _isPlaying;
    
    InfoView    *_infoView;
    
    TimeLine    *_timeLine;
    
    UIButton    * closeButton;
    
    SplashView  *_splash;
    UILabel     *_topTitle;
    UIImageView *_backgroundView;
    UIImageView *_backgroundViewNext;
    
    int         _currentPointIndex;
    
    UILabel* _topTitle1;
}
@property (nonatomic, strong) NSArray *_topTitles;
@property (nonatomic, strong) NSArray *_topTitles1;


@end

@implementation ViewController
@synthesize _topTitles;
@synthesize _topTitles1;

- (void) closeAction:(id)sender{
    
    closeButton.hidden = YES;
    [_infoView removeFromSuperview];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self._topTitles = @[@"海口鱼",
                        @"浙江曙鱼",
                        @"鱼石螈",
                        @"林蜥",
                        @"中龙",
                        @"宁城热河翼龙	",
                        @"赫氏近鸟龙",
                        @"中国尖齿兽",
                        @"乍得人"
                        ];
    self._topTitles1 = @[@"脊椎支撑·进化奠基",
                        @"颌的出现·丰富食谱",
                        @"由水登陆·两栖生活",
                        @"羊膜卵·摆脱水依赖",
                        @"重返海洋·反转演化",
                        @"飞上蓝天·征服天空",
                        @"羽毛产生·鸟类崛起",
                        @"哺乳动物·前途无量",
                        @"人类诞生·改变秩序"
                        ];
    
    _backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    _backgroundView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg_mask0.jpg" ofType:nil]];
    [self.view addSubview:_backgroundView];
    _backgroundView.tag = 0;
    
    _backgroundViewNext = [[UIImageView alloc] initWithFrame:_backgroundView.frame];
    

    UIImageView *topbar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 150/2)];
    [self.view addSubview:topbar];
    topbar.userInteractionEnabled = YES;
    
    closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    closeButton.frame = CGRectMake(20, 15, 60, 50);
    [closeButton setImage:[UIImage imageNamed:@"icon_fanhui.png"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    closeButton.userInteractionEnabled = YES;
    [topbar addSubview:closeButton];
    closeButton.hidden = YES;
    
    btnPlay = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPlay.frame = CGRectMake(1024-65, 15, 50, 50);
    [btnPlay setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    [topbar addSubview:btnPlay];
    [btnPlay addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _topTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 30)];
    _topTitle.backgroundColor = [UIColor clearColor];
    _topTitle.textAlignment = NSTextAlignmentCenter;
    _topTitle.textColor = [UIColor whiteColor];
    _topTitle.font = [UIFont boldSystemFontOfSize:18];
    _topTitle.text = [_topTitles objectAtIndex:0];
    [topbar addSubview:_topTitle];
    _topTitle.center = CGPointMake(topbar.center.x, topbar.center.y);
    
    CGSize size = [_topTitle.text sizeWithAttributes:@{NSFontAttributeName:_topTitle.font}];
    float width = size.width;
    
    _topTitle1 = [[UILabel alloc] initWithFrame:CGRectMake(topbar.center.x+width/2+10, 0, 300, 30)];
    _topTitle1.backgroundColor = [UIColor clearColor];
    _topTitle1.textAlignment = NSTextAlignmentLeft;
    _topTitle1.textColor = [UIColor colorWithWhite:1.0 alpha:0.9];
    _topTitle1.font = [UIFont boldSystemFontOfSize:15];
    _topTitle1.text = [_topTitles1 objectAtIndex:0];
    [topbar addSubview:_topTitle1];
    _topTitle1.center = CGPointMake(_topTitle1.center.x, topbar.center.y);
    

    
    _content = [[UIScrollView alloc] initWithFrame:_backgroundView.bounds];
    _content.delegate = self;
    _content.minimumZoomScale  = 1;
    _content.maximumZoomScale = 1.5;
    _content.scrollEnabled = NO;
    [self.view insertSubview:_content belowSubview:topbar];
    
    _fish = [[Car360View alloc] initWithFrame:_backgroundView.bounds];
    [_content addSubview:_fish];
    _fish._prex = @"0_000";
    
    [_fish reloadCar:NO];
    
    
    _timeLine = [[TimeLine alloc] initWithFrame:CGRectMake(10, 80, 50, 625)];
    _timeLine.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_timeLine];
    _timeLine.delegate_ = self;
    
    int top = 250;
    int sp = 70;
    int w = 80;
    
    
    

    _scale = [[ScaleView alloc] initWithFrame:CGRectMake(0, 768 - 70, 1024, 50)];
    [self.view addSubview:_scale];
    [_scale showScale:170 space:100 max:70];
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 0, w, w);
    [btn1 setImage:[UIImage imageNamed:@"icon_right_1.png"] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    btn1.center = CGPointMake(1024-50, top);
    btn1.tag = 0;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, w, w);
    [btn2 setImage:[UIImage imageNamed:@"icon_right_2.png"] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    btn2.center = CGPointMake(1024-50, top+sp);
    btn2.tag = 1;
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(0, 0, w, w);
    [btn3 setImage:[UIImage imageNamed:@"icon_right_3.png"] forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    btn3.center = CGPointMake(1024-50, top+sp*2);
    btn3.tag = 2;
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(0, 0, w, w);
    [btn4 setImage:[UIImage imageNamed:@"icon_right_4.png"] forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    btn4.center = CGPointMake(1024-50, top+sp*3);
    btn4.tag = 3;
    
//    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn5.frame = CGRectMake(0, 0, w, w);
//    [btn5 setImage:[UIImage imageNamed:@"icon_right_5.png"] forState:UIControlStateNormal];
//    [self.view addSubview:btn5];
//    btn5.center = CGPointMake(1024-50, top+sp*4);
    
    [btn1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    
    _infoView = [[InfoView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topbar.frame)-12,
                                                           1024,
                                                           768 - CGRectGetMaxY(topbar.frame)+12)];
    
    
    _isPlayingIndex = -1;
    
    
    _splash = [[SplashView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view addSubview:_splash];
    [_splash animateShow];
    
    
    //增加点击事件
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped3DView:)];
    tapped.cancelsTouchesInView = NO;
    [_fish addGestureRecognizer:tapped];
    
    
    
    _currentPointIndex = 1;
//    NSString *key = [NSString stringWithFormat:@"play_audo_index_flag_%d", _currentPointIndex];
//    int play_flag = [[[NSUserDefaults standardUserDefaults] objectForKey:key] intValue];
//    
//    if(play_flag == 0)
//    {
//        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:key];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        
//        [self playAction:nil];
//    }
    
}

- (void) tapped3DView:(id)sender{
    
    [_timeLine cancelTipShowing];
}


///选择了哪个节点
- (void) didSelectedAtIndex:(int)index{
    
    _topTitle.text = [_topTitles objectAtIndex:index-1];
    _topTitle1.text = [_topTitles1 objectAtIndex:index-1];
    CGSize size = [_topTitle.text sizeWithAttributes:@{NSFontAttributeName:_topTitle.font}];
    float width = size.width;
    _topTitle1.frame = CGRectMake(width/2+10, 0, 300, 30);
    _topTitle1.center = CGPointMake(_topTitle.center.x+_topTitle1.center.x, _topTitle.center.y);


    
    switch (index) {
        case 1:
            _fish._prex = @"1-3D/0_000";
            break;
        case 2:
            _fish._prex = @"2-3D/00_1_000";
            break;
        case 3:
            _fish._prex = @"3-3D/0_000";
            break;
        case 4:
            _fish._prex = @"4-3D/0_000";
            break;
        case 5:
            _fish._prex = @"5-3D/0_000";
            break;
        case 6:
            _fish._prex = @"6-3D/0_000";
            break;
        case 7:
            _fish._prex = @"7-3D/0_000";
            break;
        case 8:
            _fish._prex = @"8-3D/0_000";
            break;
        case 9:
            _fish._prex = @"9-3D/0_000";
            break;
        default:
            break;
    }
    
   // [_fish fixedDirect];
    
    _currentPointIndex = index;
    
    if(_isPlaying)
    {
        [docPlayer stop];
        [self playAudioFile:index-1];
    }
    else
    {
        NSString *key = [NSString stringWithFormat:@"play_audo_index_flag_%d", index];
        int play_flag = [[[NSUserDefaults standardUserDefaults] objectForKey:key] intValue];
        
        if(play_flag == 0)
        {
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:key];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [self playAction:nil];
        }
        
        
        
    }
    
    
    NSString *bgName = [NSString stringWithFormat:@"bg_mask%d.jpg", index-1];
    _backgroundViewNext.image =  [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:bgName ofType:nil]];
    [self.view insertSubview:_backgroundViewNext belowSubview:_backgroundView];
    
    
    [UIView animateWithDuration:0.35
                     animations:^{
                         
                         _backgroundView.alpha = 0.0;
                         
                         [_fish reloadCar:NO];
                         
                     } completion:^(BOOL finished) {

                         
                         UIImageView *tmp = _backgroundView;
                         _backgroundView = _backgroundViewNext;
                         _backgroundViewNext = tmp;
                         
                         [self.view sendSubviewToBack:_backgroundViewNext];
                         _backgroundViewNext.alpha = 1.0;
                         
                     }];
    

    
}

- (void) buttonAction:(UIButton*)sender{
    
    CGRect rc = _infoView.frame;
    
    _infoView._yearIndex = _currentPointIndex;
    
    [_timeLine hiddenTipView];
    
   [_infoView layoutAtIndex:(int)sender.tag];
    
//    if([_infoView superview])
//    {
//        [_infoView removeFromSuperview];
//        
//    }
//    else
//    {
        closeButton.hidden = NO;
        
        //rc.origin.x = 0;
        _infoView.frame = rc;
        [self.view insertSubview:_infoView aboveSubview:_scale];
        
  //  }
}


- (void)playAudioFile:(int)index {
    
    NSURL *sound_name = nil;
    switch (index) {
        case 0:
            sound_name = [[NSBundle mainBundle] URLForResource:@"doc1"
                                                 withExtension:@"wav"];
            break;
        case 1:
            sound_name = [[NSBundle mainBundle] URLForResource: @"doc2"
                                                 withExtension: @"wav"];
            break;
        case 2:
            sound_name = [[NSBundle mainBundle] URLForResource: @"doc3"
                                                 withExtension: @"wav"];
            break;
        case 3:
            sound_name = [[NSBundle mainBundle] URLForResource: @"doc4"
                                                 withExtension: @"wav"];
            break;
        case 4:
            sound_name = [[NSBundle mainBundle] URLForResource: @"doc5"
                                                 withExtension: @"wav"];
            break;
        case 5:
            sound_name = [[NSBundle mainBundle] URLForResource: @"doc6"
                                                 withExtension: @"wav"];
            break;
        case 6:
            sound_name = [[NSBundle mainBundle] URLForResource: @"doc7"
                                                 withExtension: @"wav"];
            break;
        case 7:
            sound_name = [[NSBundle mainBundle] URLForResource: @"doc8"
                                                 withExtension: @"wav"];
            break;
        case 8:
            sound_name = [[NSBundle mainBundle] URLForResource: @"doc9"
                                                 withExtension: @"wav"];
            break;
        default:
            break;
    }
    
    if(_isPlayingIndex == index)
    {
        return;
    }
    _isPlayingIndex = index;
    
    if(sound_name == nil)
    {
        [docPlayer stop];
        docPlayer = nil;
        return ;
    }
    
    if(docPlayer)
    {
        [docPlayer stop];
        docPlayer = nil;
    }
    
    docPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:sound_name error:NULL];
    docPlayer.numberOfLoops = 0;

    [docPlayer play];
    
}


- (void) playAction:(id)sender{
    
    _isPlaying = !_isPlaying;
    
    if(_isPlaying)
    {
        [self playAudioFile:_currentPointIndex-1];
        
        [btnPlay setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
       
        [docPlayer play];
    }
    else
    {
        [btnPlay setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        
        [docPlayer pause];
    }
}


#pragma mark -
#pragma mark UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _fish;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    //NSLog(@"%f-%f:%f", scrollView.zoomScale, scrollView.contentOffset.x, scrollView.contentOffset.y);
    
   
    
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.x);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
