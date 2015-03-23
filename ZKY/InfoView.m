//
//  InfoView.m
//  ZKY
//
//  Created by jack on 1/28/15.
//  Copyright (c) 2015 jack. All rights reserved.
//

#import "InfoView.h"
#import "UIImage+ImageEffects.h"
#import "UIImage+Color.h"
#import "UIButton+Color.h"
#import "UILabel+ContentSize.h"

@interface InfoView ()
{
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    
    UILabel *content1;

    
    UIScrollView *_content;
}
@property (nonatomic, strong) UIImage *_selectedImg;

@end

@implementation InfoView
@synthesize _selectedImg;
@synthesize _datas;
@synthesize _yearIndex;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIImage *)capture
{
    UIWindow *topWindow = [UIApplication sharedApplication].keyWindow;
    CGRect rect = [UIScreen mainScreen].bounds;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    if([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        [topWindow drawViewHierarchyInRect:rect afterScreenUpdates:YES];
    }
    else
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [topWindow.layer renderInContext:ctx];
    }
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.userInteractionEnabled = YES;
        
        UIImage *img = [UIImage imageWithColor:[UIColor colorWithRed:66/255.0 green:93/255.0 blue:99/255.0 alpha:0.6] andSize:CGSizeMake(1, 1)];
        img = [img applyBlurWithRadius:5 tintColor:nil saturationDeltaFactor:1.8 maskImage:nil];
       
        self.image = img;
        
        //self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil];
        self._datas = [NSMutableArray arrayWithContentsOfFile:filePath];
        
        int w = 800/4;
        int h = 30;
        
        UIView *fr = [[UIView alloc] initWithFrame:CGRectMake((1024-800)/2, 20, 800, h)];
        fr.clipsToBounds = YES;
        fr.layer.cornerRadius = 5;
        [self addSubview:fr];
        
        UIColor *c1 = [UIColor colorWithWhite:1.0 alpha:0.15];
        fr.layer.borderWidth = 1;
        fr.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.15].CGColor;
        
        
        self._selectedImg = [UIImage imageWithColor:[UIColor colorWithWhite:1.0 alpha:0.3] andSize:CGSizeMake(w, h)];
        
        btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(0, 0, w, h);
        [btn1 setBackgroundImage:_selectedImg forState:UIControlStateNormal];
        [fr addSubview:btn1];
        [btn1 setTitle:@"阶段及意义" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.9] forState:UIControlStateNormal];
        btn1.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        btn1.layer.borderColor = c1.CGColor;
        btn1.layer.borderWidth = 0;
        
        btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame = CGRectMake(w, 0, w, h);
        [fr addSubview:btn2];
        btn2.layer.borderColor = c1.CGColor;
        btn2.layer.borderWidth = 1;
        [btn2 setTitle:@"区域及年代" forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.9] forState:UIControlStateNormal];
        btn2.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        
        btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn3.frame = CGRectMake(w*2, 0, w, h);
        [fr addSubview:btn3];
        btn3.layer.borderColor = c1.CGColor;
        btn3.layer.borderWidth = 1;
        [btn3 setTitle:@"化石及发掘地" forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.9] forState:UIControlStateNormal];
        btn3.titleLabel.font = [UIFont boldSystemFontOfSize:15];

        
        btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn4.frame = CGRectMake(w*3, 0, w, h);
        [fr addSubview:btn4];
        btn4.layer.borderColor = c1.CGColor;
        btn4.layer.borderWidth = 1;
        [btn4 setTitle:@"同时期小伙伴" forState:UIControlStateNormal];
        [btn4 setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.9] forState:UIControlStateNormal];
        btn4.titleLabel.font = [UIFont boldSystemFontOfSize:15];

        [btn1 addTarget:self action:@selector(tabAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 addTarget:self action:@selector(tabAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn3 addTarget:self action:@selector(tabAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn4 addTarget:self action:@selector(tabAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        ///266
        
        float x = CGRectGetMinX(fr.frame);
        float y = CGRectGetMaxY(fr.frame)+20;
        
        _content = [[UIScrollView alloc] initWithFrame:CGRectMake(x, y, CGRectGetWidth(fr.frame), 600)];
        [self addSubview:_content];
        _content.backgroundColor  = [UIColor clearColor];
        
        content1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(fr.frame), 70)];
        content1.numberOfLines = 0;
        content1.backgroundColor = [UIColor clearColor];
        content1.textColor = [UIColor colorWithWhite:1.0 alpha:0.9];
        content1.font = [UIFont systemFontOfSize:15];
        content1.text = @"";
        [_content addSubview:content1];
        
//        y = CGRectGetMaxY(content1.frame)+20;
//        picFrame = [[UILabel alloc] initWithFrame:CGRectMake(x, y, CGRectGetWidth(fr.frame)-20, 240)];
//        picFrame.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
//        [self addSubview:picFrame];
//        picFrame.layer.cornerRadius = 3;
//        picFrame.clipsToBounds = YES;
//        
//        _imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(picFrame.frame), 240)];
//        _imgV.layer.contentsGravity = kCAGravityResizeAspect;
//        _imgV.image = [UIImage imageNamed:@"jdyi.jpg"];
//        [picFr addSubview:_imgV];
//
//        y = CGRectGetMaxY(picFr.frame)+20;
        
//        UILabel *content2 = [[UILabel alloc] initWithFrame:CGRectMake(x, y, CGRectGetWidth(fr.frame), 100)];
//        content2.numberOfLines = 0;
//        content2.backgroundColor = [UIColor clearColor];
//        content2.textColor = [UIColor colorWithWhite:1.0 alpha:0.9];
//        content2.font = [UIFont systemFontOfSize:15];
//        content2.text = @"四亿多年前的志留纪，一些脊椎动物出现了上下颌，标志着脊椎动物由被动的滤食性生活向主动的捕食性生活方式的过渡, 大大提高了脊椎动物的取食与适应能力。颌出现之后，有颌脊椎动物迅速向更广阔的生态位辐射演化，演化出包括我们人类在内的各大现生类群，占整个脊椎动物总数的99.8%以上，而无颌类中只有盲鳗和七鳃鳗两个类群残存至今";
//        [self addSubview:content2];
        
        
    }
    
    return self;
}

- (void) tabAction:(UIButton*)btn{
    
    NSDictionary *dic = [_datas objectAtIndex:_yearIndex-1];
  
    [[_content subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_content addSubview:content1];
    
    NSString *tabStr = @"";
    
    if(btn1 == btn)
    {
        [btn1 setBackgroundImage:_selectedImg forState:UIControlStateNormal];
        btn1.layer.borderWidth = 0;
        
        [btn2 setBackgroundImage:nil forState:UIControlStateNormal];
        btn2.layer.borderWidth = 1;
        
        [btn3 setBackgroundImage:nil forState:UIControlStateNormal];
        btn3.layer.borderWidth = 1;
        
        [btn4 setBackgroundImage:nil forState:UIControlStateNormal];
        btn4.layer.borderWidth = 1;
        
        
        tabStr = @"tab1";
    }
    else if(btn2 == btn)
    {
        [btn2 setBackgroundImage:_selectedImg forState:UIControlStateNormal];
        btn2.layer.borderWidth = 0;
        
        [btn1 setBackgroundImage:nil forState:UIControlStateNormal];
        btn1.layer.borderWidth = 1;
        
        [btn3 setBackgroundImage:nil forState:UIControlStateNormal];
        btn3.layer.borderWidth = 1;
        
        [btn4 setBackgroundImage:nil forState:UIControlStateNormal];
        btn4.layer.borderWidth = 1;
        
        tabStr = @"tab2";
    }
    else if(btn3 == btn)
    {
        [btn3 setBackgroundImage:_selectedImg forState:UIControlStateNormal];
        btn3.layer.borderWidth = 0;
        
        [btn1 setBackgroundImage:nil forState:UIControlStateNormal];
        btn1.layer.borderWidth = 1;
        
        [btn2 setBackgroundImage:nil forState:UIControlStateNormal];
        btn2.layer.borderWidth = 1;
        
        [btn4 setBackgroundImage:nil forState:UIControlStateNormal];
        btn4.layer.borderWidth = 1;
        
        tabStr = @"tab3";
    }
    else if(btn4 == btn)
    {
        [btn4 setBackgroundImage:_selectedImg forState:UIControlStateNormal];
        btn4.layer.borderWidth = 0;
        
        [btn1 setBackgroundImage:nil forState:UIControlStateNormal];
        btn1.layer.borderWidth = 1;
        
        [btn2 setBackgroundImage:nil forState:UIControlStateNormal];
        btn2.layer.borderWidth = 1;
        
        [btn3 setBackgroundImage:nil forState:UIControlStateNormal];
        btn3.layer.borderWidth = 1;
        
        tabStr = @"tab4";
    }
    
    
    NSDictionary *tab = [dic objectForKey:tabStr];
    NSString *tabText = [tab objectForKey:@"text"];
    content1.text = tabText;
    [content1 contentSize];
    
    float top = CGRectGetMaxY(content1.frame)+10;
    
    NSArray *pics = [tab objectForKey:@"pics"];
    for(id pic in pics)
    {
        if([pic isKindOfClass:[NSString class]])
        {
            UILabel* picFrame = [[UILabel alloc] initWithFrame:CGRectMake(0, top, CGRectGetWidth(content1.frame), 300)];
            picFrame.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
            [_content addSubview:picFrame];
            picFrame.layer.cornerRadius = 3;
            picFrame.clipsToBounds = YES;
            
            UIImageView* imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(picFrame.frame), 300)];
            imgV.layer.contentsGravity = kCAGravityResizeAspect;
            imgV.image = [UIImage imageNamed:pic];
            [picFrame addSubview:imgV];
            
            top = CGRectGetMaxY(picFrame.frame)+20;
        }
        else
        {
            UILabel* picTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, top, 200, 20)];
            picTitle.backgroundColor = [UIColor clearColor];
            [_content addSubview:picTitle];
            picTitle.font = [UIFont boldSystemFontOfSize:13];
            picTitle.text = [pic objectForKey:@"title"];
            picTitle.textColor = [UIColor whiteColor];

            UILabel* picFrame = [[UILabel alloc] initWithFrame:CGRectMake(0, top+20, CGRectGetWidth(content1.frame), 300)];
            picFrame.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
            [_content addSubview:picFrame];
            picFrame.layer.cornerRadius = 3;
            picFrame.clipsToBounds = YES;
            
            UIImageView* imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(picFrame.frame), 300)];
            imgV.layer.contentsGravity = kCAGravityResizeAspect;
            imgV.image = [UIImage imageNamed:[pic objectForKey:@"pic"]];
            [picFrame addSubview:imgV];
            
            top = CGRectGetMaxY(picFrame.frame)+20;
        }
    }
    
    top+=20;
    
    NSArray *param = [tab objectForKey:@"param"];
    for(NSDictionary *p in param)
    {
        
        UILabel* picFrame = [[UILabel alloc] initWithFrame:CGRectMake(0, top, 120, 20)];
        picFrame.backgroundColor = [UIColor clearColor];
        [_content addSubview:picFrame];
        picFrame.font = [UIFont boldSystemFontOfSize:13];
        picFrame.text = [p objectForKey:@"name"];
        picFrame.textColor = [UIColor whiteColor];
        
        picFrame = [[UILabel alloc] initWithFrame:CGRectMake(140, top, 800, 20)];
        picFrame.backgroundColor = [UIColor clearColor];
        [_content addSubview:picFrame];
        picFrame.font = [UIFont boldSystemFontOfSize:13];
        picFrame.text = [p objectForKey:@"value"];
        picFrame.textColor = [UIColor whiteColor];
        
        top = CGRectGetMaxY(picFrame.frame);
    }
    
    _content.contentSize = CGSizeMake(CGRectGetWidth(_content.frame), top);
}

- (void) layoutAtIndex:(int)index{
    
    
    if(index == 0){
        [self tabAction:btn1];
        
       
    }
    if(index == 1){
        [self tabAction:btn2];
        
        
    }
    if(index == 2){
        [self tabAction:btn3];
    }
    if(index == 3){
        [self tabAction:btn4];
    }
    
    
    
//    UIImage *img = [self capture];
//    
//    img = [img applyBlurWithRadius:2 tintColor:nil saturationDeltaFactor:1.0 maskImage:nil];
//    //img = [img applyTintEffectWithColor:[UIColor whiteColor]];
//    
//    self.image = img;
}


@end
