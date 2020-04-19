//
//  Todo.m
//  TodoProject
//
//  Created by Mahmoud Fouad on 12/13/19.
//  Copyright © 2019 Mahmoud fouad. All rights reserved.
//

#import "Todo.h"
#import "AddTask.h"
#import "TasksDetails.h"

@interface Todo ()

@end

@implementation Todo
{
    // objetcs from views
    AddTask *addView;
    TasksDetails *detail;
    // object from model
    Tasks *t;
    //declaratios
    NSData *obj;
    NSData *encode;
    NSMutableArray *arrobj;
    NSInteger selectedRow;
    NSMutableArray *filter;
    BOOL isFiltered;
    NSInteger deleteFlag;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    addView=[self.storyboard instantiateViewControllerWithIdentifier:@"Add"];
    detail=[self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    [addView setAddpro:self];
    _taskDef=[NSUserDefaults standardUserDefaults];
    _taskArr=[NSMutableArray new ];
    [_tasksTableView setDelegate:self];
    [_tasksTableView setDataSource:self];
    
    isFiltered=false;
    [_searchbar setDelegate:self];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [_tasksTableView  reloadData];
}


- (IBAction)AddTask:(id)sender {
     [self.navigationController  pushViewController:addView animated:YES];
     addView.flag=0;
    
}

-(void)addTask:(Tasks *)task{
    
    // mutable array is empty
    // decode objetcs from userdefaults
    if([_taskArr count]==0)
    {
      obj=[_taskDef objectForKey:@"task"];
      arrobj=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
      for(int i=0;i<[arrobj count];i++)
       {
        t=[arrobj objectAtIndex:i] ;
        [_taskArr addObject:t];
       }
    }

    [_taskArr addObject:task];
    // encode objets then add in userdefaults
    encode=[NSKeyedArchiver archivedDataWithRootObject:_taskArr];
    [_taskDef setObject:encode forKey:@"task"];
    [_taskDef synchronize];
}

-(void)editTask:(Tasks *)task{
    
    // get all objects then remove certain objetc
    obj=[_taskDef objectForKey:@"task"];
    _taskArr=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
    [_taskArr removeObjectAtIndex:selectedRow];
    [_taskArr insertObject:task atIndex:selectedRow];
    
    // clear userdefaults
    [_taskDef removeObjectForKey:@"task"];
    
    // encode objects then add them to userdefaults
    encode=[NSKeyedArchiver archivedDataWithRootObject:_taskArr];
    [_taskDef setObject:encode forKey:@"task"];
    [_taskDef synchronize];
    [_tasksTableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // number of row = number of objets
    if(isFiltered)
    {
        return filter.count;
    }
    
   obj=[_taskDef objectForKey:@"task"];
   arrobj=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
   if([arrobj count]==0)
   {
       return 1;
   }
   return [arrobj count];

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[_tasksTableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    
    if(isFiltered)
    {
        
        t=[filter objectAtIndex:indexPath.row] ;
        cell.textLabel.text=[t name];
        cell.accessoryType=UITableViewCellAccessoryDetailButton;
    }
    else
    {
        if([arrobj count]==0)
        {
            cell.textLabel.text=@"No Tasks Found";
            cell.imageView.image=[UIImage imageNamed:@""];
            cell.accessoryType=UITableViewCellAccessoryNone;
        }
        else
        {
        obj=[_taskDef objectForKey:@"task"];
        arrobj=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
        t=[arrobj objectAtIndex:indexPath.row] ;
        cell.textLabel.text=[t name];
        cell.accessoryType=UITableViewCellAccessoryDetailButton;
        
        // image view
        if([[t priority]isEqualToString:@"Low"])
        {
            cell.imageView.image=[UIImage imageNamed:@"low.png"];
        }
        else if([[t priority]isEqualToString:@"Medium"])
        {
            cell.imageView.image=[UIImage imageNamed:@"medium (2).png"];
        }
        else
        {
            cell.imageView.image=[UIImage imageNamed:@"high.png"];
        }
    }
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:detail animated:YES];
    
    obj=[_taskDef objectForKey:@"task"];
    arrobj=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
    t=[arrobj objectAtIndex:indexPath.row] ;
    detail.detailName=t.name;
    detail.detailDescription=t.Description;
    detail.detailPriority=t.priority;
    detail.detailDate=t.date;
    detail.detailStatus=t.status;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Tasks List";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        
        [self showAlert];
        deleteFlag= indexPath.row;

        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController  pushViewController:addView animated:YES];
    
    selectedRow=indexPath.row;
    addView.flag=1;
    obj=[_taskDef objectForKey:@"task"];
    arrobj=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
    t=[arrobj objectAtIndex:indexPath.row];
    addView.nameEdit=t.name;
    addView.descriptionEdit=t.Description;
    addView.priorityEdit=t.priority;
    addView.statusEdit=t.status;
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if(searchText.length==0)
    {
        isFiltered = false;
        [self.searchbar endEditing:YES];
    }
    
    else
    {
        isFiltered=true;
        filter=[NSMutableArray new];
        for(Tasks *task in arrobj)
        {
            NSRange range= [task.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(range.location !=NSNotFound)
            {
                [filter addObject:task];
            }
        }
    }
    [self.tasksTableView reloadData];
}



-(void)showAlert{
    UIAlertView *alert=[UIAlertView alloc];
    [alert initWithTitle:@"Delete Task" message:@"Deleting this task will also delete its data" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0)
    {
     
    }
    else if (buttonIndex==1)
    {
        [self deleteTask];
        
    }
}

-(void)deleteTask
{
    // get all objects then remove certain objetc
            obj=[_taskDef objectForKey:@"task"];
            _taskArr=[NSKeyedUnarchiver unarchiveObjectWithData:obj];
            [_taskArr removeObjectAtIndex:deleteFlag];
    
            // clear userdefaults
            [_taskDef removeObjectForKey:@"task"];
    
            // encode objects then add them to userdefaults
            encode=[NSKeyedArchiver archivedDataWithRootObject:_taskArr];
            [_taskDef setObject:encode forKey:@"task"];
            [_taskDef synchronize];
            [_tasksTableView reloadData];
}

@end
