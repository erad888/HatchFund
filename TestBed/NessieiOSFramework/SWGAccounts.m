#import "SWGDate.h"
#import "SWGAccounts.h"

@implementation SWGAccounts

-(id)_id: (NSString*) _id
    type: (NSString*) type
    nickname: (NSString*) nickname
    rewards: (NSNumber*) rewards
    balance: (NSNumber*) balance
    billids: (NSArray*) billids
    customerid: (NSString*) customerid
    
{
    __id = _id;
    _type = type;
    _nickname = nickname;
    _rewards = rewards;
    _balance = balance;
    _billids = billids;
    _customerid = customerid;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        __id = dict[@"_id"];
        
        _type = dict[@"type"];
        
        _nickname = dict[@"nickname"];
        
        _rewards = dict[@"rewards"];
        
        _balance = dict[@"balance"];
        
        _billids = dict[@"bill_ids"];
        if (_billids == nil) {
            _billids = dict[@"bill ids"];
        }
        
        _customerid = dict[@"customer_id"];
        if (_customerid == nil) {
            _customerid = dict[@"customer"];
        }
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(__id != nil) dict[@"_id"] = __id ;
        
    
    
            if(_type != nil) dict[@"type"] = _type ;
        
    
    
            if(_nickname != nil) dict[@"nickname"] = _nickname ;
        
    
    
            if(_rewards != nil) dict[@"rewards"] = _rewards ;
        
    
    
            if(_balance != nil) dict[@"balance"] = _balance ;
        
    
    
            if(_billids != nil) dict[@"bill_ids"] = _billids ;
        
    
    
            if(_customerid != nil) dict[@"customer_id"] = _customerid ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
