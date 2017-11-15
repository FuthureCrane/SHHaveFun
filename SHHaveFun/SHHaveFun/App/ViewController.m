//
//  ViewController.m
//  SHHaveFun
//
//  Created by Futhure on 2017/11/13.
//  Copyright © 2017年 SHHaveFun. All rights reserved.
//

#import "ViewController.h"
#import "SHAutoScrollController.h"
#import "CalendarViewController.h"
#import "VIKTransformViewController.h"
#import "T4LineViewController.h"

NSString *const api1 = @"https://interface.meiriyiwen.com/article/today?dev=1";

@interface ViewController ()

@end

@implementation ViewController

// MARK: 每日一文
//data =     {
//    author = "村上龙";
//    content = "<p>“当网球比赛的警卫很轻松。”</p><p>麦迪逊广场花园的警卫说。</p><p>“我们的主要工作，就是把黑人黄牛从售票处赶出去，如果是冰棍球或篮球比赛，就很难区分谁是黄牛谁是观众了。但网球比赛就不一样了，即使是买最便宜门票的观众，该怎么说，感觉都很优雅。而且，也很少有黑人看网球。”</p><p>门票按照价格的高低，依次分为红色、橘色、黄色、绿色和蓝色。门票和座位的颜色相同。比方说，最远的蓝色座位看到的选手，就和火柴棒差不多。</p><p>我的票是红色的，而且是双人用的，名为“小屋”的包厢。这张票可以连续使用七天，索价七百美金。</p><p>两个月前，也曾经举行过类似的网球比赛，我请住在纽约的朋友帮我张罗门票。当时，他买的是绿色门票，我还抱怨他，我从日本千里迢迢赶过来，竟然帮我订这么差的门票。你也算是住在纽约的人，难道不知道哪一种门票的座位在哪里吗？</p><p>这次，朋友帮我订了包厢座位，说：“这次的门票包君满意。”</p><p>我苦笑着交给他七百美金。</p><p>这张双人用的包厢座位和日本棒球场的贵宾席一样，通常都是公司用来招待客户的。座位前方挂着写有名字的牌子，我的旁边是美国大通银行，后方是佩恩.韦伯，前面是新泽西富士经销商。我的座位上当然写着我的名字，但和这些大公司、大银行名字排在一起，令我有一种奇怪的感觉。</p><p>第三天，我像往常一样，买了百威啤酒走向座位时，看到一个身穿黑衣服的老人坐在那里。</p><p>场内有身穿红外套、系领带的验票员，她们会把客人带到座位，收走门票。如果不想付小费，自行寻找座位坐下后，验票员就会要求观众出示门票。</p><p>克里斯.埃弗特和玛蒂娜.纳芙拉蒂洛娃等著名选手都会比较晚出场比赛，场内还有许多空位。老人身上的衣服虽然有点皱，但还是穿上了黑色礼服。难道是因为老人，那些验票员就睁一只眼闭一只眼吗？</p><p>“这里是我的座位。”</p><p>我出示了红色门票，对老人说。老人瞥了我一眼，坐去三排前的座位。当玛蒂娜.纳芙拉蒂洛娃上场比赛时，观众渐渐多了，老人又被赶走，转移向其他的座位。在玛蒂娜.纳芙拉蒂洛娃比赛期间，老人已经转移了四次阵地。</p><p>克里斯.埃弗特上场时，老人已经没有座位可以坐了。当包厢座位坐满人时，老人的黑色礼服格外引人注目。无论美国大通银行，还是新泽西富士经销商，都没有人穿邹巴巴的黑色礼服。由于是春天，又是热闹的女子网球赛，观众都穿着色彩缤纷的毛衣、衬衫或是外套，好好装扮自己。</p><p>老人四处张望着寻找空位，验票员走了过来。当老人出示最廉价的蓝色门票时，验票员好像赶乞丐似的挥了挥手。</p><p>“你要不要坐这里？”</p><p>老人走过我身旁时，我对他说。原本约好同来的朋友因为工作分身乏术，两人用的包厢座位上，只有我一个人，用沙哑的声音向我道谢。他手上拿着超市的纸袋，和看起来已经用了十年、伞柄已经很旧的雨伞。</p><p>我以为他对网球情有所钟，却发现事实并不是这么一回事。即使克里斯.埃弗特打了好球，他也从来不拍手，也没有为对方选手加油。他在看球时，脸上面无表情。</p><p>“克里斯.埃弗特应该会赢。”</p><p>即使听到我这么说，他也只有挪动一下眉毛而已。</p><p>克里斯.埃弗特轻松拿下第一局时，老人说了声“抱歉”，便站了起来。</p><p>我以为他回家了，没想到他拿了两个热狗回来，然后递给我一根。我拿出钱包准备付钱，他对我摇了摇头。</p><p>热狗里夹了很多切细的高丽酸菜，满满的芥末几乎盖住了番茄酱。</p><p>当我们吃着热狗，相视而望时，老人第一次露出了微笑。</p><p>“你几岁了？”</p><p>老人问我。我回答三十四岁，他说我看起来只有二十四岁。然后，他又笑了笑，嘴角的皱纹上，沾上一坨番茄酱和芥末。</p><p>“日本人看起来比实际年龄年轻。”我说。</p><p>“你住在这里吗？”</p><p>“不，我是来旅行的。”</p><p>饥肠辘辘的我无法靠一个热狗填饱肚子，于是，我决定去买一种名叫普立兹的咸面包。那是一种很普通的面包，街头小店也有在卖。密度很高，好像把一般的食用面包压紧的感觉。拉得细细长长后，扭一下，打一个结，烤的时候，在表面撒上粗粒的岩盐。</p><p>我打算买两个，老人摇摇手拒绝了。</p><p>“谢谢，我不太喜欢吃那个。”</p><p>他以为我不高兴了，赶紧补充说：“那是犹太人的面包。”</p><p>然后，他又告诉我：“我是从罗马尼亚来的犹太人，在马赛住了十年。”</p><p>“罗马尼亚的吸血鬼很有名。”</p><p>“我不知道，那是什么？”</p><p>“就是吸血鬼，会吸人的血。”</p><p>“我没听说过。”</p><p>“听说好像住在罗马尼亚的特兰斯瓦尼亚。”</p><p>“我不知道，不过，罗马尼亚本身就是个乡下地方。”</p><p>老人沉默了片刻，但他的视线并没有追随网球。</p><p>“你觉得热狗和普立兹面包哪一个比较好吃？”</p><p>他一边用纸巾擦嘴巴，一边问。</p><p>“差不多吧。”</p><p>“你不觉得看运动比赛时，热狗特别好吃吗？”</p><p>“而且要在大太阳底下。”</p><p>“配上冰冰的啤酒。”</p><p>“对啊。”</p><p>“日本也有热狗吗？”</p><p>“美国的比较好吃。”</p><p>“我也这么觉得。”</p><p>大太阳下，看网球和足球比赛时，热狗顿时摇身一变，成为无可取代的食物。吃的时候并没有这种感觉，只是在日后，在远离太阳和运动时，他才会变成一种幸福感的象征，回味无穷。那不是大脑、舌头或是胃而已，而是全身都在回味这种感觉。</p><p>“二十年前，我坐船从马赛来到美国。之前，我抛下妻子，从罗马尼亚到了马赛，在马赛时，和一个芬兰女人住在一起，生了一个儿子。我们一家三口来到纽约，当时，我儿子十一岁，被移民局关了一星期左右。之后，我们曾经一起去过一次洋基球场，我们三个人一起吃热狗。你或许不相信，那是我有生以来第一次吃热狗。香肠、面包、番茄酱和芥末在嘴里混合在一起的味道，真的是妙不可言。我一直在开出租车，只要经济稍微宽裕一点，我们三个人就一起去洋基球场吃热狗。”</p><p>“现在还去吗？”我问。老人垂着眼睛说：“我太太死了。”当我问到他儿子时，他一言不发地摇摇头。于是，我不再问他家人的事。</p><p>克里斯.埃弗特获胜之后，还有一场比赛，老人却站了起来。超市的袋里放着香烟、鱼罐头和牙膏。</p><p>“很高兴可以和你一起吃热狗。”握手时，老人说道。</p><p>“你喜欢打网球吗？”最后，我问他。</p><p>老人却回答说：</p><p>“不，我讨厌网球。但我儿子喜欢，他很喜欢一个名叫伊利耶.纳斯塔塞的罗马尼亚冠军选手，我只是想来看看到底是怎么回事。”</p><p>说着，老人离开红色座位区回家了。</p>";
//    date =         {
//        curr = 20171114;
//        next = 20171115;
//        prev = 20171113;
//    };
//    digest = "“当网球比赛的警卫很轻松。”麦迪逊广场花园的警卫说。“我们的主要工作，就是把黑人黄牛从售票处赶出去，如果是冰棍球或篮球比赛，就很难区分谁是黄";
//    title = "热狗";
//    wc = 2411;
//};
//
//特定某天一文
//
//url：https://interface.meiriyiwen.com/article/day?dev=1&date= + 日期
//
//url 示例：https://interface.meiriyiwen.com/article/day?dev=1&date=20170216
//
//json 示例以及解析同每日一文
//
//随机一文
//
//url：https://interface.meiriyiwen.com/article/random?dev=1
//date：日期
//curr：今日日期，yyyyMMdd 格式
//prev：昨日日期，yyyyMMdd 格式
//next：明日日期，yyyyMMdd 格式
//author：作者
//titile：标题
//digest：首段
//content：正文内容
//wc：字数(word count)

// MARK: 有道

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    let manager = [AFHTTPSessionManager manager];
    
    [manager GET:api1 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
//    SHAutoScrollController *sv = [[SHAutoScrollController alloc] init];
//    CalendarViewController *sv = [[CalendarViewController alloc] init];
//    let sv = [[VIKTransformViewController alloc] init];
    let sv = [[T4LineViewController alloc] init];
    [sv setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:sv animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
