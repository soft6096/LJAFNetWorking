//
//  HttpRequestManager.m
//  base
//
//  Created by kakalee on 15/12/19.
//  Copyright © 2015年 kakalee. All rights reserved.
//

#import "HttpRequestManager.h"

@interface HttpRequestManager ()

@end

@implementation HttpRequestManager

-(instancetype)init {
    self = [super init];
    if(self) {
        _manager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

- (instancetype)initWithBaseURL:(nullable NSURL *)url {
    self = [super init];
    if(self) {
        _manager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    }
    return self;
}

-(HttpRequest*)createHttpRequest {
    HttpRequest *request = [[HttpRequest alloc]init];
    [request setManager:_manager];
    return request;
}

-(void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy {
    [_manager.requestSerializer setCachePolicy:cachePolicy];
}

-(void)setAcceptableContentTypes:(NSSet *)acceptableContentTypes {
    _manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
}

- (void)setValue:(nullable NSString *)value forHTTPHeaderField:(NSString *)field {
    [_manager.requestSerializer setValue:value forHTTPHeaderField:field];
}
@end
