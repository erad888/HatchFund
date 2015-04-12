//
//  MainViewController.m
//  Copyright (c) 2015 AblyMobile. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize listOfFunds, theTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    theTableView.backgroundColor = [UIColor clearColor];
    theTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero]; // remove extra rows

    //self.title = @"Home";
    NSMutableDictionary *titleBarAttributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [titleBarAttributes setValue:[UIFont fontWithName:@"Avenir Next" size:20] forKey:NSFontAttributeName];
    [[UINavigationBar appearance] setTitleTextAttributes:titleBarAttributes];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    listOfFunds = [[NSMutableArray alloc] init];
    FundObject *fundObj = [[FundObject alloc] init];
    fundObj.fundName = @"Super Fund A";
    fundObj.fundValue = @36.12;
    fundObj.fundGain = @1.52;
    [listOfFunds addObject:fundObj];
    fundObj = [[FundObject alloc] init];
    fundObj.fundName = @"Super Fund B";
    fundObj.fundValue = @24.12;
    fundObj.fundGain = @0.25;
    [listOfFunds addObject:fundObj];
    fundObj = [[FundObject alloc] init];
    fundObj.fundName = @"Super Fund C";
    fundObj.fundValue = @3724.12;
    fundObj.fundGain = @30.58;
    [listOfFunds addObject:fundObj];
    [self addFundToList:@"Super Fund D" withValue:@246.11 withGain:@4.09];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addFundToList:(NSString *)name withValue:(NSNumber *)value withGain:(NSNumber *)gain
{
    FundObject *fundObj = [[FundObject alloc] init];
    fundObj.fundName = name;
    fundObj.fundValue = value;
    fundObj.fundGain = gain;
    [listOfFunds addObject:fundObj];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// --------------------------------
// - Table Controls
// --------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"[listOfFunds count]+1 = %lu", (unsigned long)([listOfFunds count]+1));
    if ([listOfFunds count] == 0) {
        return 1;
    }
    else
        return [listOfFunds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *theTableIdentifier = @"fundCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theTableIdentifier];

    // Configure Cell
    UILabel *fundNameLabel = (UILabel *)[cell.contentView viewWithTag:1];
    UILabel *fundValueLabel = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel *fundGainLabel = (UILabel *)[cell.contentView viewWithTag:3];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theTableIdentifier];
    }
    
    FundObject *fundObj;
    if ([listOfFunds count] == 0) {
        fundNameLabel.text = @"No funds found.";
        fundValueLabel.text = @"";
        fundGainLabel.text = @"";
        return cell;
    }
    else
        fundObj = [listOfFunds objectAtIndex:indexPath.row];
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
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath = %lu", (long)indexPath.row);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
}


@end
