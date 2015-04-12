#import <Foundation/Foundation.h>
#import "SWGObject.h"
#import "SWGAddress.h"


@interface SWGBranches : SWGObject

@property(nonatomic) NSString* name;  /* Unique name associated with branch  */
@property(nonatomic) SWGAddress* address;  /* Address where branch is located  */
@property(nonatomic) NSString* phonenumber;  /* Phone number of the branch  */
@property(nonatomic) NSArray* hours;  /* Hours of Operation of branch  */
- (id) name: (NSString*) name     
    address: (SWGAddress*) address     
    phonenumber: (NSString*) phonenumber     
    hours: (NSArray*) hours;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
