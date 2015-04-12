//
//  CreateFundViewController.m
//  TestBed
//
//  Created by Albert Cheng on 4/12/15.
//  Copyright (c) 2015 Ably Mobile. All rights reserved.
//

#import "CreateFundViewController.h"

@interface CreateFundViewController ()

@end

@implementation CreateFundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _theTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero]; // remove extra rows
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    _listOfStocks=[[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"[listOfStocks count]+1 = %lu", (unsigned long)([_listOfStocks count]+1));
    //    if ([_listOfFunds count] == 0) {
    //        return 1;
    //    }
    //    else
    return [_listOfStocks count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.row < ([_listOfStocks count]-1)) {
        static NSString *theTableIdentifier = @"stockCell";
        cell = [tableView dequeueReusableCellWithIdentifier:theTableIdentifier];
        
        // Configure Cell
        UILabel *stockNameLabel = (UILabel *)[cell.contentView viewWithTag:101];
        UILabel *stockCountLabel = (UILabel *)[cell.contentView viewWithTag:102];
        
        NSDictionary *stock = [_listOfStocks objectAtIndex:indexPath.row];
        NSLog(@"stock = %@", stock);
        NSLog(@"stockName = %@", [stock objectForKey:@"name"]);
        NSString *nameString = [stock objectForKey:@"name"];
        NSNumber *quantity = [stock objectForKey:@"amount"];
        stockNameLabel.text = nameString;
        stockCountLabel.text = [NSString stringWithFormat:@"%d", [quantity intValue]];
    }
    else {
        static NSString *theTableIdentifier = @"addCell";
        cell = [tableView dequeueReusableCellWithIdentifier:theTableIdentifier];
        
        // Configure Cell
        UITextField *stockNameField = (UITextField *)[cell.contentView viewWithTag:50];
        UITextField *stockQuantityField = (UITextField *)[cell.contentView viewWithTag:51];
        UIButton *addButton = (UIButton *)[cell.contentView viewWithTag:52];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theTableIdentifier];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath = %lu", (long)indexPath.row);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == [_listOfStocks count]) {
        
        // Configure Cell
        UITextField *stockNameField = (UITextField *)[cell.contentView viewWithTag:50];
        UITextField *stockQuantityField = (UITextField *)[cell.contentView viewWithTag:51];
        UIButton *addButton = (UIButton *)[cell.contentView viewWithTag:52];
        
        if (stockQuantityField.text.length > 0 && stockNameField.text.length > 0) {
            NSDictionary *stockItem = @{@"name": [stockNameField text], @"amount": [stockQuantityField text]};
            [_listOfStocks addObject:stockItem];
            [_theTableView reloadData];
            
        }
    }
    
}

-(IBAction)createButton:(id)sender
{
    
    [self performSegueWithIdentifier:@"createDoneSegue" sender:self];
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
