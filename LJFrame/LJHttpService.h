//
//  CQHttpService.h
//  base
//
//  Created by 宇宙神帝 on 15/12/20.
//  Copyright © 2015年 kakalee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJHttpRequestBuilder.h"

/**
 *  服务，用于初始化LJHttpRequestBuilder相关参数信息,管理LJHttpRequestBuilder实例
 */
@interface LJHttpService : NSObject

@property(nonatomic, strong) LJHttpRequestBuilder *managerBuilder;

/**
 *  创建单例
 *
 *  @return 返回当前服务单例
 */
+ (LJHttpService *)sharedClient;

/**
 *  创建LJHttpRequest 这里的LJHttpRequest实例里已经封装了AFHTTPRequestOperationManager，用于通讯
 *
 *  @return LJHttpRequest
 */
+(LJHttpRequest *)createHttpRequest;

@end
