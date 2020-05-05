//
//  AddTask.h
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../AddTaskViewProtocol.h"
#import "../AddTaskPresenterProtocol.h"
#import "Todo.h"
NS_ASSUME_NONNULL_BEGIN
//UIPickerViewDelegate,UIPickerViewDataSource,
@interface AddTask : UIViewController <AddTaskViewProtocol,UIAlertViewDelegate>
{
    NSArray *pickerPriority;
    NSMutableArray *pickerStatus;
}
// outlets
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UIPickerView *priorityPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *statusPicker;

@property NSString* nameEdit;
@property NSString* descriptionEdit;
@property NSString* priorityEdit;
@property NSString* statusEdit;
@property int flag;

@property id<AddTaskPresenterProtocol>presenter;
@property Todo * todoView;// for delegation
@end

NS_ASSUME_NONNULL_END
