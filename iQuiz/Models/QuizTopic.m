//
//  QuizTopics.m
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuizTopic.h"


@implementation QuizTopic

- (instancetype)initWithImagePath:(NSString *)imageName
                        Topic:(NSString *)name
                  Description:(NSString *)description
{
    self = [super init];
    if (self) {
        self.image = [UIImage imageNamed:imageName];
        self.name = name;
        self.topicDescription = description;
    }
    return self;
}

@end
