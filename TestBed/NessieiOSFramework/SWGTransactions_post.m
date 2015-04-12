#import "SWGDate.h"
#import "SWGTransactions_post.h"

@implementation SWGTransactions_post

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
        _transactiontype = dict[@"transaction_type"];
        
        _payeeid = dict[@"payee_id"];
        
        _paymentamount = dict[@"amount"];
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(_transactiontype != nil) dict[@"transaction_type"] = _transactiontype ;
        
    
    
            if(_payeeid != nil) dict[@"payee_id"] = _payeeid ;
        
    
    
            if(_paymentamount != nil) dict[@"amount"] = _paymentamount ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
