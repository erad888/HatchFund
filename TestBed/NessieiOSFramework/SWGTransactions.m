#import "SWGDate.h"
#import "SWGTransactions.h"

@implementation SWGTransactions

-(id)_id: (NSString*) _id
    status: (NSString*) status
    transactiontype: (NSString*) transactiontype
    payerid: (NSString*) payerid
    payeeid: (NSString*) payeeid
    paymentamount: (NSNumber*) paymentamount
    
{
    __id = _id;
    _status = status;
    _transactiontype = transactiontype;
    _payerid = payerid;
    _payeeid = payeeid;
    _paymentamount = paymentamount;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        __id = dict[@"_id"];
        
        _status = dict[@"status"];
        
        _transactiontype = dict[@"transaction type"];
        
        _payerid = dict[@"payer id"];
        
        _payeeid = dict[@"payee id"];
        
        _paymentamount = dict[@"amount"];
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(__id != nil) dict[@"_id"] = __id ;
        
    
    
            if(_status != nil) dict[@"status"] = _status ;
        
    
    
            if(_transactiontype != nil) dict[@"transaction type"] = _transactiontype ;
        
    
    
            if(_payerid != nil) dict[@"payer id"] = _payerid ;
        
    
    
            if(_payeeid != nil) dict[@"payee id"] = _payeeid ;
        
    
    
            if(_paymentamount != nil) dict[@"amount"] = _paymentamount ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
