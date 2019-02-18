//
//  QuizSelectionDataSource.h
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizSelectionDataSource : NSObject <UITableViewDataSource>

@property (nonatomic) NSArray *quizTopics;

- (instancetype)initWithTopics:(NSArray *)quizTopics;

@end

NS_ASSUME_NONNULL_END
