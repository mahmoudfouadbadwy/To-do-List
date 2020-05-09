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


@end
