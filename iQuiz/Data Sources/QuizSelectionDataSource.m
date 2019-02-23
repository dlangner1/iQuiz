//
//  QuizSelectionDataSource.m
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuizSelectionDataSource.h"
#import "QuizTopic.h"

@implementation QuizSelectionDataSource

- (instancetype)initWithTopics:(NSArray *)quizTopics
{
    self = [super init];
    if (self) {
        self.quizTopics = quizTopics;
    }
    return self;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    if (cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellIdentifier"];
    }
	
	// dictionary
    NSDictionary *topicDict = [self.quizTopics objectAtIndex:indexPath.row];
	
	NSString *title = [topicDict objectForKey:@"title"];
	NSString *desc = [topicDict objectForKey:@"desc"];
	
	cell.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:52.0f/255.0f blue:71.0f/255.0f alpha:1.0f];
	
	cell.imageView.image = [UIImage imageNamed:title];
	
	cell.textLabel.text = title;
	cell.textLabel.numberOfLines = 0;
	cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
	cell.textLabel.textColor = UIColor.whiteColor;
	
	cell.detailTextLabel.text = desc;
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
	cell.detailTextLabel.textColor = UIColor.whiteColor;

	
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.quizTopics.count;
}

@end
