//
//  BaseRequest.h
//  base
//
//  Created by kakalee on 15/8/15.
//  Copyright (c) 2015年 kakalee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

typedef enum : NSUInteger {
    RequestMethodGet,
    RequestMethodPost
} RequestMethod;

typedef void (^SuccessBlock)(id);
typedef void (^FailureBlock)(NSError *);

@interface HttpRequest : NSObject {
    AFHTTPRequestOperationManager *_manager;
    
    NSString *_url;
    
    NSMutableDictionary *_params;
    
    RequestMethod _method;
    
    SuccessBlock _success;
    
    FailureBlock _failure;
    
    NSMutableDictionary *_fileParams;
}

-(HttpRequest*)setManager:(AFHTTPRequestOperationManager *)manager;

-(HttpRequest*)setUrl:(NSString *)url;

-(HttpRequest*)addParam:(NSString*)name value:(NSString*)value;

-(HttpRequest*)setMethod:(RequestMethod)method;

-(HttpRequest*)setSuccess:(SuccessBlock)success;

-(HttpRequest*)setFailure:(FailureBlock)failure;

-(HttpRequest*)appendPartWithFileURL:(NSURL *)fileURL name:(NSString *)name;

-(void)execute;
@end
