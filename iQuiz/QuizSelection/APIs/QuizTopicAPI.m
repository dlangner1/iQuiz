//
//  QuizTopicAPI.m
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuizTopicAPI.h"


@implementation QuizTopicAPI {
    NSArray *quizTopicImageURLs;
    
}

+ (NSArray<QuizTopic *> *)getQuizTopics {
    NSArray *topics = @[[[QuizTopic alloc]initWithImagePath:@"Math" Topic:@"Mathematics" Description:@"Quiz questions for basic mathematics!"],
                        [[QuizTopic alloc]initWithImagePath:@"Marvel" Topic:@"Marvel Super Heros" Description:@"Answer questions about your favorite super heros!"],
                        [[QuizTopic alloc]initWithImagePath:@"Science" Topic:@"Science" Description:@"Test your knowledge of science!"]
                        ];
    return topics;
}

@end
