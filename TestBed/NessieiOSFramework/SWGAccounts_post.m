#import "SWGDate.h"
#import "SWGAccounts_post.h"

@implementation SWGAccounts_post

-(id)type: (NSString*) type
    nickname: (NSString*) nickname
    rewards: (NSNumber*) rewards
    balance: (NSNumber*) balance
    
{
    _type = type;
    _nickname = nickname;
    _rewards = rewards;
    _balance = balance;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        _type = dict[@"type"];
        
        _nickname = dict[@"nickname"];
        
        _rewards = dict[@"rewards"];
        
        _balance = dict[@"balance"];
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(_type != nil) dict[@"type"] = _type ;
        
    
    
            if(_nickname != nil) dict[@"nickname"] = _nickname ;
        
    
    
            if(_rewards != nil) dict[@"rewards"] = _rewards ;
        
    
    
            if(_balance != nil) dict[@"balance"] = _balance ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
