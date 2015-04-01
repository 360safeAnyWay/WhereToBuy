//
//  ServiceManage.m
//  mg
//
//  Created by xiang ying on 14-8-3.
//  Copyright (c) 2014年 xiang ying. All rights reserved.
//

#import "ServiceManage.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPSessionManager.h"
//#define Base_Url @"http://101.227.243.126:8082"
//#define Base_Url @"http://www.usuda.cn/verify.php/"
//#define Base_Url @"http://www.weather.com.cn/data/sk/101010100.html"
//#define Base_Url @"http://www.usuda.cn/funcms/index.php/controller_getjson/"
//#define Base_Url @"http://www.fangyuan1314.com/test/list1.php"


@interface ServiceManage()


-(void)requestMethod:(NSString*)method serviceName:(NSString*)service parmers:(NSDictionary*)parmers completeBlock:(void (^)(id obj)) callBack;

@end

@implementation ServiceManage

+(instancetype)shareInstance{
    static ServiceManage *serviceManage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!serviceManage) {
            serviceManage = [[ServiceManage alloc] init];
        }
    });
    return serviceManage;
}

//请求基类
-(void)requestMethod:(NSString*)method serviceName:(NSString*)service parmers:(NSDictionary*)parmers completeBlock:(void (^)(id obj)) callBack{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",Base_Url,service];
    if ([method isEqualToString:@"POST"]) {
        [manager POST:requestUrl parameters:parmers success:^(AFHTTPRequestOperation *operation, id responseObject) {
            callBack(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            callBack(nil);
        }];
    }else if ([method isEqualToString:@"PUT"]){
        [manager PUT:requestUrl parameters:parmers success:^(AFHTTPRequestOperation *operation, id responseObject) {
            callBack(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            callBack(nil);
        }];
    }else {
        [manager GET:requestUrl parameters:parmers success:^(AFHTTPRequestOperation *operation, id responseObject) {
            callBack(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            callBack(nil);
        }];
    }
}

//链接服务器得测试
-(void)DidConnectServer:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [self requestMethod:@"PUT" serviceName:@"/api.php/user/144" parmers:dic completeBlock:^(id obj) {
            NSLog(@"asdfjlasjdfla%@",obj);
        }];
}
//获取城市
-(void)DidGetCity:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getCity/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_NONE;
        if (obj && obj[@"data"]) {
            code = [obj[@"code"] intValue];
        }
        callBack(code, obj[@"data"]);
    }];
}

//获取价格
-(void)DidGetPrice:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getLMprice/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"data"]) {
            code = [obj[@"code"] intValue];
        }
        callBack(code, obj[@"data"]);
    }];
}

//获取面积
-(void)DidGetArea:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getLMarea/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"data"]) {
            code = [obj[@"code"] intValue];
        }
        callBack(code, obj[@"data"]);
    }];
}

//获取房型
-(void)DidGetType:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getLMtype/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"data"]) {
            code = [obj[@"code"] intValue];
        }
        callBack(code, obj[@"data"]);
    }];
}

//获取城市下面区域
-(void)DidGetDistrict:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getDistrict/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"data"]) {
            code = [obj[@"code"] intValue];
        }
        callBack(code, obj[@"data"]);
    }];
}

//请求房产数据
-(void)DidGetHousesName:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/listResAndSub/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"data"]) {
            code = [obj[@"code"] intValue];
        }
        callBack(code, obj[@"data"]);
    }];
}

//登录
-(void)DidLogin:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"POST" serviceName:@"/cpanel/index.php/buyc_interface1/loginToMainaer/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"message"]) {
            code = [obj[@"code"] intValue];
        }
        callBack(code, obj);
    }];
}

//获取验证码
-(void)DidRequestToken:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];
    [self requestMethod:@"POST" serviceName:@"/api.php/send/phone" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"message"]) {
            code = [obj[@"code"] intValue];
        }
        
        NSLog(@"%@",obj);
        callBack(code, obj);
    }];
}
//验证验证码信息
-(void)DidRerequestToken:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];

    [self requestMethod:@"POST" serviceName:@"/api.php/verify/phone" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"message"]) {
            code = [obj[@"code"] intValue];
        }
        
        NSLog(@"%@",obj);
        callBack(code, obj);
    }];
}
//注册
-(void)DidRegister:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"POST" serviceName:@"http://test.local.com/api.php/verify/phone" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"message"]) {
            NSLog(@"%@",obj);

            code = [obj[@"code"] intValue];
        }
        callBack(code, obj);
    }];
}
//获取用户个人信息
-(void)DidUserInfo:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE code, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/registerResUser/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE code = ERROR_CODE_RROR;
        if (obj && obj[@"message"]) {
            code = [obj[@"code"] intValue];
        }
        callBack(code, obj);
    }];
}

@end





