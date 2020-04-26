//
//  AddTask.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "AddTask.h"
#import "Todo.h"
#import "../../Model/Tasks.h"
@interface AddTask ()
{
    NSArray *pickerData;
    NSMutableArray *pickerStatus;
}

@end

@implementation AddTask
{
    Tasks *task;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    pickerData=@[@"High",@"Medium",@"Low"];
    //pickerStatus=@[@"Todo",@"InProgress",@"Done"];
    pickerStatus=[[NSMutableArray alloc]initWithArray:[NSArray arrayWithObjects:@"Todo",@"InProgress",@"Done", nil]];
    self.picker.dataSource=self;
    self.picker.delegate=self;
    self.statusPicker.dataSource=self;
    self.statusPicker.delegate=self;
    
}

- (void)viewWillAppear:(BOOL)animated{
  
    if(_flag==1)
    {
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
        [_picker selectRow:prow inComponent:0 animated: YES];
        
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
    else
    {
        
        _nameField.text=@"";
        _descriptionField.text=@"";
        [_picker selectRow:0 inComponent:0 animated: YES];
        [_statusPicker selectRow:0 inComponent:0 animated: YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveBtn:(id)sender {
    NSInteger row=[_picker selectedRowInComponent:0];
    
    if(_flag==0)
    {
        [self showAlert:@"Are You Sure You Want To Save ?"];
    }
    else
    {
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
           if ([[pickerStatus objectAtIndex:[_statusPicker selectedRowInComponent:0]] isEqualToString:@"Todo"] || [[pickerStatus objectAtIndex:[_statusPicker selectedRowInComponent:0]] isEqualToString:@"InProgress"] )
           {
                [self statusAlert:@"Can Not Edit Done Status "];
           }
            else
                 [self showAlert:@"Editing this task will also edit its data"];
        }
        else
        {
        [self showAlert:@"Editing this task will also edit its data"];
        }
    }
    task=[Tasks new];
    [task setName:[_nameField text]];
    [task setDescription:[_descriptionField text]];
    [task setPriority:[pickerData objectAtIndex:row]];
    [task setStatus:[pickerStatus objectAtIndex:[_statusPicker selectedRowInComponent:0]]];
    NSLocale *currentLocale=[NSLocale new];
    [task setDate:   [[NSDate date] descriptionWithLocale:currentLocale]];
    //    NSDate *date=[NSDate new];
    //    NSDateFormatter *dateFormater=[NSDateFormatter new];
    //    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm:ss a"];
    //    [dateFormater stringFromDate:date];
    //    [task setDate:date];
   
   
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger n=0;
    switch (pickerView.tag) {
        case 0:
            n=pickerData.count;
            break;
        case 1:
            n=pickerStatus.count;
        
            break;
    }
    return n;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *n=@"";
    switch (pickerView.tag) {
        case 0:
            n=pickerData[row];
            break;
        case 1:
            n=pickerStatus[row];
            break;
    }
    return n;
}


-(void)showAlert:(NSString*)message {
    UIAlertView *alert=[UIAlertView alloc];
    
    [alert initWithTitle:@"Edit Task" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1 && _flag)
    {
         [_addpro editTask:task];
         [self.navigationController popViewControllerAnimated:YES];
    }
    else if(buttonIndex==1 && _flag==0)
    {
        [_addpro addTask:task];
        [self.navigationController popViewControllerAnimated:YES];
    }
   
}


-(void)statusAlert:(NSString*)message{
    UIAlertView *alert=[UIAlertView alloc];
    [alert initWithTitle:@"Edit Task"
                 message:message
    
                delegate:self
       cancelButtonTitle:@"OK"
       otherButtonTitles:nil
     , nil];
    [alert show];
}

@end


