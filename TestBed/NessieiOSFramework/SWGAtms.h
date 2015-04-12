#import <Foundation/Foundation.h>
#import "SWGObject.h"
#import "SWGAddress.h"


@interface SWGAtms : SWGObject

@property(nonatomic) NSString* name;  /* Unique nickname associated with atm  */
@property(nonatomic) SWGAddress* address;  /* Address where atm is located  */
@property(nonatomic) NSArray* languagelist;  /* Supported languages on atm  */
@property(nonatomic) NSArray* hours;  /* Hours of Operation of atm  */
@property(nonatomic) NSNumber* accessibility;  /* Indicates if accessibility is supported on atm e.g. physical accessibility  */
@property(nonatomic) NSNumber* amountleft;  /* Amount of money left in atm  */
- (id) name: (NSString*) name     
    address: (SWGAddress*) address     
    languagelist: (NSArray*) languagelist     
    hours: (NSArray*) hours     
    accessibility: (NSNumber*) accessibility     
    amountleft: (NSNumber*) amountleft;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
