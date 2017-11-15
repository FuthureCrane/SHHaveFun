//
//  UIFont+MarsLink.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/14.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (MarsLink)

+ (instancetype)marsOCRFont:(CGFloat)fontSize;

@end
//public static func size(_ text: String, font: UIFont, width: CGFloat, insets: UIEdgeInsets = UIEdgeInsets.zero) -> CGRect {
//    let constrainedSize = CGSize(width: width - insets.left - insets.right, height: CGFloat.greatestFiniteMagnitude)
//    let attributes = [ NSFontAttributeName: font ]
//    let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
//    var bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
//    bounds.size.width = width
//    bounds.size.height = ceil(bounds.height + insets.top + insets.bottom)

CG_INLINE CGRect marsLinkSize(NSString *text ,UIFont *font ,CGFloat width , UIEdgeInsets insets) {
    let constrainedSize = CGSizeMake(width - insets.left - insets.right, CGFLOAT_MAX);
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
    CGRect rect = [text boundingRectWithSize:constrainedSize
                                     options:opts
                                  attributes:attributes
                                     context:nil];
    rect.size.width = width;
    rect.size.height = ceil(rect.size.height + insets.top + insets.bottom);
    return rect;
}
CG_INLINE CGRect marsLinkSizeZero(NSString *text ,UIFont *font ,CGFloat width) {
    return marsLinkSize(text, font, width, UIEdgeInsetsZero);
}
