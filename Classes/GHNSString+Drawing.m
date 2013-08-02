//
//  GHNSString+Drawing.m
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

#import "GHNSString+Drawing.h"

@implementation NSString(GHDrawing)

- (CGSize)gh_sizeWithFont:(UIFont *)font {
  CGSize retSize;
  if ([self respondsToSelector:@selector(sizeWithAttributes:)]) {
    // iOS7 only
    retSize = [self sizeWithAttributes:@{NSFontAttributeName: font}];
  } else {
    retSize = [self sizeWithFont:font];
  }
  retSize.width = ceilf(retSize.width);
  retSize.height = ceilf(retSize.height);
  return retSize;
}

- (CGSize)gh_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
  // Passing -1 as a "special" flag not to use lineBreakMode
  return [self gh_sizeWithFont:font constrainedToSize:size lineBreakMode:-1];
}

- (CGSize)gh_sizeWithFont:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode {
  // Use CGFLOAT_MAX as a flag for size with width
  return [self gh_sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:lineBreakMode];
}

- (CGSize)gh_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
  CGSize retSize;
  if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
    // iOS7 only
    retSize = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine) attributes:@{NSFontAttributeName: font} context:nil].size;
  } else {
    if ((NSInteger)lineBreakMode == -1) {
      retSize = [self sizeWithFont:font constrainedToSize:size];
    } else {
      retSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
    }
  }
  retSize.width = ceilf(retSize.width);
  retSize.height = ceilf(retSize.height);
  return retSize;
}

@end
