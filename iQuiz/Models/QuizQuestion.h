//
//  QuizQuestion.h
//  iQuiz
//
//  Created by Dustin Langner on 2/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizQuestion : NSObject

@property (nonatomic) NSString *question;
@property (nonatomic) NSArray *possibleAnswers;
@property (nonatomic) int answerIndex;

- (instancetype)initWithQuestion:(NSString *)question Answers:(NSArray *)answers AnswerIndex:(int)answerIndex;

@end

NS_ASSUME_NONNULL_END
