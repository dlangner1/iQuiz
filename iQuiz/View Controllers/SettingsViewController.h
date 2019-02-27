//
//  SettingsViewController.h
//  iQuiz
//
//  Created by Dustin Langner on 2/26/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SettingsDelegate <NSObject>

- (void)checkNowButtonPressed:(NSString *)urlString;
- (void)cancelButtonPressed;

@end


@interface SettingsViewController : UIViewController <UIPopoverPresentationControllerDelegate>

@property (nonatomic, weak) id<SettingsDelegate> delegate;

@property (nonatomic) UILabel *textFieldDescriptionLabel;
@property (nonatomic) UITextField *urlSelectionTextField;
@property (nonatomic) UIButton *checkNowButton;
@property (nonatomic) UIButton *cancelButton;

- (instancetype)initWithDelegate:(id<SettingsDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
