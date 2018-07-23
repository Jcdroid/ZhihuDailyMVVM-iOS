//
//  ZHLatestNews.h
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

/*
 {
 date: "20140523",
 stories: [
 {
 title: "中国古代家具发展到今天有两个高峰，一个两宋一个明末（多图）",
 ga_prefix: "052321",
 images: [
 "http://p1.zhimg.com/45/b9/45b9f057fc1957ed2c946814342c0f02.jpg"
 ],
 type: 0,
 id: 3930445
 },
 ...
 ],
 top_stories: [
 {
 title: "商场和很多人家里，竹制家具越来越多（多图）",
 image: "http://p2.zhimg.com/9a/15/9a1570bb9e5fa53ae9fb9269a56ee019.jpg",
 ga_prefix: "052315",
 type: 0,
 id: 3930883
 },
 ...
 ]
 }
 分析：
 
 date : 日期
 stories : 当日新闻
 title : 新闻标题
 images : 图像地址（官方 API 使用数组形式。目前暂未有使用多张图片的情形出现，曾见无 images 属性的情况，请在使用中注意 ）
 ga_prefix : 供 Google Analytics 使用
 type : 作用未知
 id : url 与 share_url 中最后的数字（应为内容的 id）
 multipic : 消息是否包含多张图片（仅出现在包含多图的新闻中）
 top_stories : 界面顶部 ViewPager 滚动显示的显示内容（子项格式同上）
 */

#import <Foundation/Foundation.h>

@class ZHLatestNewsStories;
@class ZHLatestNewsTopStories;

@interface ZHLatestNews : JSONModel

@property (readwrite, strong, nonatomic) NSString *date;
@property (readwrite, strong, nonatomic) NSArray<ZHLatestNewsStories *> *stories;
@property (readwrite, strong, nonatomic) NSArray<ZHLatestNewsTopStories *> *topStories;

@end

@interface ZHLatestNewsStories : JSONModel

@property (readwrite, strong, nonatomic) NSString *title;
@property (readwrite, strong, nonatomic) NSArray<NSString *><Optional> *images;
@property (readwrite, strong, nonatomic) NSString *gaPrefix;
@property (readwrite, strong, nonatomic) NSNumber *type;
@property (readwrite, strong, nonatomic) NSNumber *id;
@property (readwrite, strong, nonatomic) NSNumber<Optional> *multipic;

@end

@interface ZHLatestNewsTopStories : JSONModel

@property (readwrite, strong, nonatomic) NSString *title;
@property (readwrite, strong, nonatomic) NSString *image;
@property (readwrite, strong, nonatomic) NSString *gaPrefix;
@property (readwrite, strong, nonatomic) NSNumber *type;
@property (readwrite, strong, nonatomic) NSNumber *id;

@end
