//
//  ECProgressView.m
//  Echo
//
//  Created by robu on 14/11/11.
//  Copyright (c) 2014年 Static Ga. All rights reserved.
//

#import "YXMaskProgressView.h"
#import "LDProgressView.h"
@interface YXMaskProgressView ()
@property (strong ,nonatomic) LDProgressView * progressView;
@property (strong ,nonatomic) UILabel * progressLabel;
@end
@implementation YXMaskProgressView

-(instancetype)init{
    if(self = [super init]){
        
    }
    return self;
}
-(void)initUI{
    CGRect bouns = [[UIScreen mainScreen] bounds];
    self.frame = bouns;
    self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.8];
}
-(void)createContent{
    
    CGFloat x = 10;
    CGFloat y = self.frame.size.height/2.0 + 20;
    CGFloat w = self.frame.size.width - 2*x;
    CGFloat h = 20;
    CGRect frame = CGRectMake(x, y, w, h);
    self.progressView = [[LDProgressView alloc] initWithFrame:frame];
    self.progressView.color = [UIColor colorWithRed:0.00f green:0.84f blue:0.00f alpha:1.00f];
    self.progressView.flat=@YES;
    self.progressView.animate=@YES;
    h = 30;
    y = y - 40;
    frame = CGRectMake(x, y, w, h);
    self.progressLabel = [[UILabel alloc] initWithFrame:frame];
    self.progressLabel.font = [UIFont systemFontOfSize:14];
    [self.progressLabel setTextColor:[UIColor whiteColor]];
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    self.progressLabel.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.progressView];
    [self addSubview:self.progressLabel];
    
}
-(void)setProgressValue:(CGFloat)progressValue{
    [self.progressView setProgress:progressValue];
}
-(void)setProgressLabelText:(NSString*)progressText{
    self.progressLabel.text = progressText;
}
-(void)dismissProgressView{
    self.progressView.progress=0;
    self.progressLabel.text=@"";
    [self removeFromSuperview];
}
-(void)showProgressView{
    
    //UIViewController * vc = APPDelegate.window.rootViewController;
    //UIView * superView = vc.view;
    UIView * superView = APPDelegate.window;
    [superView addSubview:self];
}

+(YXMaskProgressView *)progressViewWithMask{
    YXMaskProgressView * progressView = [[YXMaskProgressView alloc] init];
    [progressView initUI];
    [progressView createContent];
    
    UIViewController * vc = APPDelegate.window.rootViewController;
    [vc.view addSubview:progressView];
    return progressView;
}

/*
 UIView *overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
 overlayView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.8];
 UIProgressView *pv = [[UIProgressView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT/2.0, 280, 2)];
 UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT/2.0 + 16, 280, 40)];
 label.textColor = [UIColor whiteColor];
 label.font = [UIFont systemFontOfSize:15];
 label.numberOfLines = 0;
 label.textAlignment = NSTextAlignmentCenter;
 label.backgroundColor = [UIColor clearColor];
 [overlayView addSubview:label];
 [overlayView addSubview:pv];
 
 [APP_DELEGATE.window addSubview:overlayView];
 */
@end
