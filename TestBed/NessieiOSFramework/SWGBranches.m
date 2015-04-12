#import "SWGDate.h"
#import "SWGBranches.h"

@implementation SWGBranches

-(id)name: (NSString*) name
    address: (SWGAddress*) address
    phonenumber: (NSString*) phonenumber
    hours: (NSArray*) hours
    
{
    _name = name;
    _address = address;
    _phonenumber = phonenumber;
    _hours = hours;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        _name = dict[@"name"];
        
        
        
        id address_dict = dict[@"address"];
        
        if(address_dict != nil)
            _address = [[SWGAddress  alloc]initWithValues:address_dict];
        
        
        _phonenumber = dict[@"phone_number"];
        if (_phonenumber == nil) {
            _phonenumber = dict[@"phone number"];
        }
        _hours = dict[@"hours"];
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(_name != nil) dict[@"name"] = _name ;
        
    
    
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
    
    
    
            if(_phonenumber != nil) dict[@"phone_number"] = _phonenumber ;
        
    
    
            if(_hours != nil) dict[@"hours"] = _hours ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
