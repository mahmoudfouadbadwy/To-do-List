//
//  TasksDetails.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/14/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "TasksDetails.h"

@interface TasksDetails ()

@end

@implementation TasksDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
     _taskName.text=_detailName;
    _TaskDescription.text=_detailDescription;
    _taskPriority.text=_detailPriority;
    _taskDate.text=_detailDate;
    _taskStatus.text=_detailStatus;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
