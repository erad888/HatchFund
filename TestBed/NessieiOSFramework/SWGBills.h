#import <Foundation/Foundation.h>
#import "SWGObject.h"
#import "SWGDate.h"


@interface SWGBills : SWGObject

@property(nonatomic) NSString* _id;  /* Bill unique identifier  */
@property(nonatomic) NSString* status;  /* Status of the bill e.g. completed, recurring, etc  */
@property(nonatomic) SWGDate* creationdate;  /* When the bill was created  */
@property(nonatomic) SWGDate* paymentdate;  /* Date when bill is going to be paid or was paid  */
@property(nonatomic) NSNumber* recurringdate;  /* Date of month bill will recur, e.g. 15th of every month  */
@property(nonatomic) SWGDate* upcomingpaymentdate;  /* Next bill payment date, calculated from recurring date  */
@property(nonatomic) NSNumber* paymentamount;  /* Bill amount  */
- (id) _id: (NSString*) _id     
    status: (NSString*) status     
    creationdate: (SWGDate*) creationdate     
    paymentdate: (SWGDate*) paymentdate     
    recurringdate: (NSNumber*) recurringdate     
    upcomingpaymentdate: (SWGDate*) upcomingpaymentdate     
    paymentamount: (NSNumber*) paymentamount;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
