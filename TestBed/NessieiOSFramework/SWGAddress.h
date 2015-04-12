#import <Foundation/Foundation.h>
#import "SWGObject.h"


@interface SWGAddress : SWGObject

@property(nonatomic) NSString* streetnumber;  /* Street number of address  */
@property(nonatomic) NSString* streetname;  /* Street name of address  */
@property(nonatomic) NSString* city;  /* City name of address  */
@property(nonatomic) NSString* state;  /* Two letter abbreviated state of address  */
@property(nonatomic) NSString* zip;  /* Five digit zip code of address  */
- (id) streetnumber: (NSString*) streetnumber     
    streetname: (NSString*) streetname     
    city: (NSString*) city     
    state: (NSString*) state     
    zip: (NSString*) zip;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
