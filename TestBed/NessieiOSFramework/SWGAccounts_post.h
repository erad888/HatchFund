#import <Foundation/Foundation.h>
#import "SWGObject.h"


@interface SWGAccounts_post : SWGObject

@property(nonatomic) NSString* type;  /* Account type associated with account e.g. savings, checking, etc  */
@property(nonatomic) NSString* nickname;  /* Nickname associated with account  */
@property(nonatomic) NSNumber* rewards;  /* Reward points associated with account  */
@property(nonatomic) NSNumber* balance;  /* Initial account balance  */
- (id) type: (NSString*) type     
    nickname: (NSString*) nickname     
    rewards: (NSNumber*) rewards     
    balance: (NSNumber*) balance;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
