//
//  HttpRequestManager.m
//  base
//
//  Created by 宇宙神帝 on 15/12/19.
//  Copyright © 2015年 kakalee. All rights reserved.
//

#import "LJHttpRequestBuilder.h"

@interface LJHttpRequestBuilder ()

@end

@implementation LJHttpRequestBuilder

/**
 *  init方法，创建实例
 *
 *  @return N/A
 */
-(instancetype)init {
    self = [super init];
    if(self) {
        _manager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

/**
 *  initWithBaseURL方法，创建实例
 *
 *  @param url url地址
 *
 *  @return N/A
 */
- (instancetype)initWithBaseURL:(nullable NSURL *)url {
    self = [super init];
    if(self) {
        _manager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    }
    return self;
}

/**
 *  创建一个LJHttpRequest请求实例
 *
 *  @return 返回LJHttpRequest请求实例
 */
-(LJHttpRequest*)createHttpRequest {
    LJHttpRequest *request = [[LJHttpRequest alloc]init];
    [request setManager:_manager];
    return request;
}

/**
 *  设置请求头信息
 *
 *  @param header 请求信息
 */
-(void)setHeader:(NSDictionary *)header {
    for (NSString *field in header) {
        [self setValue:header[field] forHTTPHeaderField:field];
    }
}

/**
 *  设置缓存策略
 *
 *  @param cachePolicy 缓存策略
 */
-(void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy {
    [_manager.requestSerializer setCachePolicy:cachePolicy];
}

/**
 *  设置支持解析的返回数据类型
 *
 *  @param acceptableContentTypes N/A
 */
-(void)setAcceptableContentTypes:(NSSet *)acceptableContentTypes {
    _manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
}

/**
 *  设置请求头信息
 *
 *  @param header 请求信息
 */
- (void)setValue:(nullable NSString *)value forHTTPHeaderField:(NSString *)field {
    [_manager.requestSerializer setValue:value forHTTPHeaderField:field];
}

/**
 *  设置过期时间
 *
 *  @param timeoutInterval 过期时间
 */
- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval {
    [_manager.requestSerializer setTimeoutInterval:timeoutInterval];
}
@end
