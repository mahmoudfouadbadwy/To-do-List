//
//  AddTask.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "AddTask.h"
#import "Todo.h"
#import "../Presenter/AddTaskPresenter.h"
@implementation AddTask

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpStatusPicker];
    [self setUpPriorityPicker];
    // presenter
    _presenter = [AddTaskPresenter new];
    _presenter.addTaskView = self;
    _presenter.taskProtocol = _todoView; // delegation .
}

- (void)viewWillAppear:(BOOL)animated{
    _flag?[self setUpEditingView]:[self setUpAddingView];
}

- (IBAction)saveBtn:(id)sender {
    // add task
    if(_flag == 0)
    {
        [self showAlert:@"Are You Sure You Want To Save ?"];
    }
    else  // edit task
    {
        [self checkEditState];
    }
}
-(void)showAlert:(NSString*)message {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Todo-List" message:message preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
        self->_flag?[self saveEditingTask]:[self saveAddingTask];
    }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:nil];
     [alert addAction:ok];
     [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)statusAlert:(NSString*)message{
    
      UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Todo-List" message:message preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
     [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];

}

- (void)setUpPriorityPicker {
    pickerPriority= @[@"High",@"Medium",@"Low"];
}
- (void)setUpStatusPicker {
   pickerStatus=[[NSMutableArray alloc]initWithArray:[NSArray arrayWithObjects:@"Todo",@"InProgress",@"Done", nil]];
}

- (void)setUpAddingView {
    _nameField.text=@"";
    _descriptionField.text=@"";
    [_priorityPicker selectRow:0 inComponent:0 animated: YES];
    [_statusPicker selectRow:0 inComponent:0 animated: YES];
}
- (void)setUpEditingView {
    _nameField.text=_nameEdit;
    _descriptionField.text=_descriptionEdit;
    NSInteger prow;
    NSInteger srow;
    if([_priorityEdit isEqualToString:@"Low"])
        prow=2;
    else if([_priorityEdit isEqualToString:@"High"])
        prow=0;
    else
        prow=1;
    [_priorityPicker selectRow:prow inComponent:0 animated: YES];
    
    if([_statusEdit isEqualToString:@"Todo"])
    {
        srow=0;
    }
    else if([_statusEdit isEqualToString:@"InProgress"])
    {
        srow=1;
    }
    else
    {
        srow=2;
    }
    [_statusPicker selectRow:srow inComponent:0 animated: YES];
}

-(void)saveAddingTask{
    NSMutableDictionary* data = [self getFormData];
    [_presenter saveAddingTask:[data valueForKey:@"name"]
                andDescription:[data valueForKey:@"description"]
                   andPriority:[data valueForKey:@"priority"]
                     andStatus:[data valueForKey:@"status"]
                       andDate:[data valueForKey:@"date"]];
}


-(void)saveEditingTask{
    NSMutableDictionary* data = [self getFormData];
    [_presenter saveEditingTask:[data valueForKey:@"name"] andDescription:[data valueForKey:@"description"] andPriority:[data valueForKey:@"priority"] andStatus:[data valueForKey:@"status"] andDate:[data valueForKey:@"date"]];
}
-(void)onSuccess{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)checkEditState {
    if([_statusEdit isEqualToString:@"InProgress"])
    {
        if ([[pickerStatus objectAtIndex:[_statusPicker selectedRowInComponent:0]] isEqualToString:@"Todo"])
        {
            [self statusAlert:@"Can Not Edit Status From Inprogress to Todo"];
        }
        else
        {
            [self showAlert:@"Editing this task will also edit its data"];
        }
    }
    else if([_statusEdit isEqualToString:@"Done"])
    {
        [self statusAlert:@"Can Not Edit Done Task "];
    }
    else
    {
        [self showAlert:@"Editing this task will also edit its data"];
    }
}

- (NSMutableDictionary *)getFormData{
    NSMutableDictionary* data =[NSMutableDictionary new];
    NSInteger row=[_priorityPicker selectedRowInComponent:0];
    NSLocale *currentLocale=[NSLocale new];
    NSString* taskDate =  [[NSDate date] descriptionWithLocale:currentLocale];
    [data setValue:taskDate forKey:(@"date")];
    NSString* taskName = [_nameField text];
    [data setValue:taskName forKey:(@"name")];
    NSString* taskDescription = [_descriptionField text];
    [data setValue:taskDescription forKey:(@"description")];
    NSString* taskPriority = [pickerPriority objectAtIndex:row];
    [data setValue:taskPriority forKey:(@"priority")];
    NSString* taskStatus = [pickerStatus objectAtIndex:[_statusPicker selectedRowInComponent:0]];
    [data setValue:taskStatus forKey:(@"status")];
    return data;
}

@end


