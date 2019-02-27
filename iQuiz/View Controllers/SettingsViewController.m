//
//  SettingsViewController.m
//  iQuiz
//
//  Created by Dustin Langner on 2/26/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (instancetype)initWithDelegate:(id<SettingsDelegate>)delegate
{
	self = [super init];
	if (self) {
		self.delegate = delegate;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = UIColor.whiteColor;
	[self setupView];
	[self addViewConstraints];
	self.modalInPopover = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:YES];
}

- (void)setupView
{
	self.textFieldDescriptionLabel = [[UILabel alloc]init];
	self.textFieldDescriptionLabel.text = @"Try another quiz URL below!";
	self.textFieldDescriptionLabel.textColor = UIColor.grayColor;
	self.textFieldDescriptionLabel.numberOfLines = 0;
	self.textFieldDescriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
	self.textFieldDescriptionLabel.font = [UIFont systemFontOfSize:20];
	
	self.urlSelectionTextField = [[UITextField alloc]init];
	self.urlSelectionTextField.placeholder = @"https://tednewardsandbox.site44.com/questions.json";
	self.urlSelectionTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.urlSelectionTextField.layer.borderColor = [[UIColor grayColor]CGColor];
	self.urlSelectionTextField.layer.borderWidth = 1.0f;
	
	self.checkNowButton = [[UIButton alloc]init];
	[self.checkNowButton addTarget:self action:@selector(checkNowButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	[self.checkNowButton setTitle:@"Check now" forState:UIControlStateNormal];
	self.checkNowButton.backgroundColor = [UIColor colorWithRed:36.0f/255.0f
														green:52.0f/255.0f
														 blue:71.0f/255.0f
														alpha:1.0f];
	self.checkNowButton.contentEdgeInsets = UIEdgeInsetsMake(10, 20, 10, 20);
	self.checkNowButton.layer.cornerRadius = 5;
	self.checkNowButton.titleLabel.minimumScaleFactor = 0.5f;
	self.checkNowButton.titleLabel.adjustsFontSizeToFitWidth = YES;
	
	self.cancelButton = [[UIButton alloc]init];
	[self.cancelButton addTarget:self action:@selector(cancelButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	[self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
	self.cancelButton.backgroundColor = UIColor.redColor;
	self.cancelButton.contentEdgeInsets = UIEdgeInsetsMake(10, 20, 10, 20);
	self.cancelButton.layer.cornerRadius = 5;
	self.cancelButton.titleLabel.minimumScaleFactor = 0.5f;
	self.cancelButton.titleLabel.adjustsFontSizeToFitWidth = YES;
	
	[self.view addSubview:self.textFieldDescriptionLabel];
	[self.view addSubview:self.urlSelectionTextField];
	[self.view addSubview:self.checkNowButton];
	[self.view addSubview:self.cancelButton];
}

- (void)addViewConstraints
{
	self.textFieldDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self.textFieldDescriptionLabel.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.textFieldDescriptionLabel.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	[self.textFieldDescriptionLabel.bottomAnchor constraintEqualToAnchor:self.urlSelectionTextField.topAnchor constant:-10].active = YES;
	
	self.urlSelectionTextField.translatesAutoresizingMaskIntoConstraints = NO;
	[self.urlSelectionTextField.leftAnchor constraintGreaterThanOrEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.urlSelectionTextField.rightAnchor constraintGreaterThanOrEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	[self.urlSelectionTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
	[self.urlSelectionTextField.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
	[self.urlSelectionTextField.heightAnchor constraintEqualToConstant:50].active = YES;
	
	self.checkNowButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.checkNowButton.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor constant:-10].active = YES;
	[self.checkNowButton.topAnchor constraintEqualToAnchor:self.urlSelectionTextField.bottomAnchor constant:20].active = YES;
	[self.checkNowButton.bottomAnchor constraintEqualToAnchor:self.self.view.safeAreaLayoutGuide.bottomAnchor constant:-10].active = YES;
	
	self.cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.cancelButton.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor constant:10].active = YES;
	[self.cancelButton.rightAnchor constraintEqualToAnchor:self.checkNowButton.leftAnchor constant:-20].active = YES;
	[self.cancelButton.topAnchor constraintEqualToAnchor:self.urlSelectionTextField.bottomAnchor constant:20].active = YES;
	[self.cancelButton.bottomAnchor constraintEqualToAnchor:self.self.view.safeAreaLayoutGuide.bottomAnchor constant:-10].active = YES;

}

- (void)checkNowButtonPressed
{
	if ([self.delegate respondsToSelector:@selector(checkNowButtonPressed:)]) {
		[self.delegate checkNowButtonPressed:self.urlSelectionTextField.text];
	}
}

- (void)cancelButtonPressed
{
	if ([self.delegate respondsToSelector:@selector(cancelButtonPressed)]) {
		[self.delegate cancelButtonPressed];
	}
}

#pragma mark - Popover Delegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
	return UIModalPresentationNone;
}

@end
