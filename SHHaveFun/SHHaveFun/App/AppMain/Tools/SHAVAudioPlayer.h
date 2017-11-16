//
//  SHAVAudioPlayer.h
//  SHHaveFun
//
//  Created by Futhure on 2017/11/16.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import <Foundation/Foundation.h>
//  提供一个可以播放本地,网路MP3等格式的播放控制
//  播放流程
//  传入URLString,index->检测是否有正在加载,正在播放的音频(停止加载,停止播放)->检查URLString是本地还是网络路径(网络路径下载到本地,并且缓存到本地目录下)->开始播放加载到的audioData->播放结束
/**
 *  录音消息的状态
 */
typedef NS_ENUM(NSUInteger, SHVoiceMessageState){
    SHVoiceMessageStateNormal,/**< 未播放状态 */
    SHVoiceMessageStateDownloading,/**< 正在下载中 */
    SHVoiceMessageStatePlaying,/**< 正在播放 */
    SHVoiceMessageStateCancel,/**< 播放被取消 */
};

@interface SHAVAudioPlayer : NSObject

@property (nonatomic, copy) NSString *URLString;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, assign) SHVoiceMessageState audioPlayerState;

+ (instancetype)sharePlayer;

- (void)playAudioWithURLString:(NSString *)URLString identifier:(NSString *)identifier;

- (void)stopAudioPlayer;

- (void)cleanAudioCache;

@end
