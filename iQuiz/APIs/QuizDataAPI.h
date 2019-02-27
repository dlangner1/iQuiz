//
//  QuizDataAPI.h
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizDataAPI : NSObject

+ (void)getQuizDataWithUrl:(NSString * _Nullable)urlString CompletionHandler:(void (^)(NSArray * _Nullable results, NSError *error))completionHandler ;
+ (void)saveQuizDataToDisk:(NSData *)data;
+ (void)deleteQuizDataFromDisk;
+ (NSArray * _Nullable)readQuizDataFromDisk;

@end

NS_ASSUME_NONNULL_END
