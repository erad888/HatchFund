#import <Foundation/Foundation.h>
#import "SWGObject.h"
#import "SWGAddress.h"


@interface SWGCustomers_put : SWGObject

@property(nonatomic) SWGAddress* address;  /* Address associated with customer  */
- (id) address: (SWGAddress*) address;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
