//
//  AddTask.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddTask : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIPickerView *statusPicker;

@property NSString* nameEdit;
@property NSString* descriptionEdit;
@property NSString* priorityEdit;
@property NSString* statusEdit;
@property int flag;

@property id<AddProtocol>addpro;
@end

NS_ASSUME_NONNULL_END
