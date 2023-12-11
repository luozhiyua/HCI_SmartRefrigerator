/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { DEFAULT } from '@ohos/hypium'
import { MenuIngredientInfo } from '../model/DataModels'


export let CIRCLE_RADIUS: number = 80

export class RecipeInfo1{
  static readonly FONT_WEIGHT: number = 500;

  static readonly name_fontBold = FontStyle.Italic;

  static readonly step_fontSize:Number = 100

  static readonly step_fontBold = FontStyle.Normal;

  static readonly recipe_name:string = "西红柿炒鸡蛋";

  static readonly image: Resource = $r('app.media.menu_tomatoEgg')

  static readonly steps: Array<string> = [
    "西红柿洗净，切成小块；鸡蛋打散备用。",
    "热锅凉油，将鸡蛋液煎至金黄色捞出沥干备用。",
    "将锅中余油留少许，放入葱姜蒜末爆香。",
    "加入西红柿翻炒至断生。",
    "加入少许盐、白糖调味，继续翻炒至快出汁时加入鸡蛋，快速搅拌均匀即可起锅。"
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("番茄", "2个"),
    new MenuIngredientInfo("鸡蛋", "3个"),
    new MenuIngredientInfo("姜葱蒜末", "适量"),
    new MenuIngredientInfo("生抽", "适量"),
    new MenuIngredientInfo("盐", "适量"),
    new MenuIngredientInfo("白糖", "适量"),
    new MenuIngredientInfo("油", "适量")
  ]

}

export class RecipeInfo2{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = "蒸水蛋";
  static readonly image: Resource = $r('app.media.menu2')
  static readonly steps: Array<string> = [
    '将两只鸡蛋打入蒸碗中，将鸡蛋打散。',
    '加入1/2茶匙盐、少许酱油、油打发均匀。',
    '加入约280毫升温水，一边加水一边顺时针搅拌均匀。',
    '用勺子把浮在表面的泡泡舀走。',
    '蒸锅中放入适量水，烧开。水开后把蛋放入。大火蒸约10分钟。',
    '开盖撒上少许葱花再盖上盖子利用余温焗一焗。',
    '取出，用勺子在表面淋上少许酱油。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('鸡蛋', '2个'),
    new MenuIngredientInfo('盐', '1/2茶匙'),
    new MenuIngredientInfo('酱油', '少许'),
    new MenuIngredientInfo('油', '3滴'),
    new MenuIngredientInfo('温水', '约280毫升'),
    new MenuIngredientInfo('葱花', '少许'),
    new MenuIngredientInfo("油", "适量")
  ]
}

export class RecipeInfo3{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '红烧牛肉土豆';
  static readonly image: Resource = $r('app.media.menu3')
  static readonly steps: Array<string> = [
    '把牛肉泡在冷水里半小时到一小时泡出血水，再洗干净，倒入料酒、生抽、老抽腌制十分钟左右（最好选用肥瘦相间的牛肉，牛腩也可以但炖煮时间要加长至少半小时）',
   '分别把胡萝卜、土豆去皮切块，西红柿切块、洋葱切成条状。再切好葱、姜、蒜。',
    '热锅倒油。油热后，放入切好的葱姜蒜爆香，加入干辣椒段。倒入腌制好的牛肉，翻炒片刻，加入八角、料酒、少许生抽老抽。',
    '待牛肉上色均匀后，把洋葱丝、西红柿块倒入锅中。翻炒均匀，最好能用锅铲捣压一下西红柿，使西红柿能软化容易些。',
    '翻炒几分钟后，加入热开水以淹没牛肉为主。盖上锅盖，烧开后转小火炖30分钟。（如果是牛腩的话，此处小火炖1小时或者高压锅压一下）',
    '30分钟过后，加入土豆块和红萝卜块，大火烧开后，再转小火，盖上锅盖炖15分钟左右。',
    '15分钟左右过去后，揭开锅盖，根据个人口味加入适当的盐，点几滴美极鲜酱油提味或少许鸡精  (也可以不用调味料，本身已经已经很鲜了。我没加味精或鸡精，味道真的已经很鲜了）。',
    '调味好后，转大火收汁，用锅铲搅动以免粘锅。看汤汁收的差不多时，关火，加入葱花摆盘上桌。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('牛肉', '两人量'),
    new MenuIngredientInfo('土豆', '1个'),
    new MenuIngredientInfo('洋葱', '半个'),
    new MenuIngredientInfo('西红柿', '1个'),
    new MenuIngredientInfo('胡萝卜', '1条'),
    new MenuIngredientInfo('八角', '两小块'),
    new MenuIngredientInfo('干辣椒', '两小只'),
  new MenuIngredientInfo('葱', '适量'),
  new MenuIngredientInfo('姜', '适量'),
  new MenuIngredientInfo('蒜', '适量')
  ]
}

