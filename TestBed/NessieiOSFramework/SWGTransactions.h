#import <Foundation/Foundation.h>
#import "SWGObject.h"


@interface SWGTransactions : SWGObject

@property(nonatomic) NSString* _id;  /* Transactions unique identifier  */
@property(nonatomic) NSString* status;  /* Status of transaction e.g. pending, completed, etc  */
@property(nonatomic) NSString* transactiontype;  /* Type of transaction, cash or rewards  */
@property(nonatomic) NSString* payerid;  /* id of payer account  */
@property(nonatomic) NSString* payeeid;  /* id of payee account  */
@property(nonatomic) NSNumber* paymentamount;  /* Transaction amount  */
- (id) _id: (NSString*) _id     
    status: (NSString*) status     
    transactiontype: (NSString*) transactiontype     
    payerid: (NSString*) payerid     
    payeeid: (NSString*) payeeid     
    paymentamount: (NSNumber*) paymentamount;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
