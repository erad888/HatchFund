#import <Foundation/Foundation.h>
#import "SWGObject.h"


@interface SWGAccounts : SWGObject

@property(nonatomic) NSString* _id;  /* Account unique identifier  */
@property(nonatomic) NSString* type;  /* Account type associated with account e.g. savings, checking, etc  */
@property(nonatomic) NSString* nickname;  /* Nickname associated with account  */
@property(nonatomic) NSNumber* rewards;  /* Reward points associated with account  */
@property(nonatomic) NSNumber* balance;  /* Account balance  */
@property(nonatomic) NSArray* billids;  /* Bill(s) associated with an account, represented by their ids  */
@property(nonatomic) NSString* customerid;  /* id of customer who owns the account  */
- (id) _id: (NSString*) _id     
    type: (NSString*) type     
    nickname: (NSString*) nickname     
    rewards: (NSNumber*) rewards     
    balance: (NSNumber*) balance     
    billids: (NSArray*) billids     
    customerid: (NSString*) customerid;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
