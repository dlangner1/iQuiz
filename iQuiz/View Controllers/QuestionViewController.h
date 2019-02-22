//
//  QuestionViewController.h
//  iQuiz
//
//  Created by Dustin Langner on 2/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AnswerViewController.h"
#import "QuizQuestionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionViewController : UIViewController <QuizQuestionViewDelegate, AnswerViewControllerDelegate>

@property (nonatomic) NSMutableArray *quizQuestions;
@property (nonatomic) QuizQuestionView *quizQuestionView;

- (instancetype)initWithQuestionData:(NSArray *)data;

@end

NS_ASSUME_NONNULL_END
