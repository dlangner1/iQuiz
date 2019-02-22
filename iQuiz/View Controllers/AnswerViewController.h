//
//  AnswerViewController.h
//  iQuiz
//
//  Created by Dustin Langner on 2/21/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AnswerViewControllerDelegate <NSObject>

- (void)updateStateAndTransitionToNewVC:(BOOL)isCorrectAnswer;

@end


@interface AnswerViewController : UIViewController

@property (nonatomic) UILabel *questionLabel;
@property (nonatomic) UILabel *userAnswerLabel;
@property (nonatomic) UILabel *correctAnswerLabel;
@property (nonatomic) UIButton *nextButton;

@property (nonatomic, weak) id<AnswerViewControllerDelegate> delegate;

- (instancetype)initWithQuestion:(NSString *)question CorrectAnswer:(NSString *)correctAnswer AndUserAnswer:(NSString *)userAnswer;

@end

NS_ASSUME_NONNULL_END
