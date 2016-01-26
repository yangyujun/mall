//
//  weiboDefine.h
//  ringvisit
//
//  Created by 陈欢 on 13-8-15.
//  Copyright (c) 2013年 guoty. All rights reserved.
//

#ifndef ringvisit_weiboDefine_h
#define ringvisit_weiboDefine_h

typedef enum
{
    sinaWeibo,
    tcWeibo,
    weChat,
    weChatFriend
}WeiboType;

#define kSinaAppKey         @"1062363663"
#define kSinaSecret  @"90476c816329463b6aba87a3d3cf2342"
#define kSinaRedirectURI    @"http://d.91dingdong.com/"

#define kWeChatAppId        @"wxbe41ebca760466e"
#define kWeChatAppKey       @"270e045bf66d6515309e13e71dceb707"

#define kTcAppKey     @"801403753"
#define kTcAppSecret  @"9e610eb9fd7043009053bbe9f2fbb89e"
#define kTcRedirectURI             @"http://d.91dingdong.com/"

#define AccessTokenKey          @"WeiBoAccessToken"
#define ExpirationDateKey       @"WeiBoExpirationDate"
#define ExpireTimeKey           @"WeiBoExpireTime"
#define UserIDKey               @"WeiBoUserID"
#define OpenIdKey               @"WeiBoOpenId"
#define OpenKeyKey              @"WeiBoOpenKey"
#define RefreshTokenKey         @"WeiBoRefreshToken"
#define NameKey                 @"WeiBoName"
#define SSOAuthKey              @"WeiBoIsSSOAuth"

#endif
