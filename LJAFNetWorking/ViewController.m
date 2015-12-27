//
//  ViewController.m
//  LJAFNetWorking
//
//  Created by Weblogic on 15/12/19.
//  Copyright © 2015年 Weblogic. All rights reserved.
//

#import "ViewController.h"
#import "LJHttpService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    /**
     *  发起Http请求
     *
     *  1.[LJHttpService sharedClient]创建 LJHttpService实例
     *  2.取得 LJHttpService实例的managerBuilder变量
     *  3.创建LJHttpRequest实例
     *  4.设置如下参数
     *  5.执行execute方法
     *
     *  @param setUrl  :  设置请求的url地址
     *  @param params  :  设置请求的参数
     *  @param method  :  设置请求方法 RequestMethodGet/RequestMethodPost
     *  @param success :  设置请求成功的回调函数
     *  @param failure :  设置请求失败的回调函数
     *
     *  @return N/A
     */
    [[[[[[[[[LJHttpService sharedClient] managerBuilder] createHttpRequest] setUrl:@"http://"] addParams:nil] setMethod:RequestMethodGet] setSuccess:^(id responseObject){
        
        NSLog(@"%@",responseObject);
        
    }] setFailure:^(id error){
        NSLog(@"%@",error);
    
    }] execute];
    
    
    
    /**
     *  发起Http请求
     *
     *  1.[LJHttpService createHttpRequest] 创建LJHttpRequest实例
     *  2.设置如下参数
     *  3.执行execute方法
     *
     *  @param setUrl  :  设置请求的url地址
     *  @param params  :  设置请求的参数
     *  @param method  :  设置请求方法 RequestMethodGet/RequestMethodPost
     *  @param success :  设置请求成功的回调函数
     *  @param failure :  设置请求失败的回调函数
     *
     *  @return N/A
     */
    [[[LJHttpService createHttpRequest] setUrl:@"http://" params:nil method:RequestMethodGet success:^(id responseObject){
        
        NSLog(@"%@",responseObject);
        
    } failure:^(id error){
        
        NSLog(@"%@",error);
        
    }] execute];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
