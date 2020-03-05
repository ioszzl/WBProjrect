//
//  SearchHistoryManager.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/20.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchHistoryManager : NSObject
+ (instancetype)sharedDataBase;


/**
 添加一条搜索记录
 
 @param str <#str description#>
 */
- (BOOL)addHistorySearchRecord:(NSString *)str;

/**
 删除一条搜索记录
 
 @param str <#str description#>
 @return <#return value description#>
 */
- (BOOL)deleteHistorySearchRecord:(NSString *)str;

/**
 删除所有的搜索记录
 
 */
- (void)removeAllHistorySearchRecord;



/**
 *  获取所有搜索记录
 *
 */

- (NSArray *)getAllHistorySearchRecord;
@end

NS_ASSUME_NONNULL_END
