//
//  QuizTopicAPI.m
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuizTopicAPI.h"


@implementation QuizTopicAPI

+ (void)getQuizData:(void (^)(NSArray *results, NSError *error))completionHandler {
    NSString *queryString = @"https://tednewardsandbox.site44.com/questions.json";
    NSURL *url = [NSURL URLWithString:queryString];
    NSURLSession *session = [NSURLSession sharedSession];
	NSURLSessionDataTask *task = [session dataTaskWithURL:url
										completionHandler:^(NSData * _Nullable data,
															NSURLResponse * _Nullable response,
															NSError * _Nullable error) {
		if (error) {
			completionHandler(@[], error);
		}
		
		NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
		if (httpResponse.statusCode == 200) {
			NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
			
			
			
			
			
			
			
			completionHandler(json, error);
		}
	}];
	
	[task resume];
    
//    NSArray *topics = @[[[QuizTopic alloc]initWithImagePath:@"Math" Topic:@"Mathematics" Description:@"Quiz questions for basic mathematics!"],
//                        [[QuizTopic alloc]initWithImagePath:@"Marvel" Topic:@"Marvel Super Heroes" Description:@"Answer questions about your favorite super heros!"],
//                        [[QuizTopic alloc]initWithImagePath:@"Science" Topic:@"Science!" Description:@"Test your knowledge of science!"]
//                        ];
//    return topics;
}

@end
