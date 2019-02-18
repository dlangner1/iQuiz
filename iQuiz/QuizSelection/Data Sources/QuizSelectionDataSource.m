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
    
    QuizTopic *topic = [self.quizTopics objectAtIndex:indexPath.row];
    cell.imageView.image = topic.image;
    cell.textLabel.text = topic.name;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.detailTextLabel.text = topic.topicDescription;
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.quizTopics.count;
}

@end
