//
//  ExploreViewController.m
//  TestBed
//
//  Created by Albert Cheng on 4/12/15.
//  Copyright (c) 2015 Ably Mobile. All rights reserved.
//

#import "ExploreViewController.h"
#import "FundInfoViewController.h"

@interface ExploreViewController ()
{
    NSString *nameString;
}

@end

@implementation ExploreViewController


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
    
    _listOfFunds=[[NSMutableArray alloc] init];
    NSDictionary* funds = @{@"name" : @"FirstFund", @"percentage" : @0.26};
    [_listOfFunds addObject:funds];
    funds = [[NSDictionary alloc] init];
    funds = @{@"name" : @"SecondFund", @"percentage" :  @0.10};
    [_listOfFunds addObject:funds];
    funds = [[NSDictionary alloc] init];
    funds = @{@"name" : @"ThirdFund", @"percentage" :  @0.34};
    [_listOfFunds addObject:funds];
    funds = [[NSDictionary alloc] init];
    funds = @{@"name" : @"ForthFund", @"percentage" :  @0.69};
    [_listOfFunds addObject:funds];
    [self addToList:@"FifthFund" withPercent:@0.44];
    [self addToList:@"SixthFund" withPercent:@0.24];
    [self addToList:@"SeventhFund" withPercent:@0.47];
    [self addToList:@"EighthFund" withPercent:@0.06];
    [self addToList:@"NinthFund" withPercent:@0.12];
    [self addToList:@"TenthFund" withPercent:@0.30];
    
}

- (void)addToList:(NSString *)name withPercent:(NSNumber *)number
{
    NSDictionary* funds = @{@"name" : name, @"percentage" : number};
    [_listOfFunds addObject:funds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"[listOfFunds count]+1 = %lu", (unsigned long)([_listOfFunds count]+1));
    //    if ([_listOfFunds count] == 0) {
    //        return 1;
    //    }
    //    else
    return [_listOfFunds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *theTableIdentifier = @"fundCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theTableIdentifier];
    
    // Configure Cell
    UILabel *fundNameLabel = (UILabel *)[cell.contentView viewWithTag:101];
    UIProgressView *fundProgress = (UIProgressView *)[cell.contentView viewWithTag:102];
    UILabel *fundNum = (UILabel *)[cell.contentView viewWithTag:103];
    //UILabel *fundGainLabel2 = (UILabel *)[cell.contentView viewWithTag:4];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theTableIdentifier];
    }
    NSDictionary *fund = [_listOfFunds objectAtIndex:indexPath.row];
    NSLog(@"fund = %@", fund);
    NSLog(@"fundName = %@", [fund objectForKey:@"name"]);
    NSString *nameString = [fund objectForKey:@"name"];
    NSNumber *percent = [fund objectForKey:@"percentage"];
    fundNameLabel.text = nameString;
    fundNum.text = [NSString stringWithFormat:@"%.0f%%", [percent doubleValue] * 100];
    fundProgress.progress = [percent floatValue];
    
    /*
     FundObject *fundObj;
     if ([_listOfFunds count] == 0) {
     fundNameLabel.text = @"No funds found.";
     fundValueLabel.text = @"";
     fundGainLabel.text = @"";
     return cell;
     }
     else
     fundObj = [_listOfFunds objectAtIndex:indexPath.row];
     NSString *fundName = fundObj.fundName;
     
     fundNameLabel.text = fundName;
     
     if ([fundName isEqualToString:@" + Create New Fund"]) {
     }
     else {
     NSNumber *fundValue = fundObj.fundValue;
     NSNumber *fundGain = fundObj.fundGain;
     
     fundValueLabel.text = [NSString stringWithFormat:@"$%@", fundValue];
     fundGainLabel.text = [NSString stringWithFormat:@"$%@", fundGain];
     }
     */
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath = %lu", (long)indexPath.row);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSDictionary *fund = [_listOfFunds objectAtIndex:indexPath.row];
    nameString = [fund objectForKey:@"name"];
    
    [self performSegueWithIdentifier:@"fundInfoSegue" sender:self];
}






#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"fundInfoSegue"]) {
        //preparation
        
        FundInfoViewController *controller = (FundInfoViewController *)segue.destinationViewController;
        NSLog(@"nameString = %@", nameString);
        controller.nameLabel.text = nameString;
        controller.fundNameString = nameString;
    }
}


@end