export class RecipeInfo4{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '油焖大虾';
  static readonly image: Resource = $r('app.media.menu4')
  static readonly steps: Array<string> = [
    '虾先去虾线，沿虾背剪开，挑出来即可',
    '锅中倒入植物油，量略多，烧8成热，然后将虾倒进油锅煎至虾变色',
    '虾取出，然后留底油，放入蒜末，番茄酱，白糖翻炒出香味',
    '然后将虾倒进锅中，淋料酒，耗油，食盐适量，放入葱段，盖锅盖闷1—2分钟即可',
    '然后摆盘就可以吃啦'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('虾', '若干只'),
    new MenuIngredientInfo('葱', '一根'),
    new MenuIngredientInfo('番茄酱', '少许'),
    new MenuIngredientInfo('白糖', '少许'),
    new MenuIngredientInfo('料酒', '适量'),
    new MenuIngredientInfo('食盐', '少许'),
    new MenuIngredientInfo('耗油', '少许'),
  ]
}

export class RecipeInfo5{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '可乐鸡翅';
  static readonly image: Resource = $r('app.media.menu5')
  static readonly steps: Array<string> = [
    '8个鸡翅洗净，正反面都斜切2刀开口。',
    '鸡翅中加4片姜的姜丝、1勺料酒、半勺老抽、半勺生抽和少许盐，腌制20分钟后，入冷水锅中焯水，煮沸后捞出，擦干水分备用。一般肉类的都要先焯水去除血水，但可乐鸡翅要腌制更加适合先腌制后焯水，不然鸡翅不容易腌制入味。',
    '热锅热油，下鸡翅煎至两面金黄，加入1勺料酒、半勺老抽、半勺生抽翻炒至鸡翅均匀上色。',
    '倒入1罐可乐（330ml）煮沸，转中小火加盖焖10分钟后，开盖转大火收汁。收汁时需不停搅拌，避免糊掉，如果不喜欢太甜的口味，可加入适量盐来中和甜味。',
    '留少许汤汁后关火盛出，撒上适量熟白芝麻。',
    '可乐鸡翅完成！'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('鸡翅', '8个'), new MenuIngredientInfo('姜', '4片'), new MenuIngredientInfo('料酒', '2勺'), new MenuIngredientInfo('老抽', '1勺'), new MenuIngredientInfo('生抽', '1勺'), new MenuIngredientInfo('盐', '少许'), new MenuIngredientInfo('可乐', '1罐'), new MenuIngredientInfo('熟白芝麻', '适量')
  ]
}

export class RecipeInfo6{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '红烧鸡腿';
  static readonly image: Resource = $r('app.media.menu6')
  static readonly steps: Array<string> = [
    '鸡腿洗净每个划两道。加一点料酒和盐腌十分钟',
    '放油。加生姜大蒜大料煸香。下鸡腿爆炒3-5分钟',
    '鸡腿有香味后放生抽两锅铲，老抽1.5锅铲。白糖两汤匙。放一小碗水。火稍微小一点。炖煮。',
    '差不多15-20分钟水比较少了（最后几分钟最好看着防止水烧没了）开大火翻炒收汁。完成。',
    '可凭自己口味加香料。我在最后加了一点黑胡椒碎和百里香。非常增香和提味。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('虾', '若干只'),
    new MenuIngredientInfo('葱', '一根'),
    new MenuIngredientInfo('番茄酱', '少许'),
    new MenuIngredientInfo('白糖', '少许'),
    new MenuIngredientInfo('料酒', '适量'),
    new MenuIngredientInfo('食盐', '少许'),
    new MenuIngredientInfo('耗油', '少许')
  ]
}

