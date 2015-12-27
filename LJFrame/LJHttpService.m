//
//  CQHttpService.m
//  base
//
//  Created by 宇宙神帝 on 15/12/20.
//  Copyright © 2015年 kakalee. All rights reserved.
//

#import "LJHttpService.h"

/**
 *  服务，用于初始化LJHttpRequestBuilder相关参数信息,管理LJHttpRequestBuilder实例
 */
@implementation LJHttpService

/**
 *  创建单例
 *
 *  @return 返回当前服务单例
 */
+ (LJHttpService *)sharedClient {
    static LJHttpService *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LJHttpService alloc]init];
        [_sharedClient initConfig];
    });
    return _sharedClient;
}

/**
 *  初始化LJHttpRequestBuilder实例的一些参数信息，全局调用的
 */
-(void)initConfig {
    _managerBuilder = [[LJHttpRequestBuilder alloc]init];
    [_managerBuilder setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [_managerBuilder setTimeoutInterval:30000];
    [_managerBuilder setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil]];
}


/**
 *  创建LJHttpRequest 这里的LJHttpRequest实例里已经封装了AFHTTPRequestOperationManager，用于通讯
 *
 *  @return LJHttpRequest
 */
+(LJHttpRequest *)createHttpRequest {
    return [[[LJHttpService sharedClient] managerBuilder] createHttpRequest];
}

@end
