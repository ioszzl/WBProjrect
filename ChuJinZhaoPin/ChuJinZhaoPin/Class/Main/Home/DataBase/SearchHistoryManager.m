//
//  SearchHistoryManager.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/20.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "SearchHistoryManager.h"
#import <FMDB/FMDB.h>

@interface SearchHistoryManager()
@property (nonatomic, strong) FMDatabase *db;
@end
@implementation SearchHistoryManager
+ (id)sharedDataBase {
    static SearchHistoryManager *searchDBManager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        searchDBManager = [[self alloc] init];
        [searchDBManager initDataBase];
    });
    return searchDBManager;
}

-(void)initDataBase{
    // 文件路径
    NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",@"HistorySearchRecords.sqlite"];
    // 实例化FMDataBase对象
    _db = [FMDatabase databaseWithPath:filePath];
    //打开数据库
    [_db open];
    // 初始化数据表
    NSString *personSql = @"CREATE TABLE 'UserHistorySearchRecordsTB' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL ,'search_record' VARCHAR(255))";
    
    if ([_db open])
    {
        BOOL result = [_db executeUpdate:personSql];
        if (result)
        {
            NSLog(@"创建表成功");
        }else{
            NSLog(@"创建表失败");
            
        }
    }
    
    
    //关闭数据库
    [_db close];
    
}

/**
 添加一条搜索记录
 
 */
- (BOOL)addHistorySearchRecord:(NSString *)str{
    
    
    [_db open];
    
    
    //先判断是否已存在，存在即不添加
    BOOL isExit = NO;
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    FMResultSet *res = [_db executeQuery:@"SELECT * FROM UserHistorySearchRecordsTB where search_record = ?",str];
    
    while ([res next]) {
        NSString  *search_record = [res stringForColumn:@"search_record"];
        [dataArray addObject:search_record];
    }
    
    isExit = (dataArray.count > 0);
    
    if (isExit) {
        return NO;
    }
    
    
    BOOL isSuccess = [_db executeUpdate:@"INSERT INTO UserHistorySearchRecordsTB(search_record)VALUES(?)",str];
    [_db close];
    if (isSuccess) {
        NSLog(@"添加一条搜索记录成功");
        return YES;
    }else{
        NSLog(@"添加一条搜索记录失败");
        return NO;
        
    }
    
    
}

/**
 删除一条搜索记录

 @param str <#str description#>
 @return <#return value description#>
 */
- (BOOL)deleteHistorySearchRecord:(NSString *)str{
    [_db open];
    
    BOOL isSuccess = [_db executeUpdate:@"delete from UserHistorySearchRecordsTB where search_record = ?",str];
    [_db close];
    if (isSuccess) {
        NSLog(@"删除一条搜索记录成功");
        return YES;
    }else{
        NSLog(@"删除一条搜索记录失败");
        return NO;
        
    }
}
/**
 删除所有的搜索记录
 
 */
- (void)removeAllHistorySearchRecord{
    [_db open];
    
    BOOL isSuccess = [_db executeUpdate:@"DELETE FROM UserHistorySearchRecordsTB"];
    if (isSuccess) {
        NSLog(@"删除所有的搜索记录成功");
    }else{
        NSLog(@"删除所有的搜索记录失败");
        
    }
    
    [_db close];
    
    
}

/**
 *  获取所有搜索记录
 *
 */

- (NSArray *)getAllHistorySearchRecord{
    
    [_db open];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    FMResultSet *res = [_db executeQuery:@"SELECT * FROM UserHistorySearchRecordsTB"];
    
    while ([res next]) {
        NSString *search_record = [res stringForColumn:@"search_record"];
        [dataArray addObject:search_record];
    }
    
    [_db close];
    
    return dataArray;
    
}
@end
