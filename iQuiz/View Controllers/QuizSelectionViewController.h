//
//  QuizSelectionViewController.h
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WelcomeView;

NS_ASSUME_NONNULL_BEGIN

@interface QuizSelectionViewController : UIViewController <UITableViewDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) WelcomeView *welcomeView;

@end

NS_ASSUME_NONNULL_END
