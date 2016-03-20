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

/**
 *  上传文件的进度回调
 *
 *  @param totalBytesWritten已经写的字节数
 *  @param totalBytesExpectedToWrite总字节数
 *  这个block在主线程中执行(totalBytesWritten/totalBytesExpectedToWrite)计算上传的进度并更新进度条
 */
typedef void (^UploadProgressBlock)(long long totalBytesWritten, long long totalBytesExpectedToWrite);

@interface LJHttpRequest : NSObject {
    AFHTTPRequestOperationManager *_manager;
    
    NSString *_url;
    
    NSMutableDictionary *_params;
    
    RequestMethod _method;
    
    SuccessBlock _success;
    
    FailureBlock _failure;
    
    UploadProgressBlock _uploadProgress;
    
    NSMutableDictionary *_fileParams;
    
    NSMutableDictionary *_fileDataParams;
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

/**
 *  设置上传文件的NSURL和名称
 *
 *  @param fileURL
 *  @param name
 *
 *  @return self
 */
-(LJHttpRequest*)appendPartWithFileURL:(NSURL *)fileURL name:(NSString *)name;


/**
 *  设置上传文件的data和名称和文件名称
 *
 *  @param data
 *  @param name
 *
 *  @return self
 */
- (LJHttpRequest*)appendPartWithFileData:(NSData *)data name:(NSString *)name;

/**
 *  设置上传进度的block
 *
 *  @param fileURL
 *  @param name
 *
 *  @return self
 */
- (LJHttpRequest*)setUploadProgressBlock:(UploadProgressBlock)uploadProgress;

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
