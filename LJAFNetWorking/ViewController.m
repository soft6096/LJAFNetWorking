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
    
    [[[[[[[LJHttpService sharedClient] managerBuilder] createHttpRequest] setUrl:@"https://www.baidu.com"] setSuccess:^(id responseObject){
        
        NSLog(@"%@",responseObject);
        
    }] setFailure:^(id error){
        NSLog(@"%@",error);
    
    }] execute];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
