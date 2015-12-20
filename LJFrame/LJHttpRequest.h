//
//  BaseRequest.h
//  base
//
//  Created by 宇宙神帝 on 15/8/15.
//  Copyright (c) 2015年 kakalee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

typedef enum : NSUInteger {
    RequestMethodGet,
    RequestMethodPost
} RequestMethod;

/**
 *  请求成功的回调方法
 *
 *  @param id N/A
 */
typedef void (^SuccessBlock)(id);

/**
 *  请求失败的回调方法
 *
 *  @param id N/A
 */
typedef void (^FailureBlock)(NSError *);

@interface LJHttpRequest : NSObject {
    AFHTTPRequestOperationManager *_manager;
    
    NSString *_url;
    
    NSMutableDictionary *_params;
    
    RequestMethod _method;
    
    SuccessBlock _success;
    
    FailureBlock _failure;
    
    NSMutableDictionary *_fileParams;
}

-(LJHttpRequest*)setManager:(AFHTTPRequestOperationManager *)manager;

-(LJHttpRequest*)setUrl:(NSString *)url;

-(LJHttpRequest*)addParam:(NSString*)name value:(NSString*)value;

-(LJHttpRequest*)addParams:(NSDictionary *)params;

-(LJHttpRequest*)setMethod:(RequestMethod)method;

-(LJHttpRequest*)setSuccess:(SuccessBlock)success;

-(LJHttpRequest*)setFailure:(FailureBlock)failure;

-(LJHttpRequest*)appendPartWithFileURL:(NSURL *)fileURL name:(NSString *)name;

-(void)execute;
@end
