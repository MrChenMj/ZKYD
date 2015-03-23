//
//  ViewController.h
//  ZKY
//
//  Created by jack on 1/25/15.
//  Copyright (c) 2015 jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    UIScrollView *_content;
    
    AVAudioPlayer *docPlayer;
    
    int _isPlayingIndex;
}

@end

