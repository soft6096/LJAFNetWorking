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

/**
 *  设置请求的manager
 *
 *  @param manager AFHTTPRequestOperationManager
 *
 *  @return LJHttpRequest
 */
-(LJHttpRequest*)setManager:(AFHTTPRequestOperationManager *)manager;

/**
 *  设置请求的url地址
 *
 *  @param url
 *
 *  @return self
 */
-(LJHttpRequest*)setUrl:(NSString *)url;

/**
 *  设置请求的参数
 *
 *  @param name
 *  @param value
 *
 *  @return self
 */
-(LJHttpRequest*)addParam:(NSString*)name value:(NSString*)value;

/**
 *  设置请求的参数
 *
 *  @param params
 *
 *  @return self
 */
-(LJHttpRequest*)addParams:(NSDictionary *)params;

/**
 *  设置请求为POST/GET
 *
 *  @param method
 *
 *  @return self
 */
-(LJHttpRequest*)setMethod:(RequestMethod)method;

/**
 *  设置请求成功的回调函数
 *
 *  @param success
 *
 *  @return self
 */
-(LJHttpRequest*)setSuccess:(SuccessBlock)success;

/**
 *  设置请求失败的回调函数
 *
 *  @param failure
 *
 *  @return self
 */
-(LJHttpRequest*)setFailure:(FailureBlock)failure;

/**
 *  设置请求成功和失败的回调函数
 *
 *  @param success
 *  @param failure
 *
 *  @return self
 */
-(LJHttpRequest*)setSuccess:(SuccessBlock)success setFailure:(FailureBlock)failure;

-(LJHttpRequest*)appendPartWithFileURL:(NSURL *)fileURL name:(NSString *)name;

/**
 *  设置http请求的如下参数
 *
 *  @param url
 *  @param params
 *  @param method
 *  @param success
 *  @param failure
 *
 *  @return self
 */
-(LJHttpRequest*)setUrl:(NSString *)url params:(NSDictionary *)params method:(RequestMethod)method success:(SuccessBlock)success failure:(FailureBlock)failure;

/**
 *  执行http请求
 */
-(void)execute;
@end
