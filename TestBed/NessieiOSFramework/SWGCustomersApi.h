#import <Foundation/Foundation.h>
#import "SWGCustomers.h"
#import "SWGVoid.h"
#import "SWGCustomers_put.h"
#import "SWGAccounts_post.h"
#import "SWGBills.h"
#import "SWGAccounts.h"
#import "SWGObject.h"


@interface SWGCustomersApi: NSObject
@property (nonatomic, retain) NSString *userKey;

-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGCustomersApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(void) setBasePath:(NSString*)basePath;
+(NSString*) getBasePath;
/**

 Find all customers
 
 Returns all customers
 

 

 return type: SWGCustomers*
 */
-(NSNumber*) getCustomersWithCompletionBlock :
    (void (^)(NSArray* output, NSError* error))completionBlock;
    


/**

 Updates customer information
 
 Updates customer information
 

 
 @param customerId ID of customer to update information for for (example: 546cd56d04783a02616859c9)
 
 @param body Customer Details
 

 return type: SWGVoid*
 */
-(NSNumber*) addCustomerWithCompletionBlock :(NSString*) customerId 
     body:(SWGCustomers_put*) body 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Create a new account
 
 Adds account to the database
 

 
 @param customerId ID of customer that needs to be updated (example: 546cd56d04783a02616859c9)
 
 @param body Account details
 

 return type: SWGVoid*
 */
-(NSNumber*) addAccountWithCompletionBlock :(NSString*) customerId 
     body:(SWGAccounts_post*) body 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Find bill for a customerId
 
 Returns customer's bills based on the customer's ID
 

 
 @param customerId ID of customer to fetch bills for (example: 546cd56d04783a02616859c9)
 

 return type: SWGBills*
 */
-(NSNumber*) getBillonCustomerIdWithCompletionBlock :(NSString*) customerId 
    
    completionHandler: (void (^)(NSArray* output, NSError* error))completionBlock;
    


/**

 Find bill for a customerId and billId
 
 Returns bill based on the customerId and billId
 

 
 @param customerId ID of customer to fetch bills for (example: 546cd56d04783a02616859c9)
 
 @param billId ID of bill to fetch bill for (example: 546cd56d04783a02616859c9)
 

 return type: SWGBills*
 */
-(NSNumber*) getBillonBillIdWithCompletionBlock :(NSString*) customerId 
     billId:(NSString*) billId 
    
    completionHandler: (void (^)(SWGBills* output, NSError* error))completionBlock;
    


/**

 Find customer by ID
 
 Returns a customer based on ID
 

 
 @param _id ID of customer that needs to be fetched (example: 546cd56d04783a02616859c9)
 

 return type: SWGCustomers*
 */
-(NSNumber*) getCustomerByIdWithCompletionBlock :(NSString*) _id 
    
    completionHandler: (void (^)(SWGCustomers* output, NSError* error))completionBlock;
    


/**

 Find accounts for a customer
 
 Returns a customer's accounts based on the customer's ID
 

 
 @param _id ID of customer to fetch accounts for (example: 546cd56d04783a02616859c9)
 

 return type: SWGAccounts*
 */
-(NSNumber*) getAccountsByCustomerIdWithCompletionBlock :(NSString*) _id 
    
    completionHandler: (void (^)(NSArray* output, NSError* error))completionBlock;
    



@end