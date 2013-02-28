//
//  UILabel+AdjustMultiline.m
//
//  Created by  on 2/26/12.
//  Copyright (c) 2012 TAP. All rights reserved.
//

#import "UILabel+AdjustMultiline.h"

@implementation UILabel (AdjustMultiline)

- (void)adjustMultilineSizeWithMinSize:(CGSize)minSize
						   maxFontSize:(int)maxFontSize
				 andMinFontSizePercent:(float)percent
{
    UIFont *font = self.font;
    
    int i;
    for(i = maxFontSize ; i > 10; i=i-1)
    {
        font = [font fontWithSize:i];
        if (font.pointSize <= floorf(self.font.pointSize*percent))
            break;
		
        CGSize constraintSize = CGSizeMake(self.frame.size.width, MAXFLOAT);
        CGSize labelSize = [self.text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        if(labelSize.height <= minSize.height)
            break;
    }
    self.font = font;
}

- (void)adjustMultilineSizeWithMinSize:(CGSize)minSize
{
    [self adjustMultilineSizeWithMinSize:minSize maxFontSize:25 andMinFontSizePercent:0.9];
}

@end
