//
//  BaseRequest.m
//  base
//
//  Created by kakalee on 15/8/15.
//  Copyright (c) 2015年 kakalee. All rights reserved.
//

#import "HttpRequest.h"
#import "AFURLResponseSerialization.h"

@implementation HttpRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        _method = RequestMethodGet;
    }
    return self;
}

-(HttpRequest*)setManager:(AFHTTPRequestOperationManager *)manager {
    _manager = manager;
    return self;
}

-(HttpRequest*)setUrl:(NSString *)url {
    _url = url;
    return self;
}

-(HttpRequest*)addParam:(NSString *)name value:(NSString *)value {
    if(_params == nil) {
        _params = [NSMutableDictionary new];
    }
    _params[name] = value;
    return self;
}

-(HttpRequest*)setMethod:(RequestMethod)method {
    _method = method;
    return self;
}

-(HttpRequest*)setSuccess:(SuccessBlock)success {
    _success = success;
    return self;
}

-(HttpRequest*)setFailure:(FailureBlock)failure {
    _failure = failure;
    return self;
}

-(HttpRequest*)appendPartWithFileURL:(NSURL *)fileURL name:(NSString *)name {
    if(_fileParams == nil) {
        _fileParams = [NSMutableDictionary new];
    }
    _fileParams[name] = fileURL;
    return self;
}

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
