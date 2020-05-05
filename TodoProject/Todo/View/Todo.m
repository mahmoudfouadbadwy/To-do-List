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
#import "../Presenter/TodoPresenter.h"
#import "../TodoPresenterProtocol.h"
@interface Todo()
@property id<TodoPresenterProtocol>prsenter;
@end

@implementation Todo

//MARK: - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // presenter
    _prsenter = [TodoPresenter new];
    _prsenter.todoView = self;
    // search
    isFiltered=false;
    [_searchbar setDelegate:self];
    // table view
    [_tasksTableView setDelegate:self];
    [_tasksTableView setDataSource:self];

}
-(void)viewWillAppear:(BOOL)animated{
    [_tasksTableView  reloadData];
}

//MARK: - IBAction
- (IBAction)addTaskAction:(id)sender {
    [_prsenter addTask];
}

//MARK: -Delegation Methods
-(void)addTask:(Tasks *)task{
    tasks = [_prsenter getTasks];
    [tasks addObject:task];
    [_prsenter addTaskToUsersDefaults:tasks];
}

-(void)editTask:(Tasks *)task{
    // get all objects then remove certain object.
    tasks = [_prsenter getTasks];
    [tasks removeObjectAtIndex:selectedRow];
    [tasks insertObject:task atIndex:selectedRow];
    // clear userdefaults
    [_prsenter clearUserDefaults];
    // encode objects then add them to userdefaults
    [_prsenter addTaskToUsersDefaults:tasks];
    [_tasksTableView reloadData];
}


//MARK: - Table View Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // search case
    if(isFiltered)
    {
        return filter.count;
    }
    // default case
   return [_prsenter getTsksCount];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[_tasksTableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    
    if(isFiltered)
    {
        cell.textLabel.text=[[filter objectAtIndex:indexPath.row] name];
        cell.accessoryType=UITableViewCellAccessoryDetailButton;
    }
    else
    {
        tasks = [_prsenter getTasks];
        task =[tasks objectAtIndex:indexPath.row];
        cell.textLabel.text=[task name];
        cell.accessoryType=UITableViewCellAccessoryDetailButton;
        // image view
        if([[task priority]isEqualToString:@"Low"])
        {
            cell.imageView.image=[UIImage imageNamed:@"low.png"];
        }
        else if([[task priority]isEqualToString:@"Medium"])
        {
            cell.imageView.image=[UIImage imageNamed:@"medium (2).png"];
        }
        else
        {
            cell.imageView.image=[UIImage imageNamed:@"high.png"];
        }
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [_prsenter showTaskDetails:indexPath.row];
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
    selectedRow=indexPath.row;
    [_prsenter editTask:indexPath.row];
}

//MARk: - Search
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
        for(Tasks *task in tasks)
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


//MARK: - ALERT
-(void)showAlert{
    NSString *message = @"Deleting this task will also delete its data";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Delete Task" message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction: [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault  handler:^(UIAlertAction * _Nonnull action) {
          [self deleteTask];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
     
     [self presentViewController:alert animated:true completion:nil];
}

//MARK: - DELETE TASK
-(void)deleteTask
{
    // get all objects then remove certain object from array .
    tasks = [_prsenter getTasks];
    [tasks removeObjectAtIndex:deleteFlag];
    // clear userdefaults
    [_prsenter clearUserDefaults];
    // encode objects then add them to userdefaults
    [_prsenter addTaskToUsersDefaults:tasks];
    [_tasksTableView reloadData];
}

//MARK:- Navigation
- (void)goToDetailView {
     [self.navigationController pushViewController:[_prsenter detail] animated:YES];
}

-(void)goToAddView{
    [self.navigationController  pushViewController:[_prsenter addView] animated:YES];
}


@end
