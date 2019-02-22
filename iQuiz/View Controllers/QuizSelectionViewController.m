//
//  QuizSelectionViewController.m
//  iQuiz
//
//  Created by Dustin Langner on 2/17/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuizSelectionViewController.h"
#import "QuizSelectionDataSource.h"
#import "QuizTopicAPI.h"
#import "WelcomeView.h"

@interface QuizSelectionViewController ()

@end

@implementation QuizSelectionViewController
{
    QuizSelectionDataSource *dataSource;
}

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupSettingsNavigationBar];
	self.welcomeView = [[WelcomeView alloc]init];
	[self.view addSubview:self.welcomeView];
	
	self.welcomeView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.welcomeView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
	[self.welcomeView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor].active = YES;
	[self.welcomeView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor].active = YES;
	[self.welcomeView.heightAnchor constraintEqualToConstant:200].active = YES;
	
	[QuizTopicAPI getQuizData:^(NSArray * _Nonnull results, NSError * _Nonnull error) {
		__weak __typeof__(self) weakSelf = self;
		dispatch_async(dispatch_get_main_queue(), ^{
			if (error) {
				// display something where table view normally goes
				return;
			}
			[weakSelf createTableView:results];
		});
	}];
}

#pragma mark - View Setup

- (void)createTableView:(NSArray *)data
{
    self.tableView = [[UITableView alloc]init];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cellIdentifier"];
	
    dataSource = [[QuizSelectionDataSource alloc]initWithTopics:data];
    self.tableView.dataSource = dataSource;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    // Add constraints
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.tableView.topAnchor constraintEqualToAnchor:self.welcomeView.bottomAnchor].active = YES;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor].active = YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
}

- (void)setupSettingsNavigationBar
{
    self.navigationItem.title = @"Topics";
    UIBarButtonItem *settingsBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(settingsBarButtonPressed)];
    self.navigationItem.rightBarButtonItem = settingsBarButton;
}

- (void)settingsBarButtonPressed
{
	// TODO: Fill in this method
}

#pragma mark - UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
	NSDictionary *quizDict = dataSource.quizTopics[indexPath.row];
	NSArray *questions = [quizDict objectForKey:@"questions"];
	QuestionViewController *viewController = [[QuestionViewController alloc]initWithQuestionData:questions];
	[self.navigationController pushViewController:viewController animated:YES];
}

@end
