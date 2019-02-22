//
//  QuizQuestionView.h
//  iQuiz
//
//  Created by Dustin Langner on 2/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnswerSelectionView.h"
@class QuizQuestion;

NS_ASSUME_NONNULL_BEGIN

@protocol QuizQuestionViewDelegate <NSObject>

- (void)submitButtonPressed:(NSString *)answer;

@end

@interface QuizQuestionView : UIView

@property (nonatomic, weak) id<QuizQuestionViewDelegate> delegate;

// Label for the question
@property (nonatomic) UILabel *questionLabel;
// Selectable icons for each of the questions
@property (nonatomic) AnswerSelectionView *answerButtonsContainer;
// A submit button to solidify the answer
@property (nonatomic) UIButton *submitButton;

- (instancetype)initWithQuestion:(QuizQuestion *)questionData AndDelegate:(id<QuizQuestionViewDelegate>)delegate;

- (void)setAnswerStackViewSpacing:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
