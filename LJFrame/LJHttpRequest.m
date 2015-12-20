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

- (instancetype)init {
    self = [super init];
    if (self) {
        _method = RequestMethodGet;
    }
    return self;
}

-(LJHttpRequest*)setManager:(AFHTTPRequestOperationManager *)manager {
    _manager = manager;
    return self;
}

-(LJHttpRequest*)setUrl:(NSString *)url {
    _url = url;
    return self;
}

-(LJHttpRequest*)addParam:(NSString *)name value:(NSString *)value {
    if(_params == nil) {
        _params = [[NSMutableDictionary alloc]init];
    }
    _params[name] = value;
    return self;
}

-(LJHttpRequest*)addParams:(NSDictionary *)params {
    if(_params == nil) {
        _params = [[NSMutableDictionary alloc]initWithDictionary:params];
    }
    
    else {
        [_params setValuesForKeysWithDictionary:params];
    }
    return self;
}

-(LJHttpRequest*)setMethod:(RequestMethod)method {
    _method = method;
    return self;
}

-(LJHttpRequest*)setSuccess:(SuccessBlock)success {
    _success = success;
    return self;
}

-(LJHttpRequest*)setFailure:(FailureBlock)failure {
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
