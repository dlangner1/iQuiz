//
//  QuizSelectionViewController.m
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuizSelectionViewController.h"
#import "QuizSelectionDataSource.h"
#import "QuizTopicAPI.h"

@interface QuizSelectionViewController ()

@end

@implementation QuizSelectionViewController {
    QuizSelectionDataSource *dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSettingsNavigationBar];
    [self setupTableView];
}

- (void)setupTableView {
    NSArray *quizTopics = [QuizTopicAPI getQuizTopics];
    
    self.tableView = [[UITableView alloc]init];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cellIdentifier"];
    
    dataSource = [[QuizSelectionDataSource alloc]initWithTopics:quizTopics];
    self.tableView.dataSource = dataSource;
    // TODO: set delegate and data source when ready
    [self.view addSubview:self.tableView];
    
    // Add constraints
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor].active = YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
}

- (void)setupSettingsNavigationBar {
    self.navigationItem.title = @"Topics";
    UIBarButtonItem *settingsBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(settingsBarButtonPressed)];
    self.navigationItem.rightBarButtonItem = settingsBarButton;
    
}

- (void)settingsBarButtonPressed {
    
    
    
}

@end
