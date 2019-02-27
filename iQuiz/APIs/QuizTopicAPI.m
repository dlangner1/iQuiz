//
//  QuizTopicAPI.m
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuizTopicAPI.h"


@implementation QuizTopicAPI

+ (void)getQuizDataWithUrl:(NSString * _Nullable)urlString CompletionHandler:(void (^)(NSArray * _Nullable results, NSError *error))completionHandler {
	NSString *queryString = urlString ? urlString : @"https://tednewardsandbox.site44.com/questions.json";
    NSURL *url = [NSURL URLWithString:queryString];
    NSURLSession *session = [NSURLSession sharedSession];
	NSURLSessionDataTask *task = [session dataTaskWithURL:url
										completionHandler:^(NSData * _Nullable data,
															NSURLResponse * _Nullable response,
															NSError * _Nullable error) {
		if (error) {
			completionHandler(nil, error);
		}
		
		NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
		if (httpResponse.statusCode == 200) {
			[self saveQuizDataToDisk:data];
			
			NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
			completionHandler(json, error);
		}
	}];
	
	[task resume];
}

+ (void)saveQuizDataToDisk:(NSData *)data
{
	NSURL *documentUrl = [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
	NSString *fileUrl = [[documentUrl URLByAppendingPathComponent:@"quizData.json"] path];
	[data writeToFile:fileUrl atomically:TRUE];
}

+ (NSArray * _Nullable)readQuizDataFromDisk
{
	NSURL *documentUrl = [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
	NSString *fileUrl = [[documentUrl URLByAppendingPathComponent:@"quizData.json"] path];
	
	if ([[NSFileManager defaultManager] fileExistsAtPath:fileUrl]) {
		NSData *data = [[NSFileManager defaultManager] contentsAtPath:fileUrl];
		return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
	}
	return nil;
}

@end
