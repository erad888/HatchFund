//
//  StockViewController.m
//  TestBed
//
//  Created by Albert Cheng on 4/12/15.
//  Copyright (c) 2015 Ably Mobile. All rights reserved.
//

#import "StockViewController.h"
#import "SWRevealViewController.h"

@interface StockViewController ()
{
    NSMutableArray *stockTickers;
    NSMutableArray *stockValues;
    NSMutableArray *stockData;
}

@end

@implementation StockViewController

@synthesize theTableView, listOfStockData, searchField, searchButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    theTableView.backgroundColor = [UIColor clearColor];
    theTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero]; // remove extra rows
    theTableView.contentInset = UIEdgeInsetsZero;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    listOfStockData = [[NSMutableArray alloc] init];
    
//    // Process CSV into NSDictionary
//    NSString *absoluteURL = @"http://ichart.yahoo.com/table.csv?s=GOOG&a=2&b=8&c=2015&d=0&e=0";
//    //NSString *absoluteURL = @"http://ichart.yahoo.com/table.csv?s=GOOG";
//    NSURL *url = [NSURL URLWithString:absoluteURL];
//    NSString *fileString = [[NSString alloc] initWithContentsOfURL:url];
//    
//    //NSLog(@"fileString = %@", fileString);
//    
//    NSArray *contentArray = [fileString componentsSeparatedByString:@"\r"];
//    for (NSString *theString in contentArray) {
//        NSArray *lineArray = [theString componentsSeparatedByString:@"\n"];
//        //NSLog(@"line -----> %@",[lineArray objectAtIndex:0]);
//        for (NSString *lineString in lineArray) {
//            NSArray *lineVals = [lineString componentsSeparatedByString:@","];
//            if(lineVals.count == 7 && ![[lineVals objectAtIndex:1] isEqualToString:@"Open"])
//            {
//                NSMutableDictionary *stockData = [[NSMutableDictionary alloc] init];
//                //Date,Open,High,Low,Close,Volume,Adj Close
////                NSLog(@"0) %@", [lineVals objectAtIndex:0]);
////                NSLog(@"1) %@", [lineVals objectAtIndex:1]);
////                NSLog(@"2) %@", [lineVals objectAtIndex:2]);
////                NSLog(@"3) %@", [lineVals objectAtIndex:3]);
////                NSLog(@"4) %@", [lineVals objectAtIndex:4]);
////                NSLog(@"5) %@", [lineVals objectAtIndex:5]);
////                NSLog(@"6) %@", [lineVals objectAtIndex:6]);
//                [stockData setObject:[lineVals objectAtIndex:0] forKey:@"Date"];
//                [stockData setObject:[lineVals objectAtIndex:1] forKey:@"Open"];
//                [stockData setObject:[lineVals objectAtIndex:2] forKey:@"High"];
//                [stockData setObject:[lineVals objectAtIndex:3] forKey:@"Low"];
//                [stockData setObject:[lineVals objectAtIndex:4] forKey:@"Close"];
//                [stockData setObject:[lineVals objectAtIndex:5] forKey:@"Volume"];
//                [stockData setObject:[lineVals objectAtIndex:6] forKey:@"AdjClose"];
//                //[listOfStockData addObject:stockData];
//            }
//        }
//    }
    
    stockTickers = [[NSMutableArray alloc] init];
    [stockTickers addObjectsFromArray:@[@"TSLA", @"MSFT", @"AAPL", @"GOOG"]];
    
//    NSArray *itemArray = [[NSArray alloc] init];
//    for (NSString *items in contentArray) {
//        itemArray = [items componentsSeparatedByString:@","];
//        
//        NSLog(@"String -----> %@",[itemArray objectAtIndex:0]);
//        for (NSString *item in itemArray) {
//            
//            NSLog(@"-----> %@",item);
//        }
//    }
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


