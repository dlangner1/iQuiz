//
//  QuizQuestion.m
//  iQuiz
//
//  Created by Dustin Langner on 2/18/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuizQuestion.h"

@implementation QuizQuestion

- (instancetype)initWithQuestion:(NSString *)question Answers:(NSArray *)answers AnswerIndex:(int)answerIndex
{
	self = [super init];
	if (self) {
		self.question = question;
		self.possibleAnswers = answers;
		self.answerIndex = answerIndex;
	}
	return self;
}

@end
