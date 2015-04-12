#import "SWGDate.h"
#import "SWGBills.h"

@implementation SWGBills

-(id)_id: (NSString*) _id
    status: (NSString*) status
    creationdate: (SWGDate*) creationdate
    paymentdate: (SWGDate*) paymentdate
    recurringdate: (NSNumber*) recurringdate
    upcomingpaymentdate: (SWGDate*) upcomingpaymentdate
    paymentamount: (NSNumber*) paymentamount
    
{
    __id = _id;
    _status = status;
    _creationdate = creationdate;
    _paymentdate = paymentdate;
    _recurringdate = recurringdate;
    _upcomingpaymentdate = upcomingpaymentdate;
    _paymentamount = paymentamount;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        __id = dict[@"_id"];
        
        _status = dict[@"status"];
        
        
        
        id creationdate_dict = dict[@"creation_date"];
        if (creationdate_dict == nil) {
            creationdate_dict = dict[@"creation date"];
        }
        if(creationdate_dict != nil)
            _creationdate = [[SWGDate  alloc]initWithValues:creationdate_dict];
        
        
        id paymentdate_dict = dict[@"payment_date"];
        
        if (paymentdate_dict == nil) {
            paymentdate_dict = dict[@"payment date"];
        }
        
        if(paymentdate_dict != nil)
            _paymentdate = [[SWGDate  alloc]initWithValues:paymentdate_dict];
        
        
        _recurringdate = dict[@"recurring_date"];
        if (_recurringdate == nil) {
            _recurringdate = dict[@"recurring date"];
        }
        
        
        id upcomingpaymentdate_dict = dict[@"upcoming_payment_date"];
        if (upcomingpaymentdate_dict == nil) {
            upcomingpaymentdate_dict = dict[@"upcoming payment date"];
        }
        
        if(upcomingpaymentdate_dict != nil)
            _upcomingpaymentdate = [[SWGDate  alloc]initWithValues:upcomingpaymentdate_dict];
        
        
        _paymentamount = dict[@"payment_amount"];
        
        if (_paymentamount == nil) {
            _paymentamount = dict[@"payment amount"];
        }
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(__id != nil) dict[@"_id"] = __id ;
        
    
    
            if(_status != nil) dict[@"status"] = _status ;
        
    
    
    if(_creationdate != nil){
        if([_creationdate isKindOfClass:[NSArray class]]){
            NSMutableArray * array = [[NSMutableArray alloc] init];
            for( SWGDate *creationdate in (NSArray*)_creationdate) {
                [array addObject:[(SWGObject*)creationdate asDictionary]];
            }
            dict[@"creation_date"] = array;
        }
        else if(_creationdate && [_creationdate isKindOfClass:[SWGDate class]]) {
            NSString * dateString = [(SWGDate*)_creationdate toString];
            if(dateString){
                dict[@"creation_date"] = dateString;
            }
        }
        else {
        
            if(_creationdate != nil) dict[@"creation_date"] = [(SWGObject*)_creationdate asDictionary];
        
        }
    }
    
    
    
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
        
    
    
    if(_upcomingpaymentdate != nil){
        if([_upcomingpaymentdate isKindOfClass:[NSArray class]]){
            NSMutableArray * array = [[NSMutableArray alloc] init];
            for( SWGDate *upcomingpaymentdate in (NSArray*)_upcomingpaymentdate) {
                [array addObject:[(SWGObject*)upcomingpaymentdate asDictionary]];
            }
            dict[@"upcoming_payment_date"] = array;
        }
        else if(_upcomingpaymentdate && [_upcomingpaymentdate isKindOfClass:[SWGDate class]]) {
            NSString * dateString = [(SWGDate*)_upcomingpaymentdate toString];
            if(dateString){
                dict[@"upcoming_payment_date"] = dateString;
            }
        }
        else {
        
            if(_upcomingpaymentdate != nil) dict[@"upcoming_payment_date"] = [(SWGObject*)_upcomingpaymentdate asDictionary];
        
        }
    }
    
    
    
            if(_paymentamount != nil) dict[@"payment_amount"] = _paymentamount ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
