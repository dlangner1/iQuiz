//
//  AnswerSelectionView.h
//  iQuiz
//
//  Created by Dustin Langner on 2/19/19.
//  Copyright © 2019 Dustin Langner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnswerSelectionView : UIView

- (instancetype)initWithAnswers:(NSArray *)answers;

- (void)setAnswerStackViewSpacing:(CGFloat)size;
- (nullable UIButton *)lastSelectedButton;

@end

NS_ASSUME_NONNULL_END