export class RecipeInfo7{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '干锅花菜';
  static readonly image: Resource = $r('app.media.menu7')
  static readonly steps: Array<string> = [
    '五花肉切片，花菜洗净切开小朵，然后焯水捞出备用，辣椒切长段，大蒜切片。',
    '热锅凉油，油三成热，放入五花肉，慢慢焙出油。',
    '肉炒好后，加入红干辣椒和大蒜片翻炒。',
    '加入花菜，青辣椒翻炒，由于花菜焯过水，所以炒的时间不易过长。',
    '待花菜边缘略微有一点点焦加入一点老抽调色，一点糖和适量盐和味精，出锅即可。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('花菜', '一个'), new MenuIngredientInfo('五花肉', '少许'), new MenuIngredientInfo('干辣椒', '4个'), new MenuIngredientInfo('大蒜', '2瓣'), new MenuIngredientInfo('青辣椒', '2个')
  ]
}

export class RecipeInfo8{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '滑蛋虾仁';
  static readonly image: Resource = $r('app.media.menu8')
  static readonly steps: Array<string> = [
    '虾仁用少许盐混合均匀放置5分钟，然后将盐洗去（用盐先抓洗一下就可以洗去表面的黏液，这样炒出来的虾仁才会清脆好吃)；用厨房纸将水分吸干虾仁，如果没有吸干水分，腌制的时候不容易附着腌料。',
    '擦干的虾仁加盐、料酒、蛋白搅拌均匀后，再下玉米淀粉拌匀腌制片刻。',
    '鸡蛋打散加入调味料（盐1/2小勺、白胡椒粉少许）混合均匀，香葱切成葱花，水淀粉搅拌均匀准备好；烧一锅滚水，将腌拌好的虾仁入锅，略为汆烫至七分熟（约30秒），备用。',
    '将烫过的虾仁放入蛋液中，加入葱花、水淀粉混合均匀。',
    '起油锅，放入2大勺油，油烧热后，将混合虾仁的蛋汁倒入，一开始不要翻动，感觉蛋液周围开始凝固就用锅铲迅速划圈圈将蛋炒散，等大部分的蛋液一凝固马上关火盛盘，避免蛋炒的太熟不够滑嫩。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('虾仁', '200g'), new MenuIngredientInfo('鸡蛋', '4个'), new MenuIngredientInfo('香葱', '2支'), new MenuIngredientInfo('水淀粉', '3大勺'), new MenuIngredientInfo('盐', '1/2小勺'), new MenuIngredientInfo('料酒', '1小勺'), new MenuIngredientInfo('蛋清', '1大勺'), new MenuIngredientInfo('玉米淀粉', '1小勺'), new MenuIngredientInfo('白胡椒粉', '少许')
  ]
}

