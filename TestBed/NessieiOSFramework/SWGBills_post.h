#import <Foundation/Foundation.h>
#import "SWGObject.h"
#import "SWGDate.h"


@interface SWGBills_post : SWGObject

@property(nonatomic) NSString* status;  /* Status of the bill e.g. completed, recurring, etc  */
@property(nonatomic) SWGDate* paymentdate;  /* Date when bill is going to be paid or was paid  */
@property(nonatomic) NSNumber* recurringdate;  /* Date of month bill will recur, e.g. 15th of every month  */
@property(nonatomic) NSNumber* paymentamount;  /* Bill amount  */
- (id) status: (NSString*) status     
    paymentdate: (SWGDate*) paymentdate     
    recurringdate: (NSNumber*) recurringdate     
    paymentamount: (NSNumber*) paymentamount;
    

- (id) initWithValues: (NSDictionary*)dict;
- (NSDictionary*) asDictionary;

@end
