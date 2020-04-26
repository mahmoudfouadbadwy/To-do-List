//
//  Priority.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "Priority.h"
#import "../../Model/Tasks.h"
@interface Priority ()
{
    Tasks* priority;
    //declaratios
    NSData *obj;
    NSData *encode;
    NSMutableArray *arrobj;
    //
    NSUserDefaults *priorityDef;
    NSMutableArray *lAraay;
    NSMutableArray *hAraay;
    NSMutableArray *mAraay;
}
@end

@implementation Priority

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_priorityTable setDelegate:self];
    [_priorityTable setDataSource:self];
    priorityDef=[NSUserDefaults standardUserDefaults];
    _priorityTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    
}

- (void)viewWillAppear:(BOOL)animated{
    obj=[priorityDef objectForKey:@"task"];
    arrobj=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
    lAraay=[NSMutableArray new];
    mAraay=[NSMutableArray new];
    hAraay=[NSMutableArray new];
    for(int i=0;i<[arrobj count];i++)
    {
         priority=[arrobj objectAtIndex:i];
         if([priority.priority isEqualToString:@"High"])
         {
             [hAraay addObject:priority];
         }
        else if([priority.priority isEqualToString:@"Medium"])
        {
             [mAraay addObject:priority];
        }
        else if([priority.priority isEqualToString:@"Low"])
        {
             [lAraay addObject:priority];
        }
      
    }
    [_priorityTable reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger row=0;
    switch ([_segment selectedSegmentIndex]) {
        case 2:
            row=[hAraay count];
            if (row==0){row=1;}
            break;
        case 1:
            row=[mAraay count];
            if (row==0){row=1;}
            break;
        case 0:
            row=[lAraay count];
            if (row==0){row=1;}
            break;
    }
    return row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"prioritycell"];
    
//    obj=[priorityDef objectForKey:@"task"];
//    arrobj=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
//    priority=[arrobj objectAtIndex:indexPath.row];
    switch ([_segment selectedSegmentIndex]) {
            
        case 2:
             if ([hAraay count]==0)
             {
                 cell.textLabel.text=@"No Tasks Found";
                 cell.imageView.image=[UIImage imageNamed:@""];
             }
             else
             {
             priority=[hAraay objectAtIndex:indexPath.row];
             cell.textLabel.text=[priority name];
           //  cell.accessoryType=UITableViewCellAccessoryDetailButton;
             cell.imageView.image=[UIImage imageNamed:@"high.png"];
             }
        break;
            
        case 1:
            if ([mAraay count]==0)
            {
                cell.textLabel.text=@"No Tasks Found";
                cell.imageView.image=[UIImage imageNamed:@""];
            }
            else
            {
                priority=[mAraay objectAtIndex:indexPath.row];
           //     cell=[tableView dequeueReusableCellWithIdentifier:@"prioritycell"];
                cell.textLabel.text=[priority name];
             //   cell.accessoryType=UITableViewCellAccessoryDetailButton;
                cell.imageView.image=[UIImage imageNamed:@"medium (2).png"];
            }
            break;
        case 0:
            if ([lAraay count]==0)
            {
                cell.textLabel.text=@"No Tasks Found";
                cell.imageView.image=[UIImage imageNamed:@""];
            }
            else
            {
            priority=[lAraay objectAtIndex:indexPath.row];
         //   cell=[tableView dequeueReusableCellWithIdentifier:@"prioritycell"];
            cell.textLabel.text=[priority name];
        //    cell.accessoryType=UITableViewCellAccessoryDetailButton;
            cell.imageView.image=[UIImage imageNamed:@"low.png"];
            }
            break;
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title=@"";
    switch ([_segment selectedSegmentIndex]) {
        case 2:
            title=@"High Priority";
            break;
        case 1:
            title=@"Medium Priority";
            break;
        case 0:
            title=@"Low Priority";
            break;
    }
    return title;
}



- (IBAction)segmentAction:(id)sender {
    [_priorityTable reloadData];
}

@end