export class RecipeInfo9{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '麻婆豆腐';
  static readonly image: Resource = $r('app.media.menu9')
  static readonly steps: Array<string> = [
    '原料切配：豆腐切正方形块状，大小看个人喜好。青葱切葱花，蒜头切成末。肉碎不用腌制，但一定要完全化冻。正宗麻婆豆腐是放牛肉碎。家庭制作可以改为“猪肉碎”也没有问题。郫县豆瓣酱看个人喜好放，我的建议可放多一点点。可以提出问道，也可以让油炒到更红。豆瓣酱也要斩几刀，确保里面的豆瓣不会那么大颗粒影响味道发挥。',
    '煮豆腐：水煮豆腐一定要放一些盐，稍微多一点，一块豆腐煮的时候可放2g左右盐一起煮，这样盐的渗透压会更快逼出豆腐里的水分，而且会让豆腐有一点点的咸味，记得这个程序一定要做，想做出好的麻婆豆腐这是关键步骤。4.豆腐要煮差不多2-3分钟（小火，大火容易滚碎豆腐），差不多豆腐微微有些膨胀了就好了，但别捞出来，泡着先~避免豆腐捞上来后黏在一起。',
    '炒：另外取一口锅，放底油,油温热后先炒肉碎。慢慢炒，炒到肉碎开始微黄，有点发干时加入豆瓣酱炒出红油。出红油后下蒜末炒出香味就可以加水或汤，差不多一块豆腐一小碗汤，煮开汤后加入米酒或花雕酒一小勺，生抽一点点，糖一点点，煮开后试试味道，此时不能味道正合适，要稍微淡一点点，不然烧出来水分挥发后就会很咸。味道调好后加入煮好的豆腐，直接捞出来放进汤汁里，稍微烧一个2-3分钟，待汤汁变少后加入花椒面（自己掌握）。最后用水淀粉勾一个薄芡，再淋入麻油和几滴醋，就完成了炒的部分~',
    '点缀：可点缀葱花，香菜，芝麻等等，随个人喜好。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('豆腐', '1块'), new MenuIngredientInfo('青葱', '1条'), new MenuIngredientInfo('蒜蓉', '2瓣'), new MenuIngredientInfo('牛肉', '肉碎，为豆腐重量的1/10'), new MenuIngredientInfo('郫县豆瓣酱', '1大匙'), new MenuIngredientInfo('酱油（生抽）', '少许'), new MenuIngredientInfo('糖', '少许'), new MenuIngredientInfo('醋', '几滴（最后放）'), new MenuIngredientInfo('花椒面', '0.5-1g（看个人口味）'), new MenuIngredientInfo('麻油', '少许'), new MenuIngredientInfo('花雕酒/米酒', '少许'), new MenuIngredientInfo('淀粉水', '勾芡用')
  ]
}

export class RecipeInfo10{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '韭菜炒鸡蛋';
  static readonly image: Resource = $r('app.media.menu10')
  static readonly steps: Array<string> = [
    '韭菜洗净后切段，鸡蛋在碗内打散后倒入料酒，搅拌均匀',
    '锅热后注入油，倒入蛋液用筷子滑炒至散后盛出备用',
    '锅内重新注入油，7成热时倒入韭菜大火翻炒，调入盐、糖、生抽，大火翻炒20秒后倒入鸡蛋，翻炒5秒即可'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('韭菜', '400g'), new MenuIngredientInfo('鸡蛋', '2个'), new MenuIngredientInfo('盐', '3g'), new MenuIngredientInfo('料酒', '5ml'), new MenuIngredientInfo('生抽', '5ml'), new MenuIngredientInfo('糖', '3g')
  ]
}

export class RecipeInfo11{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '腊肠炒荷兰豆';
  static readonly image: Resource = $r('app.media.menu11')
  static readonly steps: Array<string> = [
    '荷兰豆洗净择去两端的丝儿，腊肠切薄片',
    '锅中放入适量热水，水开后放入荷兰豆汆烫变色，马上捞起浸入冷水中2分钟沥水备用',
    '锅置火上，放入腊肠小火煎至透明，投入荷兰豆大火翻炒几下，加入盐、味精继续翻炒均匀，出锅盛盘即成',
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('腊肠', '100g'), new MenuIngredientInfo('荷兰豆', '200g'), new MenuIngredientInfo('盐', '适量'), new MenuIngredientInfo('味精', '适量')
  ]
}

export class RecipeInfo12{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '蒜蓉西兰花';
  static readonly image: Resource = $r('app.media.menu12')
  static readonly steps: Array<string> = [
    '西兰花掰好，洗净，梗可以切片，用盐水浸泡',
    '烧一锅水，待水开后将西兰花捞出沥水，放入开水中焯烫',
    '剥好大蒜，切蒜末',
    '西兰花开锅变成翠绿色之后，捞出再过一遍凉水。捞出之后沥干',
    '热锅倒油，蒜末爆锅，放西兰花翻炒',
    '临出锅前，放盐'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('西兰花', '适量'), new MenuIngredientInfo('大蒜', '适量'), new MenuIngredientInfo('盐', '适量'), new MenuIngredientInfo('油', '适量')
  ]
}

