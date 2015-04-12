#import <Foundation/Foundation.h>
#import "SWGObject.h"


@interface SWGAccounts_put : SWGObject

@property(nonatomic) NSString* nickname;  /* Nickname associated with account  */
- (id) nickname: (NSString*) nickname;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
