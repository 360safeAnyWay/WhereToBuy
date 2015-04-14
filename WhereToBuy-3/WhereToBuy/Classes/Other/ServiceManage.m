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
#import "DataCenter.h"
<<<<<<< HEAD
=======
#import "USERUSERDataBase.h"
>>>>>>> parent of e1f60e4... d大是大非上的
//#define Base_Url @"http://101.227.243.126:8082"
//#define Base_Url @"http://www.usuda.cn/verify.php/"
//#define Base_Url @"http://www.weather.com.cn/data/sk/101010100.html"
//#define Base_Url @"http://www.usuda.cn/funcms/index.php/controller_getjson/"
//#define Base_Url @"http://www.fangyuan1314.com/test/list1.php"


@interface ServiceManage()


<<<<<<< HEAD
=======

>>>>>>> parent of e1f60e4... d大是大非上的
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
<<<<<<< HEAD
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
=======
   // manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
   // manager.requestSerializer = [AFJSONRequestSerializer serializer];
>>>>>>> parent of e1f60e4... d大是大非上的
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
-(void)DidConnectServer:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [self requestMethod:@"PUT" serviceName:@"/api.php/user/144" parmers:dic completeBlock:^(id obj) {
            NSLog(@"asdfjlasjdfla%@",obj);
        }];
}
//获取城市
-(void)DidGetCity:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getCity/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"data"]) {
            status = [obj[@"status"] intValue];
        }
        callBack(status, obj[@"data"]);
    }];
}

//获取价格
-(void)DidGetPrice:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getLMprice/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"data"]) {
            status = [obj[@"status"] intValue];
        }
        callBack(status, obj[@"data"]);
    }];
}

//获取面积
-(void)DidGetArea:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getLMarea/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"data"]) {
            status = [obj[@"code"] intValue];
        }
        callBack(status, obj[@"data"]);
    }];
}

//获取房型
-(void)DidGetType:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getLMtype/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"data"]) {
            status = [obj[@"status"] intValue];
        }
        callBack(status, obj[@"data"]);
    }];
}

//获取城市下面区域
-(void)DidGetDistrict:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/getDistrict/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"data"]) {
            status = [obj[@"status"] intValue];
        }
        callBack(status, obj[@"data"]);
    }];
}

//请求房产数据
-(void)DidGetHousesName:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/listResAndSub/" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"data"]) {
            status = [obj[@"status"] intValue];
        }
        callBack(status, obj[@"data"]);
    }];
}

//登录
-(void)DidLogin:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];
    [self requestMethod:@"POST" serviceName:@"/api.php/user/login" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"message"]) {
            status = [obj[@"status"] intValue];
        }
        NSLog(@"%@",obj);
        callBack(status, obj);
    }];
}

//获取验证码(注册时使用)
-(void)DidRequestToken:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];
    [self requestMethod:@"POST" serviceName:@"/api.php/send/phone" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"message"]) {
            status = [obj[@"status"] intValue];
        }
        
        NSLog(@"%@",obj);
        callBack(status, obj);
    }];
}
//请求验证码(忘记密码)
-(void)DidRequestTokenForget:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];
    [self requestMethod:@"POST" serviceName:@"/api.php/send/forgot" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"message"]) {
            status = [obj[@"status"] intValue];
        }
        
        NSLog(@"%@",obj);
        callBack(status, obj);
    }];
}
//验证验证码信息
-(void)DidRerequestToken:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];

    [self requestMethod:@"POST" serviceName:@"/api.php/verify/phone" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"message"]) {
            status = [obj[@"status"] intValue];
        }
        
        NSLog(@"%@",obj);
        callBack(status, obj);
    }];
}
//忘记密码
-(void)DidTokenForgetPasswd:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];
    [self requestMethod:@"POST" serviceName:@"/api.php/user/forgot" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"message"]) {
            status = [obj[@"status"] intValue];
        }
        
        NSLog(@"%@",obj);
        callBack(status, obj);
    }];
}

//修改密码
-(void)DidChangePasswd:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];
    [dic setObject:[DataCenter instance].user.token forKey:@"token"];
    [self requestMethod:@"POST" serviceName:@"/api.php/user/editpassword" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"message"]) {
            status = [obj[@"status"] intValue];
        }
        
        NSLog(@"%@",obj);
        callBack(status, obj);
    }];
}

//注册
-(void)DidRegister:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];
    [self requestMethod:@"POST" serviceName:@"/api.php/user/reg" parmers:dic completeBlock:^(id obj) {
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"message"]) {
            NSLog(@"%@",obj);

            status = [obj[@"status"] intValue];
        }
        callBack(status, obj);
    }];
}
//获取用户个人信息
<<<<<<< HEAD
-(void)DidUserInfo:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"HePd443Mnd" forKey:@"overifyname"];
    [self requestMethod:@"GET" serviceName:@"/cpanel/index.php/buyc_interface1/registerResUser/" parmers:dic completeBlock:^(id obj) {
=======
-(void)DidUserInfo:(NSString*)GET completion:(DATAARRAY)block
{
    AFHTTPRequestOperationManager * manager   = [AFHTTPRequestOperationManager manager];
    NSMutableArray       * dataArray = [NSMutableArray array];
    [manager GET:GET parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        USERUSERDataBase * uudb = [[USERUSERDataBase alloc]initWithDictionary:responseObject];
        [dataArray addObject:uudb];
        NSString * errerStr = [responseObject objectForKey:@"status"];
        block(dataArray,errerStr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"->>>>>>>>>>>>>%@",error);
        block(nil,(NSString *)error);
    }];
}
-(void)didRevampUserInfo:(NSDictionary*)parmers completion:(void (^)(ERROR_CODE status, id obj)) callBack
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parmers];
    [dic setObject:@"IOS" forKey:@"client"];
    if (TOKEN == nil)
    {
        return;
    }
    [dic setObject:TOKEN forKey:@"token"];
    [self requestMethod:@"GET" serviceName:@"/api.php/user/info" parmers:dic completeBlock:^(id obj) {
>>>>>>> parent of e1f60e4... d大是大非上的
        ERROR_CODE status = ERROR_CODE_RequestFailed;
        if (obj && obj[@"message"]) {
            status = [obj[@"status"] intValue];
        }
<<<<<<< HEAD
=======
        NSLog(@"%@",obj);
>>>>>>> parent of e1f60e4... d大是大非上的
        callBack(status, obj);
    }];
}

<<<<<<< HEAD
=======
-(void)upDataImage:(NSString *)url image:(UIImage *)image completion:(DATAARRAY)block
{
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    NSLog(@"%@",imageData);
    [manager POST:url parameters:@{@"client":@"IOS",@"file":imageData,@"token":TOKEN,@"uid":UID} constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
       [formData appendPartWithFileData :imageData name:@"file" fileName:@"userImage.png" mimeType:@"image/jpg/png"];

    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString * str = [NSString stringWithFormat:@"%@",responseObject];
        NSLog(@"%@",str);
        SHOWALERT(str);

    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@",error);
     }];
    
}
>>>>>>> parent of e1f60e4... d大是大非上的
@end