export class RecipeInfo13{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '清炒芦笋虾仁';
  static readonly image: Resource = $r('app.media.menu13')
  static readonly steps: Array<string> = [
    '鲜虾开背去虾线，剥壳成虾仁，加半勺盐、料酒腌制片刻',
    '芦笋用刨子削去下半段的硬表皮（上半较嫩的部分不用削），斜切成段',
    '起油锅，大火烧热，丢芦笋，丢虾仁（一起丢进去问题也不大），炒至虾仁变红，加一勺盐，再炒一会儿，炒匀即可出锅'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('芦笋', '半斤'), new MenuIngredientInfo('鲜虾', '20只左右'), new MenuIngredientInfo('油', '适量'), new MenuIngredientInfo('盐', '一小勺'), new MenuIngredientInfo('料酒', '少许')
  ]
}

export class RecipeInfo14{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '炒合菜';
  static readonly image: Resource = $r('app.media.menu14')
  static readonly steps: Array<string> = [
    '粉条热水泡三十分钟捞出沥干、倒入一茶勺食用油，一瓶盖老抽拌匀备用，韭菜切段。',
    '蒜切末、小米辣切段，鸡蛋打散煎成型盛出备用。',
    '热油下蒜末小米辣炒香、放入豆芽翻炒两下，接着放入粉条和鸡蛋、翻炒均匀。',
    '调味：放盐、鸡精各半勺、一勺半生抽、半勺蚝油。',
    '粉条炒至透明、下入韭菜段翻炒几下即可。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('绿豆芽', '300g'), new MenuIngredientInfo('红薯粉条', '一把'), new MenuIngredientInfo('鸡蛋', '3个'), new MenuIngredientInfo('蒜末', '适量'), new MenuIngredientInfo('小米辣', '2-3'), new MenuIngredientInfo('韭菜', '5-6根'), new MenuIngredientInfo('盐/鸡精见图量', '各半勺'), new MenuIngredientInfo('蚝油', '半勺'), new MenuIngredientInfo('生抽', '1.5勺')
  ]
}

export class RecipeInfo15{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '清炒虾仁';
  static readonly image: Resource = $r('app.media.menu15')
  static readonly steps: Array<string> = [
    '剥虾小技巧，放冰箱冷冻20分钟拿出来非常好剥。',
    '剥好开背去虾线。',
    '热锅冷油五成热时放入虾仁，一面变红再翻过来煎另一面，直至全部变红，出锅装盘备用。',
    '热锅冷油五成热放胡萝卜炒软。',
    '放木耳黄瓜条炒熟。',
    '放木耳黄瓜条炒熟。',
    '倒入提前准备好的水淀粉快速翻炒，所有菜上都裹了一层薄薄的芡。',
    '装盘出锅。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('虾', '12'), new MenuIngredientInfo('黄瓜', '1根'), new MenuIngredientInfo('胡萝卜', '1根'), new MenuIngredientInfo('木耳', '1把'), new MenuIngredientInfo('淀粉', '1勺'), new MenuIngredientInfo('盐', '1勺'), new MenuIngredientInfo('鸡精', '半勺'), new MenuIngredientInfo('油', '适量')
  ]
}

