#import "SWGDate.h"
#import "SWGCustomers.h"

@implementation SWGCustomers

-(id)_id: (NSString*) _id
    firstname: (NSString*) firstname
    lastname: (NSString*) lastname
    address: (SWGAddress*) address
    accountids: (NSArray*) accountids
    
{
    __id = _id;
    _firstname = firstname;
    _lastname = lastname;
    _address = address;
    _accountids = accountids;
    

    return self;
}

-(id) initWithValues:(NSDictionary*)dict
{
    self = [super init];
    if(self) {
        __id = dict[@"_id"];
        
        _firstname = dict[@"first_name"];
        if (_firstname == nil) {
            _firstname = dict[@"first name"];
        }
        
        _lastname = dict[@"last_name"];
        if (_lastname == nil) {
            _lastname = dict[@"last name"];
        }
        
        
        id address_dict = dict[@"address"];
        
        if(address_dict != nil)
            _address = [[SWGAddress  alloc]initWithValues:address_dict];
        
        
        _accountids = dict[@"account_ids"];
        if (_accountids == nil) {
            _accountids = dict[@"accounts"];
        }
        
        
        
    }
    return self;
}

-(NSDictionary*) asDictionary {
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    
            if(__id != nil) dict[@"_id"] = __id ;
        
    
    
            if(_firstname != nil) dict[@"first_name"] = _firstname ;
        
    
    
            if(_lastname != nil) dict[@"last_name"] = _lastname ;
        
    
    
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
    
    
    
            if(_accountids != nil) dict[@"account_ids"] = _accountids ;
        
    

    NSDictionary* output = [dict copy];
    return output;
}

@end
