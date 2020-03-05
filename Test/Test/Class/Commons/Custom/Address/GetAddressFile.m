//
//  GetAddressFile.m
//  Test
//
//  Created by eims on 2018/11/16.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "GetAddressFile.h"

@implementation GetAddressFile
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)writeDataToPlist:(id)data {
    //沙盒获取路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    //获取文件的完整路径
    NSString *filePatch = [path stringByAppendingPathComponent:@"CJAddress.plist"];//没有会自动创建
    NSLog(@"file patch%@",filePatch);
    NSMutableDictionary *sandBoxDataDic = [[NSMutableDictionary alloc]initWithContentsOfFile:filePatch];
    [data writeToFile:filePatch atomically:YES];
    if (sandBoxDataDic==nil) {
        
//        [dataArr writeToFile:filePatch atomically:YES];
    }else{
        NSLog(@"old sandBox is %@",sandBoxDataDic);
//        sandBoxDataDic[@"test"] = @"hello world";
//        [sandBoxDataDic writeToFile:filePatch atomically:YES];
    }
//    NSLog(@"sandBox %@",sandBoxDataDic);//直接打印数据
    
}

@end
