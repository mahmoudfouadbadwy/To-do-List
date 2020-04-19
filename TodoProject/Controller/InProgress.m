//
//  InProgress.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "InProgress.h"
#import "Todo.h"

@interface InProgress ()
{
    // object from model
    Tasks *progress;
    //declaratios
    NSData *obj;
    NSData *encode;
    NSMutableArray *arrobj;
    NSUserDefaults *progDef;
    NSMutableArray *progArray;
}
@end

@implementation InProgress

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_inProgTasks setDelegate:self ];
    [_inProgTasks setDataSource:self];
    progDef=[NSUserDefaults standardUserDefaults];
}
-(void)viewWillAppear:(BOOL)animated
{
    obj=[progDef objectForKey:@"task"];
    arrobj=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
    progArray=[NSMutableArray new];
    for(int i=0;i<[arrobj count];i++)
    {
        progress=[arrobj objectAtIndex:i];
        if([progress.status isEqualToString:@"InProgress"])
            [progArray addObject:progress];
    }
   [_inProgTasks reloadData];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [progArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"inprogcell"];
        progress=[progArray objectAtIndex:indexPath.row];
        cell.textLabel.text=[progress name];
     //   cell.accessoryType=UITableViewCellAccessoryDetailButton;
        // image view
        if([[progress priority]isEqualToString:@"Low"])
        {
            cell.imageView.image=[UIImage imageNamed:@"low.png"];
        }
        else if([[progress priority]isEqualToString:@"Medium"])
        {
            cell.imageView.image=[UIImage imageNamed:@"medium (2).png"];
        }
        else
        {
            cell.imageView.image=[UIImage imageNamed:@"high.png"];
        }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"In Progress Tasks List";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

@end
