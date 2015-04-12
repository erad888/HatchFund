#import <Foundation/Foundation.h>
#import "SWGObject.h"


@interface SWGTransactions_post : SWGObject

@property(nonatomic) NSString* transactiontype;  /* Type of transaction, cash or rewards  */
@property(nonatomic) NSString* payeeid;  /* id of payee account  */
@property(nonatomic) NSNumber* paymentamount;  /* Transaction amount  */
- (id) transactiontype: (NSString*) transactiontype     
    payeeid: (NSString*) payeeid     
    paymentamount: (NSNumber*) paymentamount;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
