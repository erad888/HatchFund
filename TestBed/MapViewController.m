//
//  MapViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "MapViewController.h"
#import "SWRevealViewController.h"
#import "FundObject.h"
#import "FundInfoViewController.h"

@interface MapViewController ()
{
    NSString *theNameString;
}

@end

@implementation MapViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    _listOfFunds=[[NSMutableArray alloc] init];
    NSDictionary* funds = @{@"name" : @"FirstFund", @"percentage" : @0.85};
    [_listOfFunds addObject:funds];
    funds = [[NSDictionary alloc] init];
    funds = @{@"name" : @"SecondFund", @"percentage" :  @0.23};
    [_listOfFunds addObject:funds];
    funds = [[NSDictionary alloc] init];
    funds = @{@"name" : @"ThirdFund", @"percentage" :  @0.44};
    [_listOfFunds addObject:funds];
    funds = [[NSDictionary alloc] init];
    funds = @{@"name" : @"ForthFund", @"percentage" :  @0.79};
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
    theNameString = [fund objectForKey:@"name"];
    
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
        NSLog(@"--nameString = %@", theNameString);
        controller.nameLabel.text = theNameString;
        controller.fundNameString = theNameString;
    }
}

@end