- (NSMutableDictionary*) getSecurities : (NSString*)ticker
{
    NSMutableDictionary *itemObj = [[NSMutableDictionary alloc] init];
    NSMutableArray *stockArray = [[NSMutableArray alloc] init];
    // Process CSV into NSDictionary
    //NSString *absoluteURL = @"http://ichart.yahoo.com/table.csv?s=GOOG&a=3&b=01&c=2015&d=0&e=0";
    NSString *absoluteURL = [NSString stringWithFormat:@"http://ichart.yahoo.com/table.csv?s=%@&a=3&b=08&c=2015&d=0&e=0", ticker];
    NSURL *url = [NSURL URLWithString:absoluteURL];
    NSString *fileString = [[NSString alloc] initWithContentsOfURL:url];
    
    //NSLog(@"fileString = %@", fileString);
    
    NSMutableDictionary *theStockData;
    
    NSArray *contentArray = [fileString componentsSeparatedByString:@"\r"];
    for (NSString *theString in contentArray) {
        NSArray *lineArray = [theString componentsSeparatedByString:@"\n"];
        //NSLog(@"line -----> %@",[lineArray objectAtIndex:0]);
        for (NSString *lineString in lineArray) {
            //NSLog(@"line -----> %@",lineString);
            NSArray *lineVals = [lineString componentsSeparatedByString:@","];
            if(lineVals.count == 7 && ![[lineVals objectAtIndex:1] isEqualToString:@"Open"])
            {
                theStockData = [[NSMutableDictionary alloc] init];
                //Date,Open,High,Low,Close,Volume,Adj Close
                //                NSLog(@"0) %@", [lineVals objectAtIndex:0]);
                //                NSLog(@"1) %@", [lineVals objectAtIndex:1]);
                //                NSLog(@"2) %@", [lineVals objectAtIndex:2]);
                //                NSLog(@"3) %@", [lineVals objectAtIndex:3]);
                //                NSLog(@"4) %@", [lineVals objectAtIndex:4]);
                //                NSLog(@"5) %@", [lineVals objectAtIndex:5]);
                //                NSLog(@"6) %@", [lineVals objectAtIndex:6]);
                [theStockData setObject:[lineVals objectAtIndex:0] forKey:@"Date"];
                [theStockData setObject:[lineVals objectAtIndex:1] forKey:@"Open"];
                [theStockData setObject:[lineVals objectAtIndex:2] forKey:@"High"];
                [theStockData setObject:[lineVals objectAtIndex:3] forKey:@"Low"];
                [theStockData setObject:[lineVals objectAtIndex:4] forKey:@"Close"];
                [theStockData setObject:[lineVals objectAtIndex:5] forKey:@"Volume"];
                [theStockData setObject:[lineVals objectAtIndex:6] forKey:@"AdjClose"];
                [stockArray addObject:theStockData];
            }
        }
    }
    //NSLog(@"stockArray = %@", stockArray);
    NSDictionary *prevStockVal = [stockArray objectAtIndex:1];
    NSDictionary *lastStockVal = [stockArray objectAtIndex:0];
    NSNumber *closeVal = [lastStockVal objectForKey:@"Close"];
    NSNumber *highVal = [lastStockVal objectForKey:@"High"];
    NSNumber *lowVal = [lastStockVal objectForKey:@"Low"];
    NSString *dateVal = [lastStockVal objectForKey:@"Date"];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *dateString = [dateFormatter stringFromDate:theDate];
//    NSLog(@"dateString = %@", dateString);
//    NSString *dateVal = [dateFormatter stringFromDate:theDate];
    NSNumber *prevClose = [prevStockVal objectForKey:@"Close"];
    NSNumber *changeVal = [NSNumber numberWithDouble:([prevClose doubleValue]-[closeVal doubleValue])];
    NSLog(@"changeVal = %@", changeVal);
    NSNumber *changePct = [NSNumber numberWithDouble:([prevClose doubleValue]/[closeVal doubleValue])];
    
    NSString *closeValue = [NSString stringWithFormat:@"%.2f", [closeVal floatValue]];
    NSString *highValue = [NSString stringWithFormat:@"%.2f", [highVal floatValue]];
    NSString *lowValue = [NSString stringWithFormat:@"%.2f", [lowVal floatValue]];
    
    [itemObj setObject:closeValue forKey:@"last"];
    [itemObj setObject:highValue forKey:@"high"];
    [itemObj setObject:lowValue forKey:@"low"];
    [itemObj setObject:dateVal forKey:@"lasttradedatetime"];
    [itemObj setObject:[NSString stringWithFormat:@"%.2f",[changeVal floatValue]] forKey:@"change"];
    [itemObj setObject:[NSString stringWithFormat:@"%.2f",[changePct floatValue]] forKey:@"changepercent"];
    //NSLog(@"itemObj = %@", itemObj);
    return itemObj;
}

