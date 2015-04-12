#import "SWGBranchesApi.h"
#import "SWGFile.h"
#import "SWGApiClient.h"
#import "SWGBranches.h"



@implementation SWGBranchesApi
static NSString * basePath = @"http://api.reimaginebanking.com";
@synthesize userKey;

+(SWGBranchesApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {
    static SWGBranchesApi* singletonAPI = nil;

    if (singletonAPI == nil) {
        singletonAPI = [[SWGBranchesApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(void) setBasePath:(NSString*)path {
    basePath = path;
}

+(NSString*) getBasePath {
    return basePath;
}

-(SWGApiClient*) apiClient {
    return [SWGApiClient sharedClientFromPool:basePath];
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [[self apiClient] setHeaderValue:value forKey:key];
}

-(id) init {
    self = [super init];
    [self apiClient];
    return self;
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [[self apiClient] setHeaderValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [SWGApiClient requestQueueSize];
}


-(NSNumber*) getBranchesWithCompletionBlock: 
        (void (^)(NSArray* output, NSError* error))completionBlock
         {

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/branches", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];
             

    NSString* requestContentType = @"application/json";
    NSString* responseContentType = @"application/json";

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    [queryParams setValue:userKey forKey:@"key"];

    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    

    id bodyDictionary = nil;
    
    
    bodyDictionary = [[NSMutableArray alloc] init];

    NSMutableDictionary * formParams = [[NSMutableDictionary alloc]init]; 

    
    [bodyDictionary addObject:formParams];
    

    

    SWGApiClient* client = [SWGApiClient sharedClientFromPool:basePath];

        // array container response type
    return [client dictionary: requestUrl 
                       method: @"GET" 
                  queryParams: queryParams 
                         body: bodyDictionary 
                 headerParams: headerParams
           requestContentType: requestContentType
          responseContentType: responseContentType
              completionBlock: ^(NSDictionary *data, NSError *error) {
                  if (error) {
                      completionBlock(nil, error);
                      
                      return;
                  }
                  
                  NSArray *result = nil;
                  result = [[NSArray alloc] init];
                  NSArray *array = ((NSArray *)data);
                  if (data) {
                      result = array;
                  }
                  
                  NSMutableArray *castedArray = [[NSMutableArray alloc] init];
                  for (NSDictionary *branch in result) {
                      [castedArray addObject:[[SWGBranches alloc] initWithValues:branch]];
                  }
                  
                  completionBlock(castedArray , nil);
                  
            }];
    
    
}

-(NSNumber*) getBranchByIdWithCompletionBlock: (NSString*) _id
        
        completionHandler: (void (^)(SWGBranches* output, NSError* error))completionBlock
         {

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/branches/{id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"id", @"}"]] withString: [SWGApiClient escape:_id]];
    

    NSString* requestContentType = @"application/json";
    NSString* responseContentType = @"application/json";

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    [queryParams setValue:userKey forKey:@"key"];
    NSMutableDictionary* headerParams = [[NSMutableDictionary alloc] init];
    

    id bodyDictionary = nil;
    
    
    bodyDictionary = [[NSMutableArray alloc] init];

    NSMutableDictionary * formParams = [[NSMutableDictionary alloc]init]; 

    
    [bodyDictionary addObject:formParams];
    

    

    SWGApiClient* client = [SWGApiClient sharedClientFromPool:basePath];

    
    
    
        
    // comples response type
    return [client dictionary: requestUrl 
                       method: @"GET" 
                  queryParams: queryParams 
                         body: bodyDictionary 
                 headerParams: headerParams
           requestContentType: requestContentType
          responseContentType: responseContentType
              completionBlock: ^(NSDictionary *data, NSError *error) {
                if (error) {
                    completionBlock(nil, error);
                    
                    return;
                }
                
                SWGBranches *result = nil;
                if (data) {
                    result = [[SWGBranches    alloc]initWithValues: data];
                }
                completionBlock(result , nil);
                
              }];
    
    
}



@end