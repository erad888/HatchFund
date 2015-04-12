#import <Foundation/Foundation.h>
#import "SWGBranches.h"
#import "SWGObject.h"


@interface SWGBranchesApi: NSObject

@property (nonatomic, retain) NSString *userKey;

-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGBranchesApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(void) setBasePath:(NSString*)basePath;
+(NSString*) getBasePath;
/**

 Find all branches
 
 Returns all branches
 

 

 return type: NSArray*
 */
-(NSNumber*) getBranchesWithCompletionBlock :
    (void (^)(NSArray* output, NSError* error))completionBlock;
    


/**

 Find branch by ID
 
 Returns a branch based on ID
 

 
 @param _id ID of branch that needs to be fetched (example: 546cd56d04783a02616859c9)
 

 return type: SWGBranches*
 */
-(NSNumber*) getBranchByIdWithCompletionBlock :(NSString*) _id 
    
    completionHandler: (void (^)(SWGBranches* output, NSError* error))completionBlock;
    



@end