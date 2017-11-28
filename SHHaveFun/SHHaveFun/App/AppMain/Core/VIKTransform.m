#import "VIKTransform.h"

@interface VIKTransform ()

+ (CATransform3D)transformFirst3D;

+ (CATransform3D)transformSecond3D;

+ (void)transformOpenView:(UIView *)view
                SuperView:(UIView *)sview
                  fromeVC:(__kindof UINavigationController *)vc
                      Top:(CGFloat)top;

+ (void)transformCloseView:(UIView *)view
                 SuperView:(UIView *)sview
                   fromeVC:(__kindof UINavigationController *)vc
                       Top:(CGFloat)top
                completion:(void (^ )(BOOL finished))completion;

@end


@implementation VIKTransform

+ (CATransform3D)transformFirst3D {
    
    CATransform3D tFrist = CATransform3DIdentity;
    tFrist.m34 = 1.0/-900;
    tFrist = CATransform3DScale(tFrist, 0.95, 0.95, 1);
    tFrist = CATransform3DRotate(tFrist, 10.0 * M_PI/180.0, 1, 0, 0);
    return tFrist;
}

+ (CATransform3D)transformSecond3D {
    
    CATransform3D tSecond = CATransform3DIdentity;
    tSecond.m34 = [self transformFirst3D].m34;
    tSecond = CATransform3DTranslate(tSecond, 0, UIScreen.mainScreen.bounds.size.height * (-0.01), 0);
    tSecond = CATransform3DScale(tSecond, 0.9, 0.9, 1);
    return tSecond;
}

+ (void)vikTransformOpen:(__kindof VIKTransformView *)vikView on:(__kindof UINavigationController *)navigationController animationDistance:(CGFloat)distance {
    [self transformOpenView:vikView.vikSubView SuperView:vikView fromeVC:navigationController Top:UIScreen.mainScreen.bounds.size.height - distance];
}

+ (void)vikTransformClose:(__kindof VIKTransformView *)vikView on:(__kindof UINavigationController *)navigationController dispose:(void (^)(void))dispose{
    [self transformCloseView:vikView.vikSubView SuperView:vikView fromeVC:navigationController Top:UIScreen.mainScreen.bounds.size.height completion:^(BOOL finished) {
        [vikView removeFromSuperview];
        !dispose ? : dispose();
    }];
}

+ (void)transformOpenView:(UIView *)view SuperView:(UIView *)sview fromeVC:(__kindof UINavigationController *)vc Top:(CGFloat)top{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.backgroundColor = [UIColor blackColor];
    [keyWindow addSubview:sview];
    sview.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:.35f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         vc.view.layer.transform = [self transformFirst3D];
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:.4f
                                               delay:0
                              usingSpringWithDamping:.85f
                               initialSpringVelocity:0
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              
                                              vc.view.layer.transform = [self transformSecond3D];
                                              sview.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.4];
                                              CGRect lframe = view.frame;
                                              lframe.origin.y = top;
                                              view.frame = lframe;
                                          }
                                          completion:^(BOOL finished) {
                                              sview.userInteractionEnabled = YES;
                                          }];
                         
                     }];
    
    
}

+ (void)transformCloseView:(UIView *)view SuperView:(UIView *)sview fromeVC:(__kindof UINavigationController *)vc Top:(CGFloat)top completion:(void (^)(BOOL finished))completion{
    
    sview.userInteractionEnabled = NO;
    [UIView animateWithDuration:.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         vc.view.layer.transform = [self transformFirst3D];
                         sview.backgroundColor = UIColor.clearColor;
                         CGRect lframe = view.frame;
                         lframe.origin.y = top;
                         view.frame = lframe;
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:.34f
                                               delay:0
                              usingSpringWithDamping:10
                               initialSpringVelocity:5
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              vc.view.layer.transform = CATransform3DIdentity;
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
                                              keyWindow.backgroundColor = [UIColor whiteColor];
                                              
                                              sview.userInteractionEnabled = YES;
                                              
                                              if (finished) {
                                                  completion(finished);
                                              }
                                              
                                          }];
                         
                     }];
    
    
}

+ (void) popAnimationWithView:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

+ (CABasicAnimation *)getShakeAnimation{
    //创建动画对象,绕Z轴旋转
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //设置属性，周期时长
    [animation setDuration:0.10];
    //抖动角度
    animation.fromValue = @(-M_1_PI/2);
    animation.toValue = @(M_1_PI/2);
    //重复次数，无限大
    animation.repeatCount = HUGE_VAL;
    //恢复原样
    animation.autoreverses = YES;
    return animation;
}

