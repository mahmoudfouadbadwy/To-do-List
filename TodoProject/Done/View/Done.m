//
//  Done.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "Done.h"
@interface Done ()
{
    NSMutableArray *doneArray;
}
@end

@implementation Done
//MARK: - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    _presenter = [donePresenter new];
    [_doneTable setDataSource:self];
    [_doneTable setDelegate:self];
}

-(void)viewWillAppear:(BOOL)animated{
    doneArray = [_presenter getDoneTasks];
    [_doneTable  reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [doneArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"donecell"];
        cell.textLabel.text = [[doneArray objectAtIndex:indexPath.row] name];
        cell.imageView.image = [UIImage imageNamed:[_presenter getTaskImage:indexPath.row]];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Done Tasks List";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

@end
