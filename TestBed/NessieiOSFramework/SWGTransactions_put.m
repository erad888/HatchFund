#import "SWGDate.h"
#import "SWGTransactions_put.h"

@implementation SWGTransactions_put

-(id)transactiontype: (NSString*) transactiontype
    payeeid: (NSString*) payeeid
    paymentamount: (NSNumber*) paymentamount
    
{
    _transactiontype = transactiontype;
    _payeeid = payeeid;
    _paymentamount = paymentamount;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        _transactiontype = dict[@"transaction type"];
        
        _payeeid = dict[@"payee id"];
        
        _paymentamount = dict[@"amount"];
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(_transactiontype != nil) dict[@"transaction type"] = _transactiontype ;
        
    
    
            if(_payeeid != nil) dict[@"payee id"] = _payeeid ;
        
    
    
            if(_paymentamount != nil) dict[@"amount"] = _paymentamount ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
