
#import "SHImageView.h"

@implementation SHImageView



@end
//@implementation UIImageView (LPPZWebImageView)
//- (void)jf_setImageWithURL:(nullable NSURL *)url
//          placeholderImage:(nullable UIImage *)placeholder
//                   options:(LPPZWebImageOptions)options
//
//                 completed:(nullable LPPZExternalCompletionBlock)completedBlock {
//    //针对SDWebImage的二次封装
//    self.contentMode = UIViewContentModeScaleAspectFill;
//    self.clipsToBounds = YES;
//    __weak __typeof(self)weakSelf = self;
//    [self sd_setImageWithURL:url placeholderImage:placeholder options:(NSUInteger)options completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        if (cacheType == SDImageCacheTypeNone) {
//            //首次从网络下载过来添加渐变效果
//            CATransition *animation = [CATransition animation];
//            animation.duration = .3f;
//            animation.type = kCATransitionFade;
//            animation.removedOnCompletion = YES;
//            [weakSelf.layer addAnimation:animation forKey:@"transition"];
//        }
//        if (completedBlock) {
//            completedBlock(image,error,(NSInteger)cacheType,imageURL);
//        }
//    }];
//}
//@end
