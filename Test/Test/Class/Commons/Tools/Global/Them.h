//
//  Them.h
//  TestDemo
//
//  Created by 孙若淮 on 14/03/2018.
//  Copyright © 2018 Monster. All rights reserved.
//

#ifndef Them_h
#define Them_h

//字体大小

#define FONT_SIZE_12 [UIFont systemFontOfSize:Size(12)]

#define FONT_SIZE_15 [UIFont systemFontOfSize:Size(15)]

#define FONT_SIZE_18 [UIFont systemFontOfSize:Size(18)]

/**颜色*/

#define COLOR_MAIN_PERSON RGBCOLOR(255,187,21)
#define COLOR_MAIN_ENTERPRISE RGBCOLOR(75, 179, 240)
#define COLOR_MAIN  (AppDelegateInstance.userType == 1 ? RGBCOLOR(75, 179, 240) : RGBCOLOR(255, 187, 21))
#define COLOR_BG    RGBCOLOR(248,249,251)

#define COLOR_RGB_51 RGBCOLOR(51,51,51)
#define COLOR_RGB_102 RGBCOLOR(102,102,102)
#define COLOR_RGB_153 RGBCOLOR(153,153,153)
#define COLOR_RGB_line RGBCOLOR(230,230,230)
// RGB颜色
#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
// HEX颜色
#define HEXRGBCOLOR(h)      RGBCOLOR(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF))
#define HEXRGBACOLOR(h,a)   RGBACOLOR(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF), a)



#endif /* Them_h */
