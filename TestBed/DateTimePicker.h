//
//  DateTimePicker.h
//  TestBed
//
//  Created by Albert Cheng on 4/12/15.
//  Copyright (c) 2015 Ably Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateTimePicker : UIView

@property (nonatomic, assign, readonly) UIDatePicker *picker;

- (void) setMode: (UIDatePickerMode) mode;
- (void) addTargetForDoneButton: (id) target action: (SEL) action;
- (void) addTargetForCancelButton: (id) target action: (SEL) action;

@end