// --------------------------------
// - Table Controls
// --------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"[listOfFunds count]+1 = %lu", (unsigned long)([listOfFunds count]+1));
    if ([stockTickers count] == 0) {
        return 1;
    }
    else
        return [stockTickers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *theTableIdentifier = @"fundCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theTableIdentifier];
    
    // Configure Cell
    UILabel *stockValue = (UILabel *)[cell viewWithTag:3];
    UILabel *stockChange = (UILabel *)[cell viewWithTag:4];
    UILabel *stockTickerLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *stockHigh = (UILabel *)[cell viewWithTag:5];
    UILabel *stockLow = (UILabel *)[cell viewWithTag:6];
    UILabel *stockDateTime = (UILabel *)[cell viewWithTag:7];
    UILabel *stockName = (UILabel *)[cell viewWithTag:8];
    UILabel *highText = (UILabel *)[cell viewWithTag:9];
    UILabel *lowText = (UILabel *)[cell viewWithTag:10];
    UILabel *updateText = (UILabel *)[cell viewWithTag:11];
    
    UIImageView *stockArrowImageView = (UIImageView *)[cell viewWithTag:2];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theTableIdentifier];
    }
    
    if ([stockTickers count] == 0) {
        stockArrowImageView.image = [UIImage imageNamed:@"GreenPlus.png"];
        highText.hidden = YES;
        lowText.hidden = YES;
        updateText.hidden = YES;
        stockValue.hidden = YES;
        stockChange.hidden = YES;
        stockHigh.hidden = YES;
        stockLow.hidden = YES;
        stockDateTime.hidden = YES;
        stockName.hidden = NO;
        stockName.text = @"Search New Order";
        stockTickerLabel.text = @"Search";
        UIColor * color = [UIColor colorWithRed:181/255.0f green:252/255.0f blue:246/255.0f alpha:1.0f];
        [cell setBackgroundColor:color];
        return cell;
    }
    else
    {
        
        highText.hidden = NO;
        lowText.hidden = NO;
        updateText.hidden = NO;
        stockValue.hidden = NO;
        stockChange.hidden = NO;
        stockHigh.hidden = NO;
        stockLow.hidden = NO;
        stockDateTime.hidden = NO;
        stockName.hidden = YES;
        
        //NSLog(@"stockTickers: %@", stockTickers);
        //NSLog(@"indexPath.item: %tu", indexPath.item);
        NSMutableDictionary* theSecurity = [self getSecurities : [stockTickers objectAtIndex:indexPath.item]];
        NSLog(@"theSecurity: %@", theSecurity);
        
        stockTickerLabel.text = [stockTickers objectAtIndex:indexPath.row];
        if ([theSecurity valueForKeyPath:@"last"]) {
            stockValue.text = [theSecurity valueForKeyPath:@"last"];
        }
        NSString *theStockChange = [theSecurity valueForKey:@"change"];
        stockHigh.text = [theSecurity valueForKey:@"high"];
        stockLow.text = [theSecurity valueForKey:@"low"];
        stockDateTime.text = [theSecurity valueForKey:@"lasttradedatetime"];
        
        theStockChange = [theStockChange stringByAppendingString:@" ("];
        if ([theSecurity valueForKeyPath:@"changepercent"]) {
            theStockChange = [theStockChange stringByAppendingString:[theSecurity valueForKeyPath:@"changepercent"]];
        }
        stockChange.text = [theStockChange stringByAppendingString:@"%)"];
        
        if ([[theSecurity valueForKeyPath:@"change"] doubleValue] > [[NSNumber numberWithInt:0] doubleValue]) {
            stockArrowImageView.image = [UIImage imageNamed:@"Green Arrow.png"];
            
            //[cell setBackgroundColor:[UIColor colorWithRed:.71 green:1 blue:.71 alpha:1]];
        }
        else
        {
            stockArrowImageView.image = [UIImage imageNamed:@"Red Arrow.png"];
            
            //[cell setBackgroundColor:[UIColor colorWithRed:1 green:.71 blue:.71 alpha:1]];
        }
        

    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath = %lu", (long)indexPath.row);
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
}


- (IBAction)searchAction:(id)sender
{
    NSLog(@"------- Search Action --------");
    NSString *inputVal = [searchField text];
    NSLog(@"inputVal: %@", inputVal);
    searchField.text = @"";
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithObjects:inputVal, nil];
    [newArray addObjectsFromArray:stockTickers];
    stockTickers = newArray;
    [theTableView reloadData];
}


@end
