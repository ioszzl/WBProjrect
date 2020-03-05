//
//  NSString+Extension.h
//  Test
//
//  Created by eims on 17/6/20.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
#pragma mark - UI展示
/*
 *字符串保留两位小数
 */
+(NSString *)ym_priceWithSign:(CGFloat)value;

/**
 把手机号第4-7位变成星号
 */
+(NSString *)ym_phoneNumToAsterisk:(NSString*)phoneNum;

/**
 把邮箱@前面变成星号
 */
+(NSString*)ym_emailToAsterisk:(NSString *)email;

/**
 把身份证号第11-14位变成星号
 */
+(NSString *)ym_idCardToAsterisk:(NSString *)idCardNum;

/**
 几分钟前更新的内容
 */
+(NSString *)ym_beforeUpdateTime: (NSString *) theDate;

/**
 获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
 */
+(NSString *)ym_firstCharactor:(NSString *)aString;

/**
 通过文本宽度计算高度
 */
-(CGSize)ym_calculateSize:(UIFont *)font maxWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

/**
 获取一个字体的长度
 */
-(CGFloat)ym_getStringWidthfont:(UIFont*)font;

#pragma mark - 字符串检验
/**
 判断是否是身份证号码
 */
+(BOOL)ym_validateIdCard:(NSString *)idCard;

/**
 邮箱验证
 */
+(BOOL)ym_validateEmail:(NSString *)email;

/**
 手机号码验证
 */
+(BOOL)ym_validateMobile:(NSString *)mobile;

/**
 固话验证
 */
+(BOOL)ym_validateAreaTel:(NSString *)areaTel;

/**
 判断字符串是否有中文
 */
+(BOOL)ym_IsChinese:(NSString *)str;

/**
 判断全字母
 */
+ (BOOL)isAllLetter:(NSString *)inputString;

/**
 判断全数字
 */
+ (BOOL)isAllNumber:(NSString *)inputString;

/**
 字母或数字
 */
+ (BOOL)isAllLetterOrNum:(NSString *)inputString;

/**
 * 验证证件号码格式错误
 *
 * @param paparworkType  证件类型:(身份证39, 护照40, 台胞通行证41, 回乡证42, 港澳通行证43, 台湾通行证44, 户口本45, 出生证明46, 其他47)
 * @param code 证件内容
 */
+(BOOL)ym_isPaperFormat:(NSString *)paparworkType  cerId:(NSString *)code;

/**
 重写containsString方法，兼容8.0以下版本
 */
-(BOOL)containsString:(NSString *)aString NS_AVAILABLE(10_10, 8_0);

/**
 判断字符串是否为空白的
 */
-(BOOL)ym_isBlank;

#pragma mark - 字符串相关转换

/**
 字典转换成字符串
 */
+(NSString *)ym_jsonStringWithDictionary:(NSDictionary *)dictionary;

/**
 数组转JSON
 */
+(NSString *)ym_arrayToJSONString:(NSArray *)array;

/**
 过滤表情或者一些文字
 */
+(NSString *)ym_filtration_emoji:(NSString *)text;

/**
 将数组里每个字符串用","号拼接成一个字符串
 */
-(NSString *)ym_componentString:(NSArray *)array;

/*
 * 给字符串md5加密
 */
-(NSString *)ym_md5;

/**
 拼接网络地址字符串
 */
- (NSURL *)ym_imageurl;

/*
 * 返回非空字符串
 */
+(NSString *)ym_stringUtils:(id)stringValue;

//

/**
将数字字符串每三位逗号分隔
 */
+(NSString*)strmethodComma:(NSString*)str;




/**
 json转字典

 @param jsonString <#jsonString description#>
 @return <#return value description#>
 */
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 将带html标签的字符串转为富文本

 @param htmlStr <#htmlStr description#>
 @return <#return value description#>
 */
+ (NSMutableAttributedString *)praseHtmlStr:(NSString *)htmlStr;

/**
 *  富文本转html字符串
 */
+ (NSString *)attriToHtmlStrWithAttri:(NSAttributedString *)attri;

/**
 字符串去除html标签
 
 @param html <#html description#>
 @return <#return value description#>
 */
+ (NSString *)filterHTML:(NSString *)html;
@end
