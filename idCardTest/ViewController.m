

//
//  ViewController.m
//  idCardTest
//
//  Created by 福利郑 on 16/12/8.
//  Copyright © 2016年 福利郑. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
   
    
    UIImage *originImage = [UIImage imageNamed:@"12.jpg"];
    
    NSData *imgData = UIImageJPEGRepresentation(originImage, 1.0f);
    
    NSString *base64_image_string = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSString *appcode = @"d390f6a6ee0b4fe78b09326ce8eb21d6";
    NSString *host    = @"https://dm-53.data.aliyun.com";
    NSString *path    = @"/rest/160601/ocr/ocr_vehicle.json";
    NSString *method  = @"POST";
    NSString *querys  = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys = [NSString  stringWithFormat:@"{\"inputs\":[{\"image\":{\"dataType\":50,\"dataValue\":\"%@\"}}]}",base64_image_string];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  10];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    //根据API的要求，定义相对应的Content-Type
    [request addValue: @"application/json; charset=UTF-8" forHTTPHeaderField: @"Content-Type"];
    NSData *data = [bodys dataUsingEncoding: NSUTF8StringEncoding];
    [request setHTTPBody: data];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                                   completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                       NSLog(@"Response object: %@" , response);
                                                       NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
                                                       
                                                       //打印应答中的body
                                                       NSLog(@"Response body: %@" , bodyString);
                                                   }];
    
    [task resume];
     [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)test{
    UIImage *originImage = [UIImage imageNamed:@"5.jpg"];
    
    NSData *imgData = UIImageJPEGRepresentation(originImage, 1.0f);
    
    NSString *base64_image_string = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSString *appcode = @"dd5bf4f0740444249073d9ed5990e0f1";
    NSString *host = @"https://dm-51.data.aliyun.com";
    NSString *path = @"/rest/160601/ocr/ocr_idcard.json";
    NSString *method = @"POST";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys =[NSString stringWithFormat:@"{\"inputs\":[{\"image\":{\"dataType\":50,\"dataValue\":\"%@\"},\"configure\":{\"dataType\":50,\"dataValue\":\"{\\\"side\\\":\\\"back\\\"}\"}}]}",base64_image_string];
    //@"{\"inputs\":[{\"image\":{\"dataType\":50,\"dataValue\":\"base64_image_string(#括号内为描述，不需上传，图片以base64编码的string)\"},\"configure\":{\"dataType\":50,\"dataValue\":\"{\\\"side\\\":\\\"face(#括号内为描述，不需上传，身份证正反面类型:face/back)\\\"}\"}}]}";
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    //根据API的要求，定义相对应的Content-Type
    [request addValue: @"application/json; charset=UTF-8" forHTTPHeaderField: @"Content-Type"];
    NSData *data = [bodys dataUsingEncoding: NSUTF8StringEncoding];
    [request setHTTPBody: data];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                                   completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                       NSLog(@"Response object: %@" , response);
                                                       NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
                                                       
                                                       //打印应答中的body
                                                       NSLog(@"Response body: %@" , bodyString);
                                                   }];
    
    [task resume];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



