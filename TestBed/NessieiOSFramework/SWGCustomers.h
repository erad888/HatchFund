#import <Foundation/Foundation.h>
#import "SWGObject.h"
#import "SWGAddress.h"


@interface SWGCustomers : SWGObject

@property(nonatomic) NSString* _id;  /* Customer unique identifier  */
@property(nonatomic) NSString* firstname;  /* First name of customer  */
@property(nonatomic) NSString* lastname;  /* Last name of customer  */
@property(nonatomic) SWGAddress* address;  /* Address associated with customer  */
@property(nonatomic) NSArray* accountids;  /* Account(s) associated with customer, represented by their ids  */
- (id) _id: (NSString*) _id     
    firstname: (NSString*) firstname     
    lastname: (NSString*) lastname     
    address: (SWGAddress*) address     
    accountids: (NSArray*) accountids;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
