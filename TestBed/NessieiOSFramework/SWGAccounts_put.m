#import "SWGDate.h"
#import "SWGAccounts_put.h"

@implementation SWGAccounts_put

-(id)nickname: (NSString*) nickname
    
{
    _nickname = nickname;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        _nickname = dict[@"nickname"];
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(_nickname != nil) dict[@"nickname"] = _nickname ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
