//
//  Utils.m
//
//  Created by  on 1/19/12.
//  Copyright (c) 2012 TAP. All rights reserved.
//

#import "TTUtils.h"
#import "UIDevice-Hardware.h"
#import <QuartzCore/QuartzCore.h>

@implementation TTUtils

+ (BOOL)iOS5Present
{
	float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    return (version >= 5.0);
}

+ (BOOL)iphone6Present
{
	CGRect bounds = [[UIScreen mainScreen] bounds];
    CGFloat height = bounds.size.height;
    CGFloat scale = [[UIScreen mainScreen] scale];
	
    return (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) && ((height * scale) >= 1136));
}

+ (UIBarButtonItem*)backBarButtonWithTarget:(id)target title:(NSString*)titleString andSize:(CGSize)size
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, size.width, size.height)];
    UIImage *_bkgImage = [[UIImage imageNamed:@"btn-05"] stretchableImageWithLeftCapWidth:15.0
                                                                             topCapHeight:0.0];
    [button setBackgroundImage:_bkgImage forState:UIControlStateNormal];
    [button setTitle:titleString forState:UIControlStateNormal];
    [[button titleLabel] setFont:[UIFont boldSystemFontOfSize:12.0]];
    [button addTarget:target
               action:@selector(back)
     forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    return backBarButton;
}

+ (UIBarButtonItem*)backBarButtonWithTarget:(id)target andTitle:(NSString*)titleString
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 80.0, 44.0)];
    UIImage *_bkgImage = [[UIImage imageNamed:@"btn-05"] stretchableImageWithLeftCapWidth:15.0
                                                                             topCapHeight:0.0];
    [button setBackgroundImage:_bkgImage forState:UIControlStateNormal];
    [button setTitle:titleString forState:UIControlStateNormal];
    [[button titleLabel] setFont:[UIFont boldSystemFontOfSize:12.0]];
    [button addTarget:target
               action:@selector(back) 
     forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    return backBarButton;
}

+ (UIBarButtonItem*)redBackBarButtonWithTarget:(id)target andTitle:(NSString*)title
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 80.0, 30.0)];
    UIImage *_bkgImage = [[UIImage imageNamed:@"btn_arrow_red_normal"] stretchableImageWithLeftCapWidth:15.0
																						   topCapHeight:0.0];
	UIImage *_bkgImageSelected = [[UIImage imageNamed:@"btn_arrow_red_pressed"] stretchableImageWithLeftCapWidth:15.0
																									topCapHeight:0.0];
    [button setBackgroundImage:_bkgImage forState:UIControlStateNormal];
	[button setBackgroundImage:_bkgImageSelected forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [[button titleLabel] setFont:[UIFont boldSystemFontOfSize:12.0]];
    [button addTarget:target
               action:@selector(back) 
     forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    return backBarButton;
}

+ (UIBarButtonItem*)redBackBarButtonWithTarget:(id)target
{
	return [self redBackBarButtonWithTarget:target
							andTitle:NSLocalizedString(@"  Übersicht", nil)];
}

+ (UIBarButtonItem*)backBarButtonWithTarget:(id)target
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 80.0, 44.0)];
    UIImage *_bkgImage = [[UIImage imageNamed:@"btn-05"] stretchableImageWithLeftCapWidth:15.0
                                                                             topCapHeight:0.0];
    [button setBackgroundImage:_bkgImage forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(@"  Übersicht", nil) forState:UIControlStateNormal];
    [[button titleLabel] setFont:[UIFont boldSystemFontOfSize:12.0]];
    [button addTarget:target
               action:@selector(back) 
     forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    return backBarButton;
}

+ (UIBarButtonItem*)barButtonItemWithTitle:(NSString*)buttonTitle
								 titleFont:(UIFont*)titleFont
                                     image:(UIImage*)image
                                  bkgImage:(UIImage*)bkgImage
                          bkgSelectedImage:(UIImage*)bkgSelectedImage
                                      size:(CGSize)buttonSize
                                    target:(id)target
                               andSelector:(SEL)buttonSelector {
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    infoButton.frame = CGRectMake(0.0, 0.0, buttonSize.width, buttonSize.height);
    [infoButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    if (image) {
        [infoButton setImage:image forState:UIControlStateNormal];
    }
    if (bkgImage) {
        [infoButton setBackgroundImage:bkgImage forState:UIControlStateNormal];
    }
    if (bkgSelectedImage) {
        [infoButton setBackgroundImage:bkgSelectedImage forState:UIControlStateHighlighted];
    }
    
    if (buttonTitle) {
        [infoButton setTitle:buttonTitle forState:UIControlStateNormal];
    }
    [[infoButton titleLabel] setFont:titleFont];
	[[infoButton titleLabel] setShadowOffset:CGSizeMake(0.0, -1.0)];
	[[infoButton titleLabel] setShadowColor:[UIColor colorWithWhite:0.0 alpha:0.7]];
    [infoButton addTarget:target 
                   action:buttonSelector
         forControlEvents:UIControlEventTouchUpInside];
	
    UIBarButtonItem *infoBarButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    return infoBarButton;
}

+ (UIBarButtonItem*)barButtonItemWithTitle:(NSString*)buttonTitle
                                     image:(UIImage*)image
                                  bkgImage:(UIImage*)bkgImage
                          bkgSelectedImage:(UIImage*)bkgSelectedImage
                                      size:(CGSize)buttonSize
                                    target:(id)target
                               andSelector:(SEL)buttonSelector

{
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    infoButton.frame = CGRectMake(0.0, 0.0, buttonSize.width, buttonSize.height);
    [infoButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    if (image) {
        [infoButton setImage:image forState:UIControlStateNormal];
    }
    if (bkgImage) {
        [infoButton setBackgroundImage:bkgImage forState:UIControlStateNormal];
    }
    if (bkgSelectedImage) {
        [infoButton setBackgroundImage:bkgSelectedImage forState:UIControlStateHighlighted];
    }
    
    if (buttonTitle) {
        [infoButton setTitle:buttonTitle forState:UIControlStateNormal];
    }
    [[infoButton titleLabel] setFont:[UIFont boldSystemFontOfSize:12.0]];
    [infoButton addTarget:target 
                   action:buttonSelector
         forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *infoBarButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    return infoBarButton;
}

+ (NSString*)base64forData:(NSData*)theData 
{
    const uint8_t* input = (const uint8_t*)[theData bytes];
    NSInteger length = [theData length];
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
    
    NSInteger i;
    for (i=0; i < length; i += 3) {
        NSInteger value = 0;
        NSInteger j;
        for (j = i; j < (i + 3); j++) {
            value <<= 8;
            
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        
        NSInteger theIndex = (i / 3) * 4;
        output[theIndex + 0] =                    table[(value >> 18) & 0x3F];
        output[theIndex + 1] =                    table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
    
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}

@end
