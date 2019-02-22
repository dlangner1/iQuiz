//
//  AnswerViewController.m
//  iQuiz
//
//  Created by Dustin Langner on 2/21/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()

@end

@implementation AnswerViewController
{
	NSString *quizQuestion;
	NSString *correctQuizAnswer;
	NSString *userQuizAnswer;
}

#pragma mark - Initalizer

- (instancetype)initWithQuestion:(NSString *)question CorrectAnswer:(NSString *)correctAnswer AndUserAnswer:(NSString *)userAnswer
{
	self = [super init];
	if (self) {
		quizQuestion = question;
		correctQuizAnswer = correctAnswer;
		userQuizAnswer = userAnswer;
	}
	return self;
}

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithRed:36.0f/255.0f
												green:52.0f/255.0f
												 blue:71.0f/255.0f
												alpha:1.0f];
	
	[self setupSubviews];
	[self layoutSubviews];
}

#pragma mark - View Setup

- (void)setupSubviews
{
	self.nextButton = [[UIButton alloc]init];
	[self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
	 [self.nextButton addTarget:self action:@selector(nextButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	self.nextButton.contentEdgeInsets = UIEdgeInsetsMake(15, 40, 15, 40);
	self.nextButton.layer.cornerRadius = 5;
	self.nextButton.backgroundColor = [UIColor colorWithRed:20.0f/255.0f
													  green:29.0f/255.0f
													   blue:38.0f/255.0f
													  alpha:1.0f];
	
	self.questionLabel = [[UILabel alloc]init];
	self.questionLabel.text = quizQuestion;
	self.questionLabel.textColor = UIColor.whiteColor;
	UIFontDescriptor * fontD = [self.questionLabel.font.fontDescriptor fontDescriptorWithSymbolicTraits: UIFontDescriptorTraitItalic];
	[self.questionLabel setFont:[UIFont fontWithDescriptor:fontD size:35]];
	self.questionLabel.numberOfLines = 0;
	self.questionLabel.lineBreakMode = NSLineBreakByWordWrapping;
	self.questionLabel.textAlignment = NSTextAlignmentCenter;
	
	self.correctAnswerLabel = [[UILabel alloc]init];
	self.correctAnswerLabel.text = [@"Correct answer: \n" stringByAppendingString:correctQuizAnswer];
	self.correctAnswerLabel.textColor = UIColor.whiteColor;
	[self.correctAnswerLabel setFont:[UIFont systemFontOfSize:24]];
	self.correctAnswerLabel.numberOfLines = 0;
	self.correctAnswerLabel.lineBreakMode = NSLineBreakByWordWrapping;
	
	
	self.userAnswerLabel = [[UILabel alloc]init];
	self.userAnswerLabel.text = [@"You answered: \n" stringByAppendingString:userQuizAnswer];;
	self.userAnswerLabel.textColor = [correctQuizAnswer isEqualToString:userQuizAnswer] ? UIColor.greenColor : UIColor.redColor;
	[self.userAnswerLabel setFont:[UIFont systemFontOfSize:24]];
	self.userAnswerLabel.numberOfLines = 0;
	self.userAnswerLabel.lineBreakMode = NSLineBreakByWordWrapping;
	
	[self.view addSubview:self.questionLabel];
	[self.view addSubview:self.correctAnswerLabel];
	[self.view addSubview:self.userAnswerLabel];
	[self.view addSubview:self.nextButton];
}

#pragma mark - View Layout

- (void)layoutSubviews
{
	self.questionLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self.questionLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10].active = YES;
	[self.questionLabel.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.questionLabel.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	
	self.correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self.correctAnswerLabel.topAnchor constraintGreaterThanOrEqualToAnchor:self.questionLabel.bottomAnchor constant:10].active = YES;
	[self.correctAnswerLabel.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.correctAnswerLabel.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;

	
	self.userAnswerLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self.userAnswerLabel.topAnchor constraintEqualToAnchor:self.correctAnswerLabel.bottomAnchor constant:30].active = YES;
	[self.userAnswerLabel.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.userAnswerLabel.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	[self.userAnswerLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;

	self.nextButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.nextButton.topAnchor constraintGreaterThanOrEqualToAnchor: self.userAnswerLabel.bottomAnchor constant:30].active = YES;
	[self.nextButton.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.nextButton.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	[self.nextButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-10].active = YES;
}

- (void)nextButtonPressed
{
	if ([self.delegate respondsToSelector:@selector(updateStateAndTransitionToNewVC:)]) {
		BOOL answeredCorrectly = [userQuizAnswer isEqualToString:correctQuizAnswer];
		[self.delegate updateStateAndTransitionToNewVC:answeredCorrectly];
	}
}

@end
