//
//  UILabel+AdjustMultiline.m
//
//  Created by  on 2/26/12.
//  Copyright (c) 2012 TAP. All rights reserved.
//

#import "UILabel+AdjustMultiline.h"

@implementation UILabel (AdjustMultiline)

- (void)adjustMultilineSizeWithMinSize:(CGSize)minSize
{
    UIFont *font = self.font;
    
    int i;
    for(i = 25 ; i > 10; i=i-1)
    {
        font = [font fontWithSize:i];
        // max adjustment for fontsize is 10%
        TTDLog(@"font pointsize %f", font.pointSize);
        TTDLog(@"self.font pointsize %f", floorf(self.font.pointSize*0.9));
        if (font.pointSize <= floorf(self.font.pointSize*0.9))
            break;
            
        CGSize constraintSize = CGSizeMake(self.frame.size.width, MAXFLOAT);
        CGSize labelSize = [self.text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        if(labelSize.height <= minSize.height)
            break;
    }
    self.font = font;
}

@end
