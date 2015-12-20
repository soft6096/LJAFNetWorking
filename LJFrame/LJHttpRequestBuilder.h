//
//  HttpRequestManager.h
//  base
//
//  Created by 宇宙神帝 on 15/12/19.
//  Copyright © 2015年 kakalee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "LJHttpRequest.h"

/**
 *   创建http请求，并通过AFHTTPRequestOperationManager发起请求
 *   不做成单例模式可以配置AFHTTPRequestOperationManager中的信息比如acceptableContentTypes,
 *   baseURL
 */
@interface LJHttpRequestBuilder : NSObject {
    AFHTTPRequestOperationManager *_manager;
}

/**
 *  initWithBaseURL方法，创建实例
 *
 *  @param url url地址
 *
 *  @return N/A
 */
-(instancetype)initWithBaseURL:(nullable NSURL *)url;

/**
 *  创建一个LJHttpRequest请求实例
 *
 *  @return 返回LJHttpRequest请求实例
 */
-(LJHttpRequest*)createHttpRequest;

/**
 *  设置缓存策略
 *
 *  @param cachePolicy 缓存策略
 */
-(void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy;

/**
 *  设置支持解析的返回数据类型
 *
 *  @param acceptableContentTypes N/A
 */
-(void)setAcceptableContentTypes:(NSSet *)acceptableContentTypes;

/**
 *  设置请求头信息
 *
 *  @param header 请求信息
 */
-(void)setHeader:(NSDictionary *)header;

/**
 *  设置请求头信息
 *
 *  @param header 请求信息
 */
-(void)setValue:(nullable NSString *)value forHTTPHeaderField:(NSString *)field;

/**
 *  设置过期时间
 *
 *  @param timeoutInterval 过期时间
 */
-(void)setTimeoutInterval:(NSTimeInterval)timeoutInterval;

@end
