#import "SWGDate.h"
#import "SWGBills_post.h"

@implementation SWGBills_post

-(id)status: (NSString*) status
    paymentdate: (SWGDate*) paymentdate
    recurringdate: (NSNumber*) recurringdate
    paymentamount: (NSNumber*) paymentamount
    
{
    _status = status;
    _paymentdate = paymentdate;
    _recurringdate = recurringdate;
    _paymentamount = paymentamount;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        _status = dict[@"status"];
        
        
        
        id paymentdate_dict = dict[@"payment_date"];
        
        if(paymentdate_dict != nil)
            _paymentdate = [[SWGDate  alloc]initWithValues:paymentdate_dict];
        
        
        _recurringdate = dict[@"recurring_date"];
        
        _paymentamount = dict[@"payment_amount"];
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(_status != nil) dict[@"status"] = _status ;
        
    
    
    if(_paymentdate != nil){
        if([_paymentdate isKindOfClass:[NSArray class]]){
            NSMutableArray * array = [[NSMutableArray alloc] init];
            for( SWGDate *paymentdate in (NSArray*)_paymentdate) {
                [array addObject:[(SWGObject*)paymentdate asDictionary]];
            }
            dict[@"payment_date"] = array;
        }
        else if(_paymentdate && [_paymentdate isKindOfClass:[SWGDate class]]) {
            NSString * dateString = [(SWGDate*)_paymentdate toString];
            if(dateString){
                dict[@"payment_date"] = dateString;
            }
        }
        else {
        
            if(_paymentdate != nil) dict[@"payment_date"] = [(SWGObject*)_paymentdate asDictionary];
        
        }
    }
    
    
    
            if(_recurringdate != nil) dict[@"recurring_date"] = _recurringdate ;
        
    
    
            if(_paymentamount != nil) dict[@"payment_amount"] = _paymentamount ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
