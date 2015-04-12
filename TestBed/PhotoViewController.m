//
//  PhotoViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "PhotoViewController.h"
#import "SWRevealViewController.h"
#import "FundObject.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoImageView.image = [UIImage imageNamed:self.photoFilename];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        NSNumber *number = [NSNumber numberWithInt:rand()%60+20];
        [dataArray addObject:number];
    }

    [self.pieChartView renderInLayer:self.pieChartView dataArray:dataArray];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"[listOfFunds count]+1 = %lu", (unsigned long)([_listOfFunds count]+1));
    //    if ([_listOfFunds count] == 0) {
    //        return 1;
    //    }
    //    else
    return 1;
    //return [_listOfFunds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *theTableIdentifier = @"fundCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theTableIdentifier];
    
    // Configure Cell
    UILabel *fundGoal = (UILabel *)[cell.contentView viewWithTag:101];
    UILabel *fundGoalVal = (UILabel *)[cell.contentView viewWithTag:102];
    UILabel *fundDetail = (UILabel *)[cell.contentView viewWithTag:103];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theTableIdentifier];
    }
    fundGoal.text = @"Goal: ";
    fundGoalVal.text = @"$6,500";
    fundDetail.text = @"Details:      Threshold = t%     Time = T ";
    
    
    
//    NSDictionary *fund = [_listOfFunds objectAtIndex:indexPath.row];
//    NSLog(@"fund = %@", fund);
//    NSLog(@"fundName = %@", [fund objectForKey:@"name"]);
//    NSString *nameString = [fund objectForKey:@"name"];
//    NSNumber *percent = [fund objectForKey:@"percentage"];
//    fundNameLabel.text = nameString;
//    fundNum.text = [NSString stringWithFormat:@"%.0f%%", [percent doubleValue] * 100];
//    fundProgress.progress = [percent floatValue];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
