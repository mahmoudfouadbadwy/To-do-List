//
//  Done.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "Done.h"
#import "../Model/Tasks.h"
@interface Done ()
{
    // object from model
    Tasks *done;
    //declaratios
    NSData *obj;
    NSData *encode;
    NSMutableArray *arrobj;
    NSUserDefaults *doneDef;
    NSMutableArray *doneArray;
}
@end

@implementation Done

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_doneTable reloadData];
    [_doneTable setDataSource:self];
    [_doneTable setDelegate:self];
    doneDef=[NSUserDefaults standardUserDefaults];
}

-(void)viewWillAppear:(BOOL)animated{
    obj=[doneDef  objectForKey:@"task"];
    arrobj=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
    doneArray=[NSMutableArray new];
    for(int i=0;i<[arrobj count];i++)
    {
        done=[arrobj objectAtIndex:i];
        if([done.status isEqualToString:@"Done"])
            [doneArray addObject:done];
    }
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
        done=[doneArray objectAtIndex:indexPath.row];
        cell.textLabel.text=[done name];
      //  cell.accessoryType=UITableViewCellAccessoryDetailButton;
        // image view
        if([[done priority]isEqualToString:@"Low"])
        {
            cell.imageView.image=[UIImage imageNamed:@"low.png"];
        }
        else if([[done priority]isEqualToString:@"Medium"])
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
    return @"Done Tasks List";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

@end
