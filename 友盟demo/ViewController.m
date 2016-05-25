//
//  ViewController.m
//  友盟demo
//
//  Created by lxj on 16/5/24.
//  Copyright © 2016年 lxj. All rights reserved.
//

#import "ViewController.h"
#import "UMSocial.h"
@interface ViewController ()<UMSocialUIDelegate>

#define AppKey @"5744171667e58e89d80015ae"
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)wechat:(UIButton *)sender {
    //使用UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite分别代表微信好友、微信朋友圈、微信收藏
//    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
    
//    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://baidu.com";
//    //纯文字分享类型没有图片，点击不会跳转
//    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeText;
    
//纯图片分享类型没有文字，点击图片可以查看大图
//    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeImage;

//    //标题
//    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"微信好友title";
    
    //应用分享类型如果用户已经安装应用，则打开APP，如果为安装APP，则提示未安装或跳转至微信开放平台
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeApp;

    //UMShareToWechatSession 微信 UMShareToWechatTimeline朋友圈

    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:@"分享内嵌文字" image:[UIImage imageNamed:@"loading58x58"] location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
}
- (IBAction)qq:(UIButton *)sender {
    //标题
     [UMSocialData defaultData].extConfig.qqData.title = @"QQ分享title";
    //点击跳转
     [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    //发送到为qq消息类型
    [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeImage;
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQQ] content:@"分享文字" image:[UIImage imageNamed:@"loading58x58"]  location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
}
- (IBAction)weibo:(UIButton *)sender {
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToSina] content:@"分享内嵌文字" image:
     [UIImage imageNamed:@"loading58x58"] location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *shareResponse){
        if (shareResponse.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
}

- (IBAction)circle:(UIButton *)sender {
    //使用UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite分别代表微信好友、微信朋友圈、微信收藏
    //    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
    
    //    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://baidu.com";
    //    //纯文字分享类型没有图片，点击不会跳转
    //    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeText;
    
    //纯图片分享类型没有文字，点击图片可以查看大图
    //    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeImage;
    
    //    //标题
    //    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"微信好友title";
    
    //应用分享类型如果用户已经安装应用，则打开APP，如果为安装APP，则提示未安装或跳转至微信开放平台
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeApp;
    
    //UMShareToWechatSession 微信 UMShareToWechatTimeline朋友圈
    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:@"分享内嵌文字" image:[UIImage imageNamed:@"loading58x58"] location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
}

- (IBAction)kj:(UIButton *)sender {
    //标题
    [UMSocialData defaultData].extConfig.qzoneData.title = @"QQ分享title";
    //点击跳转
    [UMSocialData defaultData].extConfig.qzoneData.url = @"http://baidu.com";
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQzone] content:@"分享文字" image:[UIImage imageNamed:@"loading58x58"]  location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];

}


- (IBAction)all:(UIButton *)sender {
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:AppKey
                                          shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
                                         shareImage:[UIImage imageNamed:@"icon"]
                                    shareToSnsNames:@[UMShareToWechatSession,UMShareToQQ,UMShareToSina,UMShareToWechatTimeline,UMShareToQzone]
                                           delegate:self];
    
}

///回调
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    
    
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

@end
