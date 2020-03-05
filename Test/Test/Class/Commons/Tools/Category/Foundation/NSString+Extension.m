//
//  NSString+Extension.m
//  Test
//
//  Created by eims on 17/6/20.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (Extension)

#pragma mark - UI显示

// 字符串保留两位小数
+ (NSString *)ym_priceWithSign:(CGFloat)value {
    
    return [NSString stringWithFormat:@"￥%.2f", value];
}

// 把手机号第4-7位变成星号
+ (NSString *)ym_phoneNumToAsterisk:(NSString*)phoneNum {
    
    if (!phoneNum.length) {
        
        return @"";
    }
    return [phoneNum stringByReplacingCharactersInRange:NSMakeRange(3,4) withString:@"****"];
}

// 把邮箱@前面变成星号
+ (NSString*)ym_emailToAsterisk:(NSString *)email {
    
    NSArray *arr = [email componentsSeparatedByString:@"@"];
    NSString *str = [arr objectAtIndex:0];
    return [email stringByReplacingCharactersInRange:NSMakeRange(str.length, email.length-str.length) withString:@"****"];
}

// 把身份证号第11-14位变成星号
+ (NSString*)ym_idCardToAsterisk:(NSString *)idCardNum {
    
    return [idCardNum stringByReplacingCharactersInRange:NSMakeRange(10, 4) withString:@"****"];
}

//几分钟前的更新
+ (NSString *)ym_beforeUpdateTime: (NSString *)theDate {
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    if (cha/3600<1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        
        if (timeString.integerValue<3) {
            timeString=@"刚刚";
        }else{
            timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
        }
        
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    if (cha/86400>1 && cha/(86400*30)<1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    }
    if (cha/(86400*30)>1 && cha/(86400*365)<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/(86400*30)];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@月前", timeString];
    }
    if (cha/(86400*365)>1) {
        timeString = [NSString stringWithFormat:@"%f", cha/(86400*365)];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@年前", timeString];
    }
    
    return timeString;
}

// 获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)ym_firstCharactor:(NSString *)aString {
    
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

