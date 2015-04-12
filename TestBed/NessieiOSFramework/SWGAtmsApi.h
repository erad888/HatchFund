#import <Foundation/Foundation.h>
#import "SWGAtms.h"
#import "SWGObject.h"


@interface SWGAtmsApi: NSObject

@property (nonatomic, retain) NSString *userKey;

-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGAtmsApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(void) setBasePath:(NSString*)basePath;
+(NSString*) getBasePath;
/**

 Find all atms
 
 Returns all atms
 

 

 return type: SWGAtms*
 */
-(NSNumber*) getAtmsWithCompletionBlock :
    (void (^)(NSArray* output, NSError* error))completionBlock;
    


/**

 Find atm by ID
 
 Returns an atm based on ID
 

 
 @param _id ID of atm that needs to be fetched (example: 546cd56d04783a02616859c9)
 

 return type: SWGAtms*
 */
-(NSNumber*) getAtmByIdWithCompletionBlock :(NSString*) _id 
    
    completionHandler: (void (^)(SWGAtms* output, NSError* error))completionBlock;
    



@end