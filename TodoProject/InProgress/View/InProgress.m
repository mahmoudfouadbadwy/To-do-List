//
//  InProgress.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "InProgress.h"
#import "../Presenter/InProgressPresenter.h"

@interface InProgress ()
{
    NSMutableArray *inProgressArray;
}
@end

@implementation InProgress

//MARK: - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    _presenter = [InProgressPresenter new];
    [_inProgressTable setDelegate:self ];
    [_inProgressTable setDataSource:self];
   
}
-(void)viewWillAppear:(BOOL)animated
{
    inProgressArray = [_presenter getInprogressTasks];
   [_inProgressTable reloadData];
}


//MARK: - Table View
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [inProgressArray count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"inprogcell"];
        cell.textLabel.text=[[inProgressArray objectAtIndex:indexPath.row] name];
        cell.imageView.image = [UIImage imageNamed:[_presenter getTaskImage:indexPath.row]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"InProgress Tasks";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

@end