+ (CABasicAnimation *)get3DRotationAnimation{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 3;
    //    rotationAnimation.cumulative = YES;
    //    rotationAnimation.repeatCount = MAXFLOAT;
    return rotationAnimation;
}

+ (CABasicAnimation *)getScaleAnimationScale:(CGFloat)scale{
    
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
    scaleAnim.removedOnCompletion = YES;
    return scaleAnim;
}

//判断是否为整形：

+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：

+ (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
////输入框中只能输入数字和小数点，且小数点只能输入一位，参数number 可以设置小数的位数，该函数在-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string调用；
//+(BOOL)isValidAboutInputText:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string decimalNumber:(NSInteger)number{
//    NSScanner     *scanner    = [NSScanner scannerWithString:string];
//    NSCharacterSet *numbers;
//    NSRange         pointRange = [textField.text rangeOfString:@"."];
//    if ( (pointRange.length > 0) && (pointRange.location < range.location  || pointRange.location > range.location + range.length) ){
//        numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
//    }else{
//        numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
//    }
//    if ( [textField.text isEqualToString:@""] && [string isEqualToString:@"."] ){
//        return NO;
//    }
//    short remain = number; //保留 number位小数
//    NSString *tempStr = [textField.text stringByAppendingString:string];
//    NSUInteger strlen = [tempStr length];
//    if(pointRange.length > 0 && pointRange.location > 0){ //判断输入框内是否含有“.”。
//        if([string isEqualToString:@"."]){ //当输入框内已经含有“.”时，如果再输入“.”则被视为无效。
//            return NO;
//        }
//        if(strlen > 0 && (strlen - pointRange.location) > remain+1){ //当输入框内已经含有“.”，当字符串长度减去小数点前面的字符串长度大于需要要保留的小数点位数，则视当次输入无效。
//            return NO;
//        }
//    }
//    NSRange zeroRange = [textField.text rangeOfString:@"0"];
//    if(zeroRange.length == 1 && zeroRange.location == 0){ //判断输入框第一个字符是否为“0”
//        if(![string isEqualToString:@"0"] && ![string isEqualToString:@"."] && [textField.text length] == 1){ //当输入框只有一个字符并且字符为“0”时，再输入不为“0”或者“.”的字符时，则将此输入替换输入框的这唯一字符。
//            textField.text = string;
//            return NO;
//        }else{
//            if(pointRange.length == 0 && pointRange.location > 0){ //当输入框第一个字符为“0”时，并且没有“.”字符时，如果当此输入的字符为“0”，则视当此输入无效。
//                if([string isEqualToString:@"0"]){
//                    return NO;
//                }
//            }
//        }
//    }
//    NSString *buffer;
//    if ( ![scanner scanCharactersFromSet:numbers intoString:&buffer] && ([string length] != 0) ){
//        return NO;
//    }else{
//        return YES;
//    }
//    
//    
//    NSString *pstring = @"Product: Acme Potato Peeler; Cost: 0.98 73\n\
//    Product: Chef Pierre Pasta Fork; Cost: 0.75 19\n\
//    Product: Chef Pierre Colander; Cost: 1.27 2\n";
//    
//    NSCharacterSet *semicolonSet;
//    
//    NSScanner *theScanner;
//    
//    NSString *PRODUCT = @"Product:";
//    
//    NSString *COST = @"Cost:";
//    
//    NSString *productName;
//    
//    float productCost;
//    
//    NSInteger productSold;
//    
//    semicolonSet = [NSCharacterSet characterSetWithCharactersInString:@";"];
//    
//    theScanner = [NSScanner scannerWithString:pstring];
//    
//    while ([theScanner isAtEnd] == NO)
//        
//    {
//        
//        if ([theScanner scanString:PRODUCT intoString:NULL] &&
//            
//            [theScanner scanUpToCharactersFromSet:semicolonSet
//             
//                                       intoString:&productName] &&
//            
//            [theScanner scanString:@";" intoString:NULL] &&
//            
//            [theScanner scanString:COST intoString:NULL] &&
//            
//            [theScanner scanFloat:&productCost] &&
//            
//            [theScanner scanInteger:&productSold])
//            
//        {
//            
//            NSLog(@"Sales of %@: $%1.2f", productName, productCost * productSold);
//            
//        }
//        
//    }
//    
//}

@end
