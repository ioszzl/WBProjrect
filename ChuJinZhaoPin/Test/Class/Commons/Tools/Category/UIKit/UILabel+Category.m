//
//  UILabel+Category.m
//  Test
//
//  Created by eims on 17/6/21.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (instancetype)ym_labelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor {
    
    return [self ym_labelWithFrame:frame
                              font:font
                         textColor:textColor
                     textAlignment:NSTextAlignmentLeft];
}

+ (instancetype)ym_labelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment {
    
    return [self ym_labelWithFrame:frame
                              font:font
                         textColor:textColor
                     textAlignment:textAlignment
                       borderWidth:0
                       borderColor:nil
                      cornerRadius:0];
}

+ (instancetype)ym_labelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor
                     cornerRadius:(CGFloat)cornerRadius {
    
    UILabel *label = [[self alloc] initWithFrame:frame];
    
    label.backgroundColor = [UIColor clearColor];
    
    if (font) label.font = font;
    
    if (textColor) label.textColor = textColor;
    
    if (borderWidth) label.layer.borderWidth = borderWidth;
    
    if (borderColor) label.layer.borderColor = borderColor.CGColor;
    
    if (cornerRadius) {
        
        label.clipsToBounds = YES;
        
        label.layer.cornerRadius = cornerRadius;
    }
    
    label.numberOfLines = 0;
    
    label.textAlignment = textAlignment;
    return label;

    
}


+(void)setAttributeFontSize:(CGFloat)fontSize
                      Color:(UIColor *)color
           attributedString:(NSMutableAttributedString *)attributedString
                     string:(NSString *)string
              rangeOfString:(NSString *)str{
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:[string rangeOfString:str]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:[string rangeOfString:str]];
    
}

+(void)setAttributeLineSpacing:(CGFloat)lineSpacing
              paragraphSpacing:(CGFloat)paragraphSpacing
              attributedString:(NSMutableAttributedString *)attributedString
                        string:(NSString *)string
                 rangeOfString:(NSString *)str{
    
    NSMutableParagraphStyle *paragraphTitle = [[NSMutableParagraphStyle alloc] init];
    if (lineSpacing) {
        paragraphTitle.lineSpacing = lineSpacing;
    }
    if (paragraphSpacing) {
        paragraphTitle.paragraphSpacing = paragraphSpacing;
    }
    paragraphTitle.alignment = NSTextAlignmentJustified;
    
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphTitle range:[string rangeOfString:str]];
    
}
+(UILabel *)ym_labLineWithFrame:(CGRect)frame{
    UILabel *line = [UILabel ym_labelWithFrame:frame font:[UIFont systemFontOfSize:10] textColor:HEXRGBCOLOR(0xbfbfbf)];
    line.text = @"-------------------------------------------------------------------------------------";
    line.lineBreakMode = NSLineBreakByClipping;
    return line;
}
@end
