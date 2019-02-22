//
//  QuizQuestionView.m
//  iQuiz
//
//  Created by Dustin Langner on 2/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuizQuestionView.h"
#import "AnswerSelectionView.h"
#import "QuizQuestion.h"



@implementation QuizQuestionView

#pragma mark - Initalizers

- (instancetype)initWithQuestion:(QuizQuestion *)questionData AndDelegate:(id<QuizQuestionViewDelegate>)delegate
{
	self = [super init];
	if (self) {
		self.delegate = delegate;
		
		// Configure question label
		self.questionLabel = [[UILabel alloc]init];
		self.questionLabel.text = questionData.question;
		self.questionLabel.textColor = UIColor.whiteColor;
		self.questionLabel.lineBreakMode = NSLineBreakByWordWrapping;
		self.questionLabel.numberOfLines = 0;
		self.questionLabel.textAlignment = NSTextAlignmentCenter;
		UIFontDescriptor * fontD = [self.questionLabel.font.fontDescriptor
	fontDescriptorWithSymbolicTraits: UIFontDescriptorTraitItalic];
		[self.questionLabel setFont:[UIFont fontWithDescriptor:fontD size:35]];
		
		
		// Create answer view
		self.answerButtonsContainer = [[AnswerSelectionView alloc]initWithAnswers:questionData.possibleAnswers];
		
		// Configure submit button
		self.submitButton = [[UIButton alloc]init];
		[self.submitButton setTitle:@"Submit Answer" forState:UIControlStateNormal];
		// (36,52,71)
		[self.submitButton addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		
		
		self.submitButton.backgroundColor = [UIColor colorWithRed:36.0f/255.0f
															green:52.0f/255.0f
															blue:71.0f/255.0f
															alpha:1.0f];
		self.submitButton.contentEdgeInsets = UIEdgeInsetsMake(15, 40, 15, 40);
		self.submitButton.layer.cornerRadius = 5;
		[self addSubview:self.questionLabel];
		[self addSubview:self.answerButtonsContainer];
		[self addSubview:self.submitButton];
		[self addConstraintsToSubviews];
	}
	return self;
}

#pragma mark - View Layout

- (void)addConstraintsToSubviews
{
	self.questionLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self.questionLabel.topAnchor constraintGreaterThanOrEqualToAnchor:self.safeAreaLayoutGuide.topAnchor].active = YES;
	[self.questionLabel.leftAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.questionLabel.rightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	
	self.answerButtonsContainer.translatesAutoresizingMaskIntoConstraints = NO;
	[self.answerButtonsContainer.topAnchor constraintEqualToAnchor:self.questionLabel.bottomAnchor constant:10].active = YES;
	[self.answerButtonsContainer.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
	[self.answerButtonsContainer.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
	[self.answerButtonsContainer.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
	
	self.submitButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.submitButton.topAnchor constraintEqualToAnchor:self.answerButtonsContainer.bottomAnchor constant:10].active = YES;
	[self.submitButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
	[self.submitButton.bottomAnchor constraintLessThanOrEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor].active = YES;
}

- (void)setAnswerStackViewSpacing:(CGFloat)size
{
	[self.answerButtonsContainer setAnswerStackViewSpacing:size];
}

# pragma mark - Actions

- (void)submitButtonPressed:(NSString *)answer
{
	UIButton *lastButton = [self.answerButtonsContainer lastSelectedButton];
	
	if (lastButton && [self.delegate respondsToSelector:@selector(submitButtonPressed:)]) {
		NSString *answerText = lastButton.titleLabel.text;
		[self.delegate submitButtonPressed:answerText];
	}
}

@end