// 通过文本宽度计算高度
- (CGSize)ym_calculateSize:(UIFont *)font maxWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing {
    
    CGSize size = CGSizeMake(width,MAXFLOAT);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.paragraphSpacing = lineSpacing;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGRect rect =  [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return CGSizeMake(rect.size.width, rect.size.height);
}

// 获取一个字体的长度
- (CGFloat)ym_getStringWidthfont:(UIFont*)font {
    
    return [self sizeWithAttributes:@{NSFontAttributeName:font}].width;
}

#pragma mark - 字符串检验

// 验证身份证是否合法
+ (BOOL)ym_validateIdCard:(NSString *)idCard {
    if (idCard.length < 18) {
        return NO;
    }
    NSMutableArray *IDArray = [NSMutableArray array];
    // 遍历身份证字符串,存入数组中
    for (int i = 0; i < 18; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [idCard substringWithRange:range];
        [IDArray addObject:subString];
    }
    // 系数数组
    NSArray *coefficientArray = [NSArray arrayWithObjects:@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2", nil];
    // 余数数组
    NSArray *remainderArray = [NSArray arrayWithObjects:@"1", @"0", @"X", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2", nil];
    // 每一位身份证号码和对应系数相乘之后相加所得的和
    int sum = 0;
    for (int i = 0; i < 17; i++) {
        int coefficient = [coefficientArray[i] intValue];
        int ID = [IDArray[i] intValue];
        sum += coefficient * ID;
    }
    // 这个和除以11的余数对应的数
    NSString *str = remainderArray[(sum % 11)];
    // 身份证号码最后一位
    NSString *string = [idCard substringFromIndex:17];
    // 如果这个数字和身份证最后一位相同,则符合国家标准,返回YES
    if ([str isEqualToString:string]) {
        return YES;
    } else {
        return NO;
    }
}

// 邮箱验证
+ (BOOL)ym_validateEmail:(NSString *)email {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

// 手机号码验证
+ (BOOL)ym_validateMobile:(NSString *)mobile {
    
    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

// 固话验证
+ (BOOL)ym_validateAreaTel:(NSString *)areaTel {
    
    NSString *phoneRegex = @"^((0\\d{2,3})-)(\\d{7,8})(-(\\d{3,}))?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:areaTel];
    
}

// 判断字符串是否有中文
+ (BOOL)ym_IsChinese:(NSString *)str {
    
    for(int i=0; i< [str length];i++) {
        
        int a = [str characterAtIndex:i];
        
        if( a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

//判断全字母
+ (BOOL)isAllLetter:(NSString *)inputString {
    if (inputString.length == 0) return NO;
    NSString *regex =@"[a-zA-Z]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:inputString];
}

//判断全数字
+ (BOOL)isAllNumber:(NSString *)inputString {
    if (inputString.length == 0) return NO;
    NSString *regex =@"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:inputString];
}
//字母或数字
+ (BOOL)isAllLetterOrNum:(NSString *)inputString {
    if (inputString.length == 0) return NO;
    NSString *regex =@"[a-zA-Z0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:inputString];
}


// 验证证件号码格式错误
+ (BOOL)ym_isPaperFormat:(NSString *) paparworkType  cerId: (NSString*) code {
    
    
    if (paparworkType == nil || [paparworkType length]==0) {
        return NO;
    }
    
    
    BOOL isFormat = NO;
    NSInteger type = [paparworkType integerValue];
    
    switch (type){
        case 39:
            //身份证
            isFormat = [self ym_validateIdCard:code];
            
            break;
        case 43:
            //港澳通行证
            //isFormat = isHKPassport(code);
            //"[HMhm]{1}([0-9]{10}|[0-9]{8})";
            isFormat = [self validatePass:code];
            break;
        case 40:
            //护照
            //"[a-zA-Z]{5,17}" or "[a-zA-Z0-9]{5,17}"
            
            isFormat = [self validateHuZhao:code];
            break;
            
        case 44:
            /**台湾通行证**/
            //"[0-9]{8}" or "[0-9]{10}"
            //isFormat = [self ym_validateTaiWanPass:code];
            break;
            
        default:
            isFormat = true;
            break;
    }
    
    return isFormat;
}

//港澳通行证
+ (BOOL)validatePass:(NSString *)passCode {
    
    NSString *codeRegex = @"[HMhm]{1}([0-9]{10}|[0-9]{8})";
    NSPredicate *codeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex];
    
    return [codeTest evaluateWithObject:passCode];
    
}

//护照
+ (BOOL)validateHuZhao:(NSString *)huZhaoCode {
    
    NSString *codeRegex = @"[a-zA-Z]{5,17}";
    NSPredicate *codeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex];
    
    NSString *codeRegex2 = @"[a-zA-Z0-9]{5,17}";
    NSPredicate *codeTest2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex2];
    
    
    return [codeTest evaluateWithObject:huZhaoCode]||[codeTest2 evaluateWithObject:huZhaoCode];
    
}

// 重写containsString方法，兼容8.0以下版本
- (BOOL)containsString:(NSString *)aString NS_AVAILABLE(10_10, 8_0) {
    if ([aString ym_isBlank]) {
        return NO;
    }
    if ([self rangeOfString:aString].location != NSNotFound) {
        return YES;
    }
    return NO;
}

// 判断字符串是否为空白的
- (BOOL)ym_isBlank {
    
    if ((self == nil) || (self.length == 0)) {
        return YES;
    }
    
    NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimedString length] == 0) {
        return YES;
    } else {
        return NO;
    }
    
    return YES;
}

#pragma mark - 字符串相关转换

// 字典转换成字符串
+ (NSString *)ym_jsonStringWithDictionary:(NSDictionary *)dictionary {
    
    NSString *jsonString = nil;
    NSError *error;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error: &error];
    
    if (!data) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return jsonString;
}

// 数组转JSON
+ (NSString *)ym_arrayToJSONString:(NSArray *)array {
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

// 过滤表情或者一些文字
+ (NSString *)ym_filtration_emoji:(NSString *)text {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];    
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    return modifiedString;
}

// 将数组里每个字符串用","号拼接成一个字符串
- (NSString *)ym_componentString:(NSArray *)array {
    NSString *str = [array componentsJoinedByString:@","];
    return str;
}

// 给字符串md5加密
- (NSString*)ym_md5 {
    
    const char *ptr = [self UTF8String];
    
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

- (NSURL *)ym_imageurl {
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BaseImageUrl, self]];
}

+(NSString *)ym_stringUtils:(id)stringValue
{
    NSString *string = [NSString stringWithFormat:@"%@", stringValue];
    
    if([string isEqualToString:@"<null>"])
    {
        string = @"";
    }
    
    if(string == nil)
    {
        string = @"";
    }
    
    if([string isEqualToString:@"(null)"])
    {
        string = @"";
    }
    
    if(string.length == 0)
    {
        string = @"";
    }
    
    return string;
}
//将数字字符串每三位逗号分隔
+(NSString*)strmethodComma:(NSString*)str
{
    
    NSString *intStr;
    
    NSString *floStr;
    
    if ([str containsString:@"."]) {
        
        NSRange range = [str rangeOfString:@"."];
        
        floStr = [str substringFromIndex:range.location];
        
        intStr = [str substringToIndex:range.location];
        
    }else{
        
        floStr = @"";
        
        intStr = str;
        
    }
    
    if (intStr.length <=3) {
        
        return [intStr stringByAppendingString:floStr];
        
    }else{
        
        NSInteger length = intStr.length;
        
        NSInteger count = length/3;
        
        NSInteger y = length%3;
        
        
        NSString *tit = [intStr substringToIndex:y] ;
        
        NSMutableString *det = [[intStr substringFromIndex:y] mutableCopy];
        
        
        for (int i =0; i < count; i ++) {
            
            NSInteger index = i + i *3;
            
            [det insertString:@","atIndex:index];
            
        }
        
        if (y ==0) {
            
            det = [[det substringFromIndex:1]mutableCopy];
            
        }
        
        intStr = [tit stringByAppendingString:det];
        
        return [intStr stringByAppendingString:floStr];
        
    }
}
//json转字典
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        //        DLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
/**
 解析带html标签字符串
*/
+ (NSMutableAttributedString *)praseHtmlStr:(NSString *)htmlStr {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding)} documentAttributes:nil error:nil];
    return attributedString;
}

/**
 *  富文本转html字符串
 */
+ (NSString *)attriToHtmlStrWithAttri:(NSAttributedString *)attri{
    NSDictionary *tempDic = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,
                              NSCharacterEncodingDocumentAttribute:[NSNumber numberWithInt:NSUTF8StringEncoding]};
    NSData *htmlData = [attri dataFromRange:NSMakeRange(0, attri.length)
                         documentAttributes:tempDic
                                      error:nil];
    return [[NSString alloc] initWithData:htmlData
                                 encoding:NSUTF8StringEncoding];
}


/**
 字符串去除html标签

 @param html <#html description#>
 @return <#return value description#>
 */
+ (NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}


@end
