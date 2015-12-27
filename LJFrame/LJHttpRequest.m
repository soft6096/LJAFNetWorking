//
//  BaseRequest.m
//  base
//
//  Created by 宇宙神帝 on 15/8/15.
//  Copyright (c) 2015年 kakalee. All rights reserved.
//

#import "LJHttpRequest.h"
#import "AFURLResponseSerialization.h"

@implementation LJHttpRequest

/**
 *  初始化实例，默认为RequestMethodGet请求
 *
 *  @return self
 */
- (instancetype)init {
    self = [super init];
    if (self) {
        _method = RequestMethodGet;
    }
    return self;
}


/**
 *  设置请求的manager
 *
 *  @param manager AFHTTPRequestOperationManager
 *
 *  @return LJHttpRequest
 */
-(LJHttpRequest*)setManager:(AFHTTPRequestOperationManager *)manager {
    _manager = manager;
    return self;
}

/**
 *  设置请求的url地址
 *
 *  @param url
 *
 *  @return self
 */
-(LJHttpRequest*)setUrl:(NSString *)url {
    _url = url;
    return self;
}

/**
 *  设置请求的参数
 *
 *  @param name
 *  @param value
 *
 *  @return self
 */
-(LJHttpRequest*)addParam:(NSString *)name value:(NSString *)value {
    if(_params == nil) {
        _params = [[NSMutableDictionary alloc]init];
    }
    _params[name] = value;
    return self;
}

/**
 *  设置请求的参数
 *
 *  @param params
 *
 *  @return self
 */
-(LJHttpRequest*)addParams:(NSDictionary *)params {
    if(_params == nil) {
        _params = [[NSMutableDictionary alloc]initWithDictionary:params];
    }
    
    else {
        [_params setValuesForKeysWithDictionary:params];
    }
    return self;
}

/**
 *  设置请求为POST/GET
 *
 *  @param method
 *
 *  @return self
 */
-(LJHttpRequest*)setMethod:(RequestMethod)method {
    _method = method;
    return self;
}

/**
 *  设置请求成功的回调函数
 *
 *  @param success
 *
 *  @return self
 */
-(LJHttpRequest*)setSuccess:(SuccessBlock)success {
    _success = success;
    return self;
}

/**
 *  设置请求失败的回调函数
 *
 *  @param failure
 *
 *  @return self
 */
-(LJHttpRequest*)setFailure:(FailureBlock)failure {
    _failure = failure;
    return self;
}

/**
 *  设置请求成功和失败的回调函数
 *
 *  @param success
 *  @param failure
 *
 *  @return self
 */
-(LJHttpRequest*)setSuccess:(SuccessBlock)success setFailure:(FailureBlock)failure {
    _success = success;
    _failure = failure;
    return self;
}

-(LJHttpRequest*)appendPartWithFileURL:(NSURL *)fileURL name:(NSString *)name {
    if(_fileParams == nil) {
        _fileParams = [NSMutableDictionary new];
    }
    _fileParams[name] = fileURL;
    return self;
}

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
-(LJHttpRequest*)setUrl:(NSString *)url params:(NSDictionary *)params method:(RequestMethod)method success:(SuccessBlock)success failure:(FailureBlock)failure{
    
    [self setUrl:url];
    [self addParams:params];
    [self setMethod:method];
    
    _success = success;
    _failure = failure;
    
    return self;
}


/**
 *  执行http请求
 */
-(void)execute {
    if(_method == RequestMethodGet) {
        [_manager GET:_url parameters:_params success:^(AFHTTPRequestOperation *operation, id responseObject){
            if(_success) {
                _success(responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
            if(_failure) {
                _failure(error);
            }
        }];
    }
    
    else if(_method == RequestMethodPost && _fileParams.count == 0) {
        [_manager POST:_url parameters:_params success:^(AFHTTPRequestOperation *operation, id responseObject){
            if(_success) {
                _success(responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
            if(_failure) {
                _failure(error);
            }
        }];
    }
    
    else if(_fileParams.count > 0) {
        [_manager POST:_url parameters:_params constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
            for (NSString *name in _fileParams.keyEnumerator) {
                [formData appendPartWithFileURL:_fileParams[name] name: name error:nil];
            }
        } success:^(AFHTTPRequestOperation *operation, id responseObject){
            if(_success) {
                _success(responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
            if(_failure) {
                _failure(error);
            }
        }];
    }
}
@end
