#import "SWGDate.h"
#import "SWGCustomers_put.h"

@implementation SWGCustomers_put

-(id)address: (SWGAddress*) address
    
{
    _address = address;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        
        
        id address_dict = dict[@"address"];
        //terrible code D:
        if ([address_dict respondsToSelector:@selector(initWithValues:)]) {
            _address = address_dict;
        }
        else if(address_dict != nil)
            _address = [[SWGAddress  alloc]initWithValues:address_dict];
        
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
    if(_address != nil){
        if([_address isKindOfClass:[NSArray class]]){
            NSMutableArray * array = [[NSMutableArray alloc] init];
            for( SWGAddress *address in (NSArray*)_address) {
                [array addObject:[(SWGObject*)address asDictionary]];
            }
            dict[@"address"] = array;
        }
        else if(_address && [_address isKindOfClass:[SWGDate class]]) {
            NSString * dateString = [(SWGDate*)_address toString];
            if(dateString){
                dict[@"address"] = dateString;
            }
        }
        else {
        
            if(_address != nil) dict[@"address"] = [(SWGObject*)_address asDictionary];
        
        }
    }
    
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
