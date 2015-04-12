#import "SWGDate.h"
#import "SWGAtms.h"

@implementation SWGAtms

-(id)name: (NSString*) name
    address: (SWGAddress*) address
    languagelist: (NSArray*) languagelist
    hours: (NSArray*) hours
    accessibility: (NSNumber*) accessibility
    amountleft: (NSNumber*) amountleft
    
{
    _name = name;
    _address = address;
    _languagelist = languagelist;
    _hours = hours;
    _accessibility = accessibility;
    _amountleft = amountleft;
    

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
        
        
        _languagelist = dict[@"language_list"];
        if (_languagelist == nil) {
            _languagelist = dict[@"language list"];
        }
        
        _hours = dict[@"hours"];
        
        _accessibility = dict[@"accessibility"];
        
        _amountleft = dict[@"amount_left"];
        if (_amountleft == nil) {
            _amountleft = dict[@"amount left"];
        }
        
        
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
    
    
    
            if(_languagelist != nil) dict[@"language_list"] = _languagelist ;
        
    
    
            if(_hours != nil) dict[@"hours"] = _hours ;
        
    
    
            if(_accessibility != nil) dict[@"accessibility"] = _accessibility ;
        
    
    
            if(_amountleft != nil) dict[@"amount_left"] = _amountleft ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
