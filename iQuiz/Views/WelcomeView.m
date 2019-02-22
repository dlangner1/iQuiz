//
//  WelcomeView.m
//  iQuiz
//
//  Created by Dustin Langner on 2/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "WelcomeView.h"

@implementation WelcomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {		
        self.backgroundColor = [UIColor colorWithRed:20.0f/255.0f
                                               green:29.0f/255.0f
                                                blue:38.0f/255.0f
                                               alpha:1.0f];
        [self setupTitleAndSubtitle];
    }
    return self;
}

- (void)setupTitleAndSubtitle
{
    UILabel *welcome = [[UILabel alloc]init];
    welcome.numberOfLines = 0;
    welcome.lineBreakMode = NSLineBreakByWordWrapping;
    welcome.text = @"Welcome to iQuiz";
    welcome.textAlignment = NSTextAlignmentCenter;
    welcome.font = [welcome.font fontWithSize:35];
    welcome.textColor = UIColor.whiteColor;
    [self addSubview:welcome];
    
    UILabel *subtitle = [[UILabel alloc]init];
    subtitle.textColor = UIColor.whiteColor;
    subtitle.numberOfLines = 0;
    subtitle.lineBreakMode = NSLineBreakByWordWrapping;
    subtitle.text = @"Get started by selecting a topic from the list below";
    subtitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:subtitle];
    
    welcome.translatesAutoresizingMaskIntoConstraints = NO;
    [welcome.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor].active = YES;
    [welcome.centerYAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerYAnchor constant:-10].active = YES;
    
    subtitle.translatesAutoresizingMaskIntoConstraints = NO;
    [subtitle.topAnchor constraintEqualToAnchor:welcome.bottomAnchor constant:10].active = YES;
    [subtitle.leftAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
    [subtitle.rightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
}


@end
