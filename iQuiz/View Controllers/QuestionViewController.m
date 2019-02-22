//
//  QuestionViewController.m
//  iQuiz
//
//  Created by Dustin Langner on 2/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "AnswerViewController.h"
#import "QuestionViewController.h"
#import "QuizQuestionView.h"
#import "QuizQuestion.h"


@interface QuestionViewController ()

@end

@implementation QuestionViewController
{
	int currentQuestionIndex;
}

#pragma mark - Initializer

- (instancetype)initWithQuestionData:(NSArray *)data
{
	self = [super init];
	if (self) {
		currentQuestionIndex = 0;
		
		self.quizQuestions = [NSMutableArray arrayWithCapacity:data.count];
		[data enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
			__weak __typeof__(self) weakSelf = self;
			NSString *question = [obj objectForKey:@"text"];
			int answerIndex = [[obj objectForKey:@"answer"] intValue];
			NSArray *answers = [obj objectForKey:@"answers"];
			
			QuizQuestion *quizQuestion = [[QuizQuestion alloc]initWithQuestion:question Answers:answers AnswerIndex:answerIndex];

			[weakSelf.quizQuestions addObject:quizQuestion];
		}];
	}
	return self;
}

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithRed:20.0f/255.0f
												green:29.0f/255.0f
												 blue:38.0f/255.0f
												alpha:1.0f];
	
	// create the quiz question view with the first question
	self.quizQuestionView = [[QuizQuestionView alloc]initWithQuestion:self.quizQuestions[currentQuestionIndex] AndDelegate:self];
	[self.view addSubview:self.quizQuestionView];
	
	if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact
		&& self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
		[self.quizQuestionView setAnswerStackViewSpacing:10];
	} else {
		[self.quizQuestionView setAnswerStackViewSpacing:30];
	}

	self.quizQuestionView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.quizQuestionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10].active = YES;
	[self.quizQuestionView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-10].active = YES;
	[self.quizQuestionView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.quizQuestionView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
}

#pragma mark - Rotation Handling

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
	[coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
		// Place code here to perform animations during the rotation.
		// You can pass nil or leave this block empty if not necessary.
		__weak __typeof__(self) weakSelf = self;
		if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact
			&& self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
			[weakSelf.quizQuestionView setAnswerStackViewSpacing:10];
		} else {
			[weakSelf.quizQuestionView setAnswerStackViewSpacing:30];
		}
	} completion:NULL];
}

#pragma mark - QuizQuestionViewDelegate

- (void)submitButtonPressed:(NSString *)answer
{
	QuizQuestion *quizQuestion = self.quizQuestions[currentQuestionIndex];
	NSString *question = quizQuestion.question;
	NSString *correctAnswer = [quizQuestion.possibleAnswers objectAtIndex:quizQuestion.answerIndex - 1];
	
	AnswerViewController *answerVC = [[AnswerViewController alloc]initWithQuestion:question CorrectAnswer:correctAnswer AndUserAnswer:answer];
	answerVC.delegate = self;
	answerVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentViewController:answerVC animated:YES completion:nil];
}

#pragma mark - AnswerViewControllerDelegate

@end
