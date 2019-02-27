//
//  AnswerSelectionView.m
//  iQuiz
//
//  Created by Dustin Langner on 2/19/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "AnswerSelectionView.h"

@implementation AnswerSelectionView
{
	UIStackView *verticalContainerStackView;
	UIButton *lastSelectedButton;
}

#pragma mark - Initializer

- (instancetype)initWithAnswers:(NSArray *)answers
{
	self = [super init];
	if (self) {
		lastSelectedButton = NULL;
		
		verticalContainerStackView = [[UIStackView alloc]init];
		verticalContainerStackView.axis = UILayoutConstraintAxisVertical;
		verticalContainerStackView.spacing = 15;
		
		for (NSString *answer in answers) {
			UIButton *button = [self createAnswerButton:answer];
			[verticalContainerStackView addArrangedSubview:button];
		}
		
		[self addSubview:verticalContainerStackView];
		[self addConstraintsToSubviews];
	}
	return self;
}

#pragma mark - Getters

- (nullable UIButton *)lastSelectedButton
{
	return lastSelectedButton;
}

#pragma mark - View Creation / Layout

- (void)addConstraintsToSubviews
{
	verticalContainerStackView.translatesAutoresizingMaskIntoConstraints = NO;
	[verticalContainerStackView.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor].active = YES;
	[verticalContainerStackView.leftAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[verticalContainerStackView.rightAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	[verticalContainerStackView.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor].active = YES;
}

- (void)setAnswerStackViewSpacing:(CGFloat)size
{
	verticalContainerStackView.spacing = size;
	[self layoutIfNeeded];
}

- (UIButton *)createAnswerButton:(NSString *)answer
{
	UIColor *twitterPink = [UIColor colorWithRed:197.0f/255.0f
										   green:31.0f/255.0f
											blue:93.0f/255.0f
										   alpha:1.0f];
	
	UIButton *button = [[UIButton alloc]init];
	[button setTitle:answer forState:UIControlStateNormal];
	
	[button setTitleColor:twitterPink forState:UIControlStateNormal];
	button.titleLabel.textColor = twitterPink;
	button.titleLabel.numberOfLines = 0;
	button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
	
	button.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
	button.backgroundColor = UIColor.clearColor;
	button.layer.cornerRadius = 10;
	button.layer.borderColor = [twitterPink CGColor];
	button.layer.borderWidth = 1.0f;
	
	[button addTarget:self action:@selector(answerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
	
	return button;
}

#pragma mark - Actions

- (void)answerButtonPressed:(UIButton *)sender
{
	UIColor *twitterPink = [UIColor colorWithRed:197.0f/255.0f
										   green:31.0f/255.0f
											blue:93.0f/255.0f
										   alpha:1.0f];
	if (lastSelectedButton) {
		lastSelectedButton.backgroundColor = UIColor.clearColor;
		[lastSelectedButton setTitleColor:twitterPink forState:UIControlStateNormal];
	}
	
	sender.backgroundColor = twitterPink;
	[sender setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
	lastSelectedButton = sender;
}

@end
