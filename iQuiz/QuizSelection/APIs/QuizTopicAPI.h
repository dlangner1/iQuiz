//
//  QuizTopicAPI.h
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuizTopic.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuizTopicAPI : NSObject

+ (NSArray<QuizTopic *> *)getQuizTopics;

@end

NS_ASSUME_NONNULL_END
