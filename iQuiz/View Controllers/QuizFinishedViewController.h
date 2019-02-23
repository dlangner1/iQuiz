//
//  QuizFinishedViewController.h
//  iQuiz
//
//  Created by Dustin Langner on 2/22/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizFinishedViewController : UIViewController

- (instancetype)initWithCorrectAnswers:(int)numCorrect andNumQuestions:(NSUInteger)numQuestions;

@end

NS_ASSUME_NONNULL_END
