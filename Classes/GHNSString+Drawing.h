//
//  GHNSString+Drawing.h
//  GHKit
//
//  Created by Allen Cheung on 8/2/13.
//  Copyright (c) 2013 rel.me. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString(GHDrawing)

/*!
 sizeWithFont:constrainedToSize: is deprecated in iOS7, this wrapper calls the correct
 method if the string responds to it (iOS7 only)
 */
- (CGSize)gh_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
