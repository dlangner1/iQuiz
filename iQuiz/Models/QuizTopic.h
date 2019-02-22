//
//  QuizTopics.h
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizTopic : NSObject

@property UIImage *image;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *topicDescription;

- (instancetype)initWithImagePath:(NSString *)imageName
                        Topic:(NSString *)name
                  Description:(NSString *)description;

@end

NS_ASSUME_NONNULL_END