export class RecipeInfo16{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '宫保鸡丁';
  static readonly image: Resource = $r('app.media.menu16')
  static readonly steps: Array<string> = [
    '准备一块鸡胸肉、一根黄瓜、一根胡萝卜切块备用，一碗花生米，四瓣蒜切碎备用。',
   '鸡胸肉切丁，加一勺料酒、生抽、生粉，抓匀腌制十分钟。',
    '锅中倒油，倒入花生米中小火翻炒四分钟左右，加一勺盐，拌匀盛出备用。',
    '锅中倒油，倒入鸡丁翻炒至变色，加入胡萝卜翻炒三分钟，盛出备用。',
    '锅留底油，爆香蒜末，加入一勺郫县豆瓣酱，中小火炒出红油后，倒入鸡胸肉胡萝卜翻炒。',
    '一勺生抽、两勺醋，两勺糖，加少许清水，调出料汁倒入锅中。',
    '中火煮五分钟左右，倒入黄瓜翻炒一分钟，倒入炒熟花生米，翻炒均匀即可出锅。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('鸡胸肉', '1块'), new MenuIngredientInfo('黄瓜', '1根'), new MenuIngredientInfo('胡萝卜', '1根'), new MenuIngredientInfo('花生米', '1把'), new MenuIngredientInfo('蒜', '4瓣'), new MenuIngredientInfo('生抽', '1'), new MenuIngredientInfo('醋', '2勺'), new MenuIngredientInfo('糖', '2勺'), new MenuIngredientInfo('郫县豆瓣酱', '1勺'), new MenuIngredientInfo('盐', '1勺')
  ]
}

export class RecipeInfo17{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '糖醋排骨';
  static readonly image: Resource = $r('app.media.menu17')
  static readonly steps: Array<string> = [
    '排骨加葱姜料酒下锅焯水。',
    '锅中加油小火下冰糖炒糖色下排骨翻炒。',
    '倒入糖醋汁：一勺料酒 两勺生抽 一勺老抽 两勺白糖 三勺陈醋。',
    '加入葱姜，加水没过排骨中小火焖煮1小时。',
    '大火收汁后撒点白芝麻。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('排骨', '适量')
  ]
}

export class RecipeInfo18{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '土豆炒洋葱';
  static readonly image: Resource = $r('app.media.menu18')
  static readonly steps: Array<string> = [
    '准备土豆、洋葱、青椒，蒜小米辣切碎备用。',
    '锅中倒油爆香蒜末小米辣，倒土豆翻炒两分钟。',
    '倒洋葱翻炒两分钟，倒入青椒炒至断生，加一勺生抽，一勺盐，少许鸡精，炒匀即可出锅。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('土豆', '1个'), new MenuIngredientInfo('洋葱', '1个'), new MenuIngredientInfo('青椒', '2个'), new MenuIngredientInfo('小米辣', '1个'), new MenuIngredientInfo('蒜', '4瓣')
  ]
}

export class RecipeInfo19{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '烤鸡翅';
  static readonly image: Resource = $r('app.media.menu19')
  static readonly steps: Array<string> = [
    '准备鸡翅、烘烤调味料包。',
    '鸡翅开花刀吸干表面水分，鸡翅放入牛皮纸袋内，袋中倒入料粉，摇晃均匀，牛皮纸包裹封口向下，放入空气炸锅中，175度烤25分钟，将袋中汤汁浇在鸡翅表面，即可食用。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('鸡翅', '300克')
  ]
}

export class RecipeInfo20{
  static readonly FONT_WEIGHT: number = 500;
  static readonly name_fontBold = FontStyle.Italic;
  static readonly step_fontSize:Number = 100
  static readonly step_fontBold = FontStyle.Normal;
  static readonly recipe_name:string = '包菜腊肠';
  static readonly image: Resource = $r('app.media.menu20')
  static readonly steps: Array<string> = [
    '准备腊肠、包菜、青椒，蒜小米辣切碎备用。',
    '锅中倒油爆香蒜末小米辣，倒入腊肠炒至变色，倒入包菜翻炒两分钟，加半勺老抽，倒入青椒炒至断生，加一勺盐，炒匀即可出锅。'
  ];
  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo('腊肠', '4根'), new MenuIngredientInfo('包菜', '半颗'), new MenuIngredientInfo('青椒', '1个'), new MenuIngredientInfo('小米辣', '2个'), new MenuIngredientInfo('蒜', '3瓣')
  ]
}
