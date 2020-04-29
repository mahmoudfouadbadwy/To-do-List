//
//  AddTask+Views.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 4/29/20.
//  Copyright © 2020 Mahmoud fouad. All rights reserved.
//

#import "AddTask+Views.h"

@implementation AddTask (Views)

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger numberOfRows=0;
    switch (pickerView.tag) {
        case 0:
            numberOfRows=pickerPriority.count;
            break;
        case 1:
            numberOfRows=pickerStatus.count;

            break;
    }
    return numberOfRows;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *titleForRow=@"";
    switch (pickerView.tag) {
        case 0:
            titleForRow=pickerPriority[row];
            break;
        case 1:
            titleForRow=pickerStatus[row];
            break;
    }
    return titleForRow;
}

@end
