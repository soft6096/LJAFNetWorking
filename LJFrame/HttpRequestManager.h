//
//  HttpRequestManager.h
//  base
//
//  Created by kakalee on 15/12/19.
//  Copyright © 2015年 kakalee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "HttpRequest.h"

/**
 创建http请求，并通过AFHTTPRequestOperationManager发起请求
 不做成单例模式可以配置AFHTTPRequestOperationManager中的信息比如acceptableContentTypes,
 baseURL
 **/
@interface HttpRequestManager : NSObject {
    AFHTTPRequestOperationManager *_manager;
}
-(instancetype)initWithBaseURL:(nullable NSURL *)url;

/**
 *  创建请求
 *
 *  @return HttpRequest
 */
-(HttpRequest*)createHttpRequest;

-(void)setCachePolicy:(NSURLRequestCachePolicy)cachePolicy;

-(void)setAcceptableContentTypes:(NSSet *)acceptableContentTypes;

-(void)setValue:(nullable NSString *)value forHTTPHeaderField:(NSString *)field;
@end
