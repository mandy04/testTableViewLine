//
//  UIButton+Bootstrap.h
//  testTableViewLine
//
//  Created by llbt on 16/2/24.
//  Copyright © 2016年 llbt. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, StrapButtonStyle) {
    StrapBootstrapStyle = 0,
    StrapDefaultStyle,
    StrapPrimaryStyle,
    StrapSuccessStyle,
    StrapInfoStyle,
    StrapWarningStyle,
    StrapDangerStyle
};

@interface UIButton (Bootstrap)

-(void)successStyle;
- (UIImage *) buttonImageFromColor:(UIColor *)color ;
+ (UIButton *)buttonWithStyle:(StrapButtonStyle)style andTitle:(NSString *)title andFrame:(CGRect)rect target:(id)target action:(SEL)selector;

@end
