//
//  ZHNewsContent.h
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHNewsContent : JSONModel

@property (readwrite, strong, nonatomic) NSString *body;
@property (readwrite, strong, nonatomic) NSString *imageSource;
@property (readwrite, strong, nonatomic) NSString *title;
@property (readwrite, strong, nonatomic) NSString *image;
@property (readwrite, strong, nonatomic) NSString *shareUrl;
@property (readwrite, strong, nonatomic) NSString *gaPrefix;
@property (readwrite, strong, nonatomic) NSNumber *type;
@property (readwrite, strong, nonatomic) NSNumber *id;
@property (readwrite, strong, nonatomic) NSArray *js;
@property (readwrite, strong, nonatomic) NSArray *css;

@end

/*
 "image_source": "okubax / CC BY",
 "title": "Windows 8 真的是微软史上最短命的操作系统吗？",
 "image": "http://pic3.zhimg.com/410a1bd2ea0990eef772a69b8181e24a.jpg",
 "share_url": "http://daily.zhihu.com/story/7740381",
 "js": [],
 "ga_prefix": "011314",
 "type": 0,
 "id": 7740381,
 "css": [
 "http://news-at.zhihu.com/css/news_qa.auto.css?v=77778"
 "body": "<div class=\"main-wrap content-wrap\">\n<div class=\"headline\">\n\n<div class=\"img-place-holder\"></div>\n\n\n\n<div class=\"headline-background\">\n<a class=\"headline-background-link\" href=\"http://news.mydrivers.com/1/465/465776.htm\">\n<div class=\"heading\">相关新闻</div>\n<div class=\"heading-content\">微软今起正式抛弃 Windows 8： 史上最短命</div>\n<i class=\"icon-arrow-right\"></i>\n</a>\n</div>\n\n</div>\n\n<div class=\"content-inner\">\n\n\n\n\n<div class=\"question\">\n<h2 class=\"question-title\">微软为什么停止对 Win 8 提供安全支持？</h2>\n\n<div class=\"answer\">\n\n<div class=\"meta\">\n<img class=\"avatar\" src=\"http://pic1.zhimg.com/da8e974dc_is.jpg\">\n<span class=\"author\">知乎用户</span>\n</div>\n\n<div class=\"content\">\n<p>你们不要从各个角度进行分析了，这事儿没这么复杂。</p>\r\n<p>微软产品的技术支持生命周期及策略都可以在微软官网上找到。</p>\r\n<p><a href=\"https://support.microsoft.com/zh-cn/gp/gp_lifecycle_main/zh-cn?mstlocpickshow=true%252cfalse%2cfalse&amp;hdrfo=account&amp;wa=wsignin1.0#gp/gp_lifecycle_servicepacksupport\">微软产品技术支持生命周期</a></p>\r\n<p><strong>具体到 Windows，微软为每一代 Windows 提供的主流支持周期为至少五年，或者下一代产品发布之后两年。取决于哪一个更后到来。</strong></p>\r\n<p>比如 Windows XP，它从 2001 年发布，主流支持按照五年来算的话本该在 2006 年结束。但是我们知道它的下一代产品 Windows Vista 是 2007 年 1 月 30 日发布的，所以 Windows XP 的主流支持被推迟到 Vista 发布后两年，实际是 2009 年 4 月的第二个周二。</p>\r\n<p>同理，Windows Vista 的发布日期是 2007 年 1 月 30 日，而下一代产品 Windows 7 发布日期是 2009 年 10 月。所以，Vista 的主流支持的结束时间，就是标准的五年，实际是在 2012 年 4 月的第二个周二。</p>\r\n<p>同理，Windows 7 发布时间是 2009 年 10 月，下一代产品 Windows 8 的发布时间是 2012 年 10 月 26 日。所以，Windows 7 的主流支持结束时间，同样是标准的五年，实际是在 2015 年 1 月的第二个周二。</p>\r\n<p>Windows 8 发布时间是 2012 年 10 月 26 日，它的下一代产品是 Windows 10，发布时间是 2015 年 7 月 29 日。所以 Windows 8 的主流支持时间其实应该到 2018 年的 1 月的第二个周二截止。</p>\r\n<p>那么，今天停止支持的是什么呢？上面为什么没提到 Windows 8.1 呢？这就涉及到微软的另一个策略，Services Pack 支持策略了。</p>\r\n<p><strong>对于一款 Windows 而言，微软不会一直支持该系统的所有版本，而是支持最新的 SP 版本。对于上一代 SP 版本（或者不带 SP 的 RTM 版），微软提供的支持时间是持续到最新 SP 发布之后两年，或者整个产品周期结束，取决于哪个日期先到。</strong></p>\r\n<p>比如 Windows 7，SP1 补丁发布日期 2011 年 2 月，所以，不带 SP 补丁的 Windows 7 RTM 版其实在 2013 年 4 月的第二个周二之后就停止支持了。</p>\r\n<p><a href=\"http://www.guigu.org/news/ruanjianxitong/2013021716465.html\">微软 4 月起不再为 Windows 7 RTM 提供服务支持</a></p>\r\n<p>Windows 8.1 其实被微软视为 Windows 8 的一个补丁升级，因此其产品支持策略同样采用了 SP 的策略。Windows 8.1 的发布时间是 2013 年 10 月 17 日。因此，两年之后，最初的 Windows 8 的主流支持就在 2016 年的 1 月第二个周二（1 月 12 日）停止了。但是 Windows 8.1 依然会延续 Windows 8 的主流支持周期，直到上面提到的 2018 年 1 月的第二个周二。</p>\r\n<p><strong>所以，Windows 8 并不短命，它的生命周期完全是按照既定的策略来的，和 Windows Vista，Windows 7 等是一样的。</strong></p>\r\n<p>另外，微软产品支持周期结束的时间都是每年的 1 月或者 4 月的第二个周二（这天会发布最后一个补丁）。具体时间是根据产品发布时间，产品的支持周期在到期之后，先遇到这两天中哪一天，就在哪一天结束。比如 Windows 8.1 发布时间是 2013 年 10 月 17 日，两年到期其实是 2015 年 10 月，因此会先遇到 2016 年的 1 月的第二个周二，就在这天结束了。</p>\r\n<p>另外，结束支持这天发布的补丁，其实还享有额外一个月的支持时间。大概是防止补丁发布出来之后就遇到问题，微软还是会想办法解决的。</p>\r\n<p>写的有点乱，将就看吧。微软这样的公司，在产品支持周期的策略上是相当完善的，不会随意改动的。</p>\n</div>\n</div>\n\n\n<div class=\"view-more\"><a href=\"http://www.zhihu.com/question/39411764\">查看知乎讨论<span class=\"js-question-holder\"></span></a></div>\n\n</div>\n\n\n</div>\n</div>",
 ]
*/