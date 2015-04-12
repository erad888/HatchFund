#import "SWGDate.h"
#import "SWGAddress.h"

@implementation SWGAddress

-(id)streetnumber: (NSString*) streetnumber
    streetname: (NSString*) streetname
    city: (NSString*) city
    state: (NSString*) state
    zip: (NSString*) zip
    
{
    _streetnumber = streetnumber;
    _streetname = streetname;
    _city = city;
    _state = state;
    _zip = zip;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        _streetnumber = dict[@"street_number"];
        if (_streetnumber == nil) {
            _streetnumber = dict[@"street number"];
        }
        
        _streetname = dict[@"street_name"];
        if (_streetname == nil) {
            _streetname = dict[@"street name"];
        }
        _city = dict[@"city"];
        
        _state = dict[@"state"];
        
        _zip = dict[@"zip"];
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(_streetnumber != nil) dict[@"street_number"] = _streetnumber ;
        
    
    
            if(_streetname != nil) dict[@"street_name"] = _streetname ;
        
    
    
            if(_city != nil) dict[@"city"] = _city ;
        
    
    
            if(_state != nil) dict[@"state"] = _state ;
        
    
    
            if(_zip != nil) dict[@"zip"] = _zip ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
