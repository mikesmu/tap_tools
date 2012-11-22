//
//  Utils.h
//
//  Created by  on 1/19/12.
//  Copyright (c) 2012 TAP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTUtils : NSObject

+ (UIBarButtonItem*)backBarButtonWithTarget:(id)target;
+ (UIBarButtonItem*)redBackBarButtonWithTarget:(id)target;
+ (UIBarButtonItem*)redBackBarButtonWithTarget:(id)target andTitle:(NSString*)title;
+ (UIBarButtonItem*)backBarButtonWithTarget:(id)target andTitle:(NSString*)titleString;
+ (UIBarButtonItem*)backBarButtonWithTarget:(id)target title:(NSString*)titleString andSize:(CGSize)size;
+ (UIBarButtonItem*)barButtonItemWithTitle:(NSString*)buttonTitle
                                     image:(UIImage*)image
                                  bkgImage:(UIImage*)bkgImage
                          bkgSelectedImage:(UIImage*)bkgSelectedImage
                                      size:(CGSize)buttonSize
                                    target:(id)target
                               andSelector:(SEL)buttonSelector;
+ (UIBarButtonItem*)barButtonItemWithTitle:(NSString*)buttonTitle
								 titleFont:(UIFOnt*)titleFont
                                     image:(UIImage*)image
                                  bkgImage:(UIImage*)bkgImage
                          bkgSelectedImage:(UIImage*)bkgSelectedImage
                                      size:(CGSize)buttonSize
                                    target:(id)target
                               andSelector:(SEL)buttonSelector;
+ (NSString*)base64forData:(NSData*)theData;
+ (BOOL)iOS5Present;
+ (BOOL)iphone6Present;


@end
