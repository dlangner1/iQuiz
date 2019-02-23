//
//  QuizFinishedViewController.m
//  iQuiz
//
//  Created by Dustin Langner on 2/22/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuizFinishedViewController.h"

@interface QuizFinishedViewController ()

@property (nonatomic) UILabel *congratsLabel;
@property (nonatomic) UILabel *scoreLabel;
@property (nonatomic) UIButton *finishButton;

@end

@implementation QuizFinishedViewController
{
	int numberCorrect;
	NSUInteger numberOfQuestions;
}

- (instancetype)initWithCorrectAnswers:(int)numCorrect andNumQuestions:(NSUInteger)numQuestions
{
	self = [super init];
	if (self) {
		numberCorrect = numCorrect;
		numberOfQuestions = numQuestions;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// (197,31,93)
	self.view.backgroundColor = [UIColor colorWithRed:197.0f/255.0f
												 green:31.0f/255.0f
												  blue:93.0f/255.0f
												 alpha:1.0f];
	self.congratsLabel = [[UILabel alloc]init];
	self.congratsLabel.text = @"Congrats! You completed the quiz!";
	self.congratsLabel.lineBreakMode = NSLineBreakByWordWrapping;
	self.congratsLabel.numberOfLines = 0;
	self.congratsLabel.textAlignment = NSTextAlignmentCenter;
	self.congratsLabel.font = [UIFont systemFontOfSize:40];
	self.congratsLabel.textColor = UIColor.whiteColor;
	
	self.scoreLabel = [[UILabel alloc]init];
	NSString *scoreText = [NSString stringWithFormat:@"You answered \n %i out of %lu \n correctly", numberCorrect, (unsigned long)numberOfQuestions];
	self.scoreLabel.text = scoreText;
	self.scoreLabel.lineBreakMode = NSLineBreakByWordWrapping;
	self.scoreLabel.numberOfLines = 0;
	self.scoreLabel.textAlignment = NSTextAlignmentCenter;
	self.scoreLabel.font = [UIFont systemFontOfSize:30];
	self.scoreLabel.textColor = [UIColor colorWithRed:20.0f/255.0f
												green:29.0f/255.0f
												 blue:38.0f/255.0f
												alpha:1.0f];
	
	self.finishButton = [[UIButton alloc]init];
	[self.finishButton setTitle:@"Finish" forState:UIControlStateNormal];
	[self.finishButton addTarget:self action:@selector(finishButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	self.finishButton.contentEdgeInsets = UIEdgeInsetsMake(15, 40, 15, 40);
	self.finishButton.layer.cornerRadius = 5;
	self.finishButton.backgroundColor = [UIColor colorWithRed:20.0f/255.0f
													  green:29.0f/255.0f
													   blue:38.0f/255.0f
													  alpha:1.0f];
	
	[self.view addSubview:self.congratsLabel];
	[self.view addSubview:self.scoreLabel];
	[self.view addSubview:self.finishButton];
	[self layoutSubiews];
}

- (void)layoutSubiews
{
	self.scoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self.scoreLabel.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.scoreLabel.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	[self.scoreLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
	[self.scoreLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
	
	self.congratsLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self.congratsLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
	[self.congratsLabel.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.congratsLabel.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	
	self.finishButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.finishButton.topAnchor constraintGreaterThanOrEqualToAnchor: self.scoreLabel.bottomAnchor constant:10].active = YES;
	[self.finishButton.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.finishButton.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	[self.finishButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
}

- (void)finishButtonPressed:(UIButton *)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}

@end
