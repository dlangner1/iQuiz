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
#import "QuizDataAPI.h"
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
	self.view.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:52.0f/255.0f blue:71.0f/255.0f alpha:1.0f];
	[self setupSettingsNavigationBar];
	self.welcomeView = [[WelcomeView alloc]init];
	[self.view addSubview:self.welcomeView];
	
	self.welcomeView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.welcomeView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
	[self.welcomeView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
	[self.welcomeView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
	[self.welcomeView.heightAnchor constraintEqualToConstant:200].active = YES;
	
	// A nil URL will use the default URL
	[self fetchDataAndSetupTableViewWithUrl:nil];
}

#pragma mark - View Setup

- (void)createTableView:(NSArray *)data
{
    self.tableView = [[UITableView alloc]init];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cellIdentifier"];
	self.tableView.backgroundColor = [UIColor colorWithRed:36.0f/255.0f green:52.0f/255.0f blue:71.0f/255.0f alpha:1.0f];
	self.tableView.layoutMargins = UIEdgeInsetsZero;
	self.tableView.separatorInset = UIEdgeInsetsZero;
	
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

- (void)fetchDataAndSetupTableViewWithUrl:(NSString * _Nullable)urlString
{
	[QuizDataAPI getQuizDataWithUrl:urlString CompletionHandler:^(NSArray * _Nonnull results, NSError * _Nonnull error) {
		__weak __typeof__(self) weakSelf = self;
		dispatch_async(dispatch_get_main_queue(), ^{
			if (error) {
				// try to read from disk
				// otherwise, displayfailed download
				NSArray *data = [QuizDataAPI readQuizDataFromDisk];
				if (data) {
					[weakSelf createTableView:data];
				} else {
					[weakSelf createFailedDownloadView];
				}
				return;
			}
			[weakSelf createTableView:results];
		});
	}];
	
}

- (void)createFailedDownloadView
{
	UILabel *failedToDownloadLabel = [[UILabel alloc]init];
	failedToDownloadLabel.text = @"We failed to fetch your list of quizzes :( \n You are either offline, or the download failed. Check your connectivity and try again";
	failedToDownloadLabel.textColor = UIColor.whiteColor;
	failedToDownloadLabel.textAlignment = NSTextAlignmentCenter;
	failedToDownloadLabel.font = [UIFont systemFontOfSize:20];
	failedToDownloadLabel.lineBreakMode = NSLineBreakByWordWrapping;
	failedToDownloadLabel.numberOfLines = 0;
	
	[self.view addSubview:failedToDownloadLabel];
	failedToDownloadLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[failedToDownloadLabel.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[failedToDownloadLabel.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	[failedToDownloadLabel.topAnchor constraintEqualToAnchor:self.welcomeView.bottomAnchor constant:10].active = YES;
	[failedToDownloadLabel.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-10].active = YES;
	
}

- (void)setupSettingsNavigationBar
{
    self.navigationItem.title = @"Topics";
    UIBarButtonItem *settingsBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(settingsBarButtonPressed)];
    self.navigationItem.rightBarButtonItem = settingsBarButton;
}

- (void)settingsBarButtonPressed
{
	SettingsViewController *controller = [[SettingsViewController alloc]initWithDelegate:self];
	
	controller.modalPresentationStyle = UIModalPresentationPopover;
	controller.preferredContentSize = CGSizeMake(self.view.frame.size.width, 200);
	
	// configure popover style & delegate
	UIPopoverPresentationController *popover =  controller.popoverPresentationController;
	popover.delegate = controller;
	popover.sourceView = controller.view;
	popover.sourceRect = CGRectMake(1, 1, self.view.frame.size.width, 150);
	[UIView animateWithDuration:0.2 animations:^{
		self.view.alpha = 0.5;
	}];
	
	// display the controller in the usual way
	[self presentViewController:controller animated:YES completion:nil];
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

#pragma mark - Settings Delegate

- (void)checkNowButtonPressed:(NSString *)urlString
{
	[QuizDataAPI deleteQuizDataFromDisk];
	[self.tableView removeFromSuperview];
	
	[self fetchDataAndSetupTableViewWithUrl:urlString];
	
	[UIView animateWithDuration:0.2 animations:^{
		self.view.alpha = 1.0;
	}];
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

- (void)cancelButtonPressed
{
	[UIView animateWithDuration:0.2 animations:^{
		self.view.alpha = 1.0;
	}];
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
