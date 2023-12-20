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

  static readonly recipe_name:string = "番茄杂菜猪蹄锅";

  static readonly image: string = 'https://st-cn.meishij.net/rs/44/110/4152544/n4152544_152939231594611.jpg'

  static readonly cookTime:string = "60 min";

  static readonly description:string = "夏季的专属火锅，补钙、美容一锅搞定，老少咸宜，还特别适合女士、小朋友"

  static readonly steps: Array<Array<string>> = [
    ["猪蹄用沸水煮去血水","https://st-cn.meishij.net/rs/44/110/4152544/n4152544_152939024065289.jpg","false"],
    ["取用适量的水放入煮过的猪蹄、酒、小许盐","https://st-cn.meishij.net/rs/44/110/4152544/n4152544_152939024436274.jpg","false"],
    ["把猪蹄煮至软熟，约1小时，捞出猪蹄待用","https://st-cn.meishij.net/rs/44/110/4152544/n4152544_152939025591300.jpg","true","60分钟"],
    ["各式蔬菜洗好","https://st-cn.meishij.net/rs/44/110/4152544/n4152544_152939029983102.jpg","false"],
    ["取一个锅，加入清水，倒入一包番茄火锅底料","https://st-cn.meishij.net/rs/44/110/4152544/n4152544_152939030802229.jpg","false"],
    ["把番茄火锅底料与水煮至均匀","https://st-cn.meishij.net/rs/44/110/4152544/n4152544_152939030802229.jpg","false"],
    ["把猪蹄倒入番茄火锅底料煮好的汁里，加入糖与盐","https://st-cn.meishij.net/rs/44/110/4152544/n4152544_152939231198644.jpg","false"],
    ["一边把番茄猪蹄火锅材料加热，一边把蔬菜烫熟，与猪蹄一起食用","https://st-cn.meishij.net/rs/44/110/4152544/n4152544_152939231594611.jpg","false"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("猪蹄", "1500克"),
    new MenuIngredientInfo("豆芽", "50克"),
    new MenuIngredientInfo("生菜", "200克"),
    new MenuIngredientInfo("玉米", "300克"),
    new MenuIngredientInfo("杂菇", "300克"),
    new MenuIngredientInfo("白糖", "适量"),
    new MenuIngredientInfo("盐", "适量"),
    new MenuIngredientInfo("糖", "适量"),
    new MenuIngredientInfo("料酒", "适量"),
    new MenuIngredientInfo("水", "适量"),
  ]

}

export class RecipeInfo2{
  static readonly recipe_name:string = "香菇蒸虾盏";

  static readonly description:string = "香菇，高蛋白，低脂高蛋白、低脂肪菌类食物。香菇因为伞下褶皱多，做前一定要处理干净。首先买来直接用剪刀将香菇长长的柄又叫蒂头剪掉，可以全部剪掉，也可以部分剪掉。然后准备一盆新水，水里加点盐，香菇伞朝下泡十分钟，脏东西很多都被泡出来。";

  static readonly image: string = "https://st-cn.meishij.net/rs/61/235/12871311/n12871311_153325948639598.jpg";

  static readonly cookTime:string = "30 min";

  static readonly steps: Array<Array<string>> = [
    ["选择新鲜的对虾，洗净沥干水份","https://st-cn.meishij.net/rs/61/235/12871311/n12871311_153325935669834.jpg","false"],
    ["虾去头、去尾、去虾线，剁碎、加葱姜末,加料酒去腥味,加生抽、盐、白胡椒拌匀","https://st-cn.meishij.net/rs/61/235/12871311/n12871311_153325937645263.jpg","false"],
    ["胡萝卜去皮切碎末，加入虾皮馅里,调匀馅料就准备好了","https://st-cn.meishij.net/rs/61/235/12871311/n12871311_153325946022311.jpg","false"],
    ["香菇洗净去掉香菇蒂,将处理好的虾泥填入香菇中","https://st-cn.meishij.net/rs/61/235/12871311/n12871311_153325946968004.jpg","false"],
    ["来盘一起放入蒸锅","https://st-cn.meishij.net/rs/61/235/12871311/n12871311_153325947329246.jpg","false"],
    ["蒸锅选择1000瓦，定时10分钟，蒸好撒上葱末","https://st-cn.meishij.net/rs/61/235/12871311/n12871311_153325947547033.jpg","true","10分钟"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("虾", "7个"),
    new MenuIngredientInfo("胡萝卜", "半根"),
    new MenuIngredientInfo("香菇", "6朵"),
    new MenuIngredientInfo("生抽", "适量"),
    new MenuIngredientInfo("盐", "适量"),
    new MenuIngredientInfo("料酒", "适量"),
    new MenuIngredientInfo("油", "适量"),
    new MenuIngredientInfo("葱", "少许"),
  new MenuIngredientInfo("姜", "少许")
  ]

}

export class RecipeInfo3{
  static readonly recipe_name:string = "香辣蟹";

  static readonly description:string = "香辣蟹是一道四川省经典的传统名菜，属川菜系。用肉蟹辅以葱、姜、花椒、干辣椒等制成的佳肴。本菜香、辣、鲜、脆，味道鲜美，营养丰富。";

  static readonly image: string = "https://st-cn.meishij.net/rs/41/203/113291/n113291_154088972884178.jpg";

  static readonly cookTime:string = "30 min";

  static readonly steps: Array<Array<string>> = [
    ["螃蟹洗净","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088928199795.jpg","false"],
    ["葱切段","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088928852110.jpg","false"],
    ["姜切末","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088930482907.jpg","false"],
    ["洋葱切成片","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088931204217.jpg","false"],
    ["螃蟹切块","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088932209842.jpg","false"],
    ["玉米淀粉和螃蟹搅匀","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088939799159.jpg","false"],
    ["起锅烧油放入螃蟹，将螃蟹煎至金黄","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088947212178.jpg","false"],
    ["将麻椒、干辣椒、姜末大火爆香倒入香辣酱和洋葱翻炒均匀","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088964852166.jpg","false"],
    ["最后加入螃蟹和盐翻炒均匀","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088969901839.jpg","false"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("螃蟹", "1个"),
    new MenuIngredientInfo("麻椒", "3克"),
    new MenuIngredientInfo("香辣酱", "5克"),
    new MenuIngredientInfo("干辣椒", "10克"),
    new MenuIngredientInfo("玉米淀粉", "10克"),
    new MenuIngredientInfo("葱", "5克"),
    new MenuIngredientInfo("油", "50毫升"),
    new MenuIngredientInfo("姜", "3克")
  ]

}

export class RecipeInfo4{
  static readonly recipe_name:string = "黄瓜蛋汤";

  static readonly description:string = "黄瓜鸡蛋汤是一道十分常见的家常菜。黄瓜含有多种重要的矿物质和维生素";

  static readonly image: string = "http://images.meishij.net/p/20120822/2ca682cb7565b23a63df0937694a80ca.jpg";

  static readonly cookTime:string = "3 min";

  static readonly steps: Array<Array<string>> = [
    ["黄瓜去头去尾、切片","http://images.meishij.net/p/20120822/dd266e0648a932f93782feaf3ef61308.jpg","false"],
    ["鸡蛋打入碗中、放入适量水淀粉所谓水淀粉就是弄个碗放点淀粉、弄一点点水调开","http://images.meishij.net/p/20120822/6a6c0df66e8036b3a0be2107c247bfcf.jpg","false"],
    ["鸡蛋打匀","http://images.meishij.net/p/20120822/cf0a8e0e508312200b26d52881740a41.jpg","false"],
    ["清水入锅烧开、有条件可以用高汤代替清水……口感会更好、放入黄瓜、煮开","http://images.meishij.net/p/20120822/8b60a97ff2c2818883ebc2eb1e6dd8bb.jpg","false"],
    ["蛋液线状倒入翻滚的水面","http://images.meishij.net/p/20120822/b6a59524c304f9208dcfaea687ec3a10.jpg","false"],
    ["搅匀，调入适当盐","http://images.meishij.net/p/20120822/020399570d79eb839feba85a7abc8aca.jpg","false"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("黄瓜", "1根"),
    new MenuIngredientInfo("鸡蛋", "2个"),
    new MenuIngredientInfo("盐", "适量")
    ]
}


export class RecipeInfo5{
  static readonly recipe_name:string = "蟹黄豆腐";

  static readonly description:string = "豆腐和咸蛋黄搭配在一起咸中有香，香中微微有咸。咸蛋黄竟然没有一丝腥气，只有鲜香的味道，和鲜嫩的豆腐就那么很自然的融合，让人吃一口就放不下筷子。";

  static readonly image: string = "https://st-cn.meishij.net/rs/41/203/113291/n113291_154460713729630.jpg";

  static readonly cookTime:string = "10 min";

  static readonly steps: Array<Array<string>> = [
    ["准备嫩豆腐，葱末，咸鸭蛋黄碾碎，开水煮","https://st-cn.meishij.net/rs/41/203/113291/n113291_154460709356090.jpg","false"],
    ["焯水，锅中倒入食用油，倒入咸鸭蛋黄，小火翻炒","https://st-cn.meishij.net/rs/41/203/113291/n113291_154460709785693.jpg","false"],
    ["倒入豆腐，水，翻炒，水淀粉，搅拌","https://st-cn.meishij.net/rs/41/203/113291/n113291_154460711029003.jpg","false"],
    ["加入葱末，即可出锅","https://st-cn.meishij.net/rs/41/203/113291/n113291_154460711749750.jpg","false"],
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("嫩豆腐", "500克"),
    new MenuIngredientInfo("咸蛋黄", "4个"),
    new MenuIngredientInfo("葱", "15克"),
    new MenuIngredientInfo("油", "5毫升"),
    new MenuIngredientInfo("水", "5毫升"),
    new MenuIngredientInfo("盐", "3克"),
    new MenuIngredientInfo("水淀粉", "10克")
  ]

}


export class RecipeInfo6{
  static readonly recipe_name:string = "粉蒸排骨";

  static readonly description:string = "用蒸肉米粉才能做出美味的粉蒸排骨，虽然排骨蒸熟后肥而不腻，软烂入味，但饱吸鲜味的番薯块，才是此菜的精华所在。";

  static readonly image: string = "https://st-cn.meishij.net/rs/41/203/113291/n113291_154088441527291.jpg";

  static readonly cookTime:string = "50 min";

  static readonly steps: Array<Array<string>> = [
    ["小排肉加料酒、老抽、蚝油、腐乳汁、盐、糖、姜、蒜抓匀腌制20分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088423038177.jpg","true","20分钟"],
    ["腌制入味后倒入蒸肉米粉拌匀","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088429572166.jpg","false"],
    ["沸水入锅,蒸30分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088436990900.jpg","true","30分钟"],
    ["出锅撒上葱花即可","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088439139831.jpg","false"],
      ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("小排肉", "600克"),
    new MenuIngredientInfo("蒸肉米粉", "100克"),
    new MenuIngredientInfo("料酒", "10克"),
    new MenuIngredientInfo("老抽", "2克"),
    new MenuIngredientInfo("蚝油", "10克"),
    new MenuIngredientInfo("腐乳汁", "10克"),
    new MenuIngredientInfo("盐", "5克"),
    new MenuIngredientInfo("糖", "5克"),
    new MenuIngredientInfo("蒜", "10克"),
    new MenuIngredientInfo("葱", "10克"),
    new MenuIngredientInfo("姜", "10克")
  ]

}


export class RecipeInfo7{
  static readonly recipe_name:string = "烤箱烤鸡翅";

  static readonly description:string = "用空气炸锅做一道香烤鸡翅，外焦里嫩，腌制的特别入味！";

  static readonly image: string = "https://st-cn.meishij.net/rs/41/203/113291/n113291_154088062766315.jpg";

  static readonly cookTime:string = "30 min";

  static readonly steps: Array<Array<string>> = [
    ["将鸡翅用水浸泡10分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088034841490.jpg","true","10分钟"],
    ["捞出鸡翅加入胡椒粉、孜然粉、料酒、酱油、蜜糖用手抓匀腌制一到两个小时","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088036252840.jpg","true","60分钟"],
    ["将腌制好的鸡翅放在烤盘上放入烤箱中","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088049276089.jpg","false"],
    ["调至230度烤十分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088052112378.jpg","true","10分钟"],
    ["十分钟后拿出鸡翅反正面撒上孜然和蜜糖后放回烤箱","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088053748868.jpg","false"],
    ["最后再烤20分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088056932519.jpg","true","20分钟"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("鸡翅中", "9个"),
    new MenuIngredientInfo("胡椒粉", "3克"),
    new MenuIngredientInfo("孜然粉", "3克"),
    new MenuIngredientInfo("生抽", "20克"),
    new MenuIngredientInfo("糖", "15克"),
    new MenuIngredientInfo("料酒", "20克")
  ]

}


export class RecipeInfo8{
  static readonly recipe_name:string = "油焖大虾";

  static readonly description:string = "菜品色泽枣红亮丽，味香鲜美，鲜嫩微甜，油润适口。 油焖大虾，趁热剥食，细嫩洁白的虾肉，饱满而鲜美，实在妙不可言，让人胃口大开。是鲁菜里面的一道经典的美味佳肴。";

  static readonly image: string = "https://st-cn.meishij.net/rs/41/203/113291/n113291_154089016465246.jpg";

  static readonly cookTime:string = "10 min";

  static readonly steps: Array<Array<string>> = [
    ["将油茶5克、糖3克、红烧酱油5克、原汁酱油5克、蚝油3克、盐3克倒入碗中，调好酱汁备用","https://st-cn.meishij.net/rs/41/203/113291/n113291_154089009985339.jpg","false"],
    ["锅中倒油，放入葱蒜，倒入大虾，大火煎至两面金黄","https://st-cn.meishij.net/rs/41/203/113291/n113291_154089011503831.jpg","false"],
    ["倒入调料，加盖焖3分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154089012687106.jpg","true","03分钟"],
    ["大火收汁出锅","https://st-cn.meishij.net/rs/41/203/113291/n113291_154089014657531.jpg","false"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("茶油", "5克"),
    new MenuIngredientInfo("青虾", "500克"),
    new MenuIngredientInfo("糖", "3克"),
    new MenuIngredientInfo("红烧酱油", "5克"),
    new MenuIngredientInfo("原汁酱油", "5克"),
    new MenuIngredientInfo("耗油", "3克"),
    new MenuIngredientInfo("油", "8毫升"),
    new MenuIngredientInfo("盐", "3克"),
    new MenuIngredientInfo("葱", "适量"),
  new MenuIngredientInfo("姜", "适量")
  ]

}


export class RecipeInfo9{
  static readonly recipe_name:string = "猪蹄汤";

  static readonly description:string = "猪蹄含有丰富的蛋白质、脂肪、碳水化合物，还含有钙、磷、镁、铁等多种微量元素以及大量的维生素，孕妇适当的吃一些猪蹄可以增强免疫力，还能够起到美容养颜的作用。";

  static readonly image: string = "https://st-cn.meishij.net/rs/41/203/113291/n113291_154337725012787.jpg";

  static readonly cookTime:string = "60 min";

  static readonly steps: Array<Array<string>> = [
    ["胡萝卜1根去皮后切滚刀块，切10g葱段、5g姜片、玉米1根切圈、猪蹄1个切块","https://st-cn.meishij.net/rs/41/203/113291/n113291_154337701444314.jpg","false"],
    ["碗中倒入黄豆50g，倒入水150ml浸泡15分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154337709561000.jpg","true","15分钟"],
    ["猪蹄冷水下锅，倒入料酒5g，焯水去腥去血沫","https://st-cn.meishij.net/rs/41/203/113291/n113291_154337714289038.jpg","false"],
    ["锅中倒入猪蹄， 倒入黄豆、葱段、姜片大火煮沸后倒入玉米和胡萝卜","https://st-cn.meishij.net/rs/41/203/113291/n113291_154337720881490.jpg","false"],
    ["小火慢炖30分钟出锅","https://st-cn.meishij.net/rs/41/203/113291/n113291_154337723048053.jpg","true","30分钟"],
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("猪蹄", "1个"),
    new MenuIngredientInfo("胡萝卜", "1根"),
    new MenuIngredientInfo("玉米", "1根"),
    new MenuIngredientInfo("黄豆", "50克"),
    new MenuIngredientInfo("葱", "10克"),
    new MenuIngredientInfo("料酒", "5克"),
    new MenuIngredientInfo("姜", "5克"),
    new MenuIngredientInfo("水", "适量")
  ]

}


export class RecipeInfo10{
  static readonly recipe_name:string = "南瓜粥";

  static readonly description:string = "南瓜中含有丰富的锌，参与人体内核酸、蛋白质的合成，是肾上腺皮质激素的固有成分，为人体生长发育的重要物质。";

  static readonly image: string = "https://st-cn.meishij.net/rs/41/203/113291/n113291_154088983581362.jpg";

  static readonly cookTime:string = "60 min";

  static readonly steps: Array<Array<string>> = [
    ["取大米100克倒入碗中，加水直至没过大米，淘洗浸泡20分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088974983944.jpg","true","20分钟"],
    ["另取锅加入清水1.5升，倒入大米，倒入南瓜条100克,大火煮5分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088976917783.jpg","true","05分钟"],
    ["加盖焖煮20分钟","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088977796165.jpg","true","20分钟"],
    ["煮熟盛碗即可享用","https://st-cn.meishij.net/rs/41/203/113291/n113291_154088978479771.jpg","false"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("南瓜", "100克 "),
    new MenuIngredientInfo("大米", "适量"),
    new MenuIngredientInfo("水", "适量")
  ]

}

export class RecipeInfo11{
  static readonly recipe_name:string = "番茄炒蛋";

  static readonly description:string = "西红柿炒蛋是家常菜肴之一，不仅简单易操作且口感鲜美。它外观诱人、色泽艳丽、口味清淡回甘，老少皆宜。";

  static readonly image: string = "https://exp-picture.cdn.bcebos.com/ad121888912ca5cadf286dfc8bfc77f7990e9414.jpg?x-bce-process=image%2Fresize%2Cm_lfit%2Cw_500%2Climit_1%2Fformat%2Cf_auto%2Fquality%2Cq_80";

  static readonly cookTime:string = "15 min";

  static readonly steps: Array<Array<string>> = [
    ["鸡蛋处理，把鸡蛋磕到碗中，用筷子使劲搅打，把蛋黄，蛋清搅到均匀混合为止","https://exp-picture.cdn.bcebos.com/274e9635dd8a59de56c775b5b370d5413b8c8414.jpg?x-bce-process=image%2Fresize%2Cm_lfit%2Cw_500%2Climit_1%2Fformat%2Cf_auto%2Fquality%2Cq_80","false"],
    ["西红柿洗净，切成片状，待用","https://exp-picture.cdn.bcebos.com/890dfb4a2f27e7ef0cc696b519dd3340b7f3f514.jpg?x-bce-process=image%2Fresize%2Cm_lfit%2Cw_500%2Climit_1%2Fformat%2Cf_auto%2Fquality%2Cq_80","false"],
    ["把锅预热，加入油，油烧热后，把准备好的鸡蛋放入，翻炒，炒熟后，装盘待用","https://exp-picture.cdn.bcebos.com/bfa52adaf05e4a234cb103a91dd818196020e214.jpg?x-bce-process=image%2Fresize%2Cm_lfit%2Cw_500%2Climit_1%2Fformat%2Cf_auto%2Fquality%2Cq_80","false"],
    ["另起锅，加入油，油热后，加入西红柿，放入盐，继续翻炒，西红柿变软，流汁时，把前面做好的鸡蛋放入，翻炒","https://exp-picture.cdn.bcebos.com/739bc049610f8b56ebc4d3dc9ce951e10ff8d314.jpg?x-bce-process=image%2Fresize%2Cm_lfit%2Cw_500%2Climit_1%2Fformat%2Cf_auto%2Fquality%2Cq_80","false"],
    ["继续翻炒一会，撒入葱花，起锅即可！OK！西红柿炒鸡蛋大功告成", "https://exp-picture.cdn.bcebos.com/116b1ae23ea23a42f7ba5da43733ec3835bbc014.jpg?x-bce-process=image%2Fresize%2Cm_lfit%2Cw_500%2Climit_1%2Fformat%2Cf_auto%2Fquality%2Cq_80", "false"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("番茄", "3个 "),
    new MenuIngredientInfo("鸡蛋", "2个"),
    new MenuIngredientInfo("葱", "适量"),
  new MenuIngredientInfo("盐", "适量"),
  new MenuIngredientInfo("油", "适量")
  ]
}

export class RecipeInfo12{
  static readonly recipe_name:string = "清蒸螃蟹";

  static readonly description:string = "螃蟹是鲜美的海鲜，要多加1步清蒸，不要直接上锅蒸，否则会掉腿不流黄，鲜嫩美味。";

  static readonly image: string = "https://i2.chuimg.com/65876d0e88c211e6b87c0242ac110003_493w_493h.jpg?imageView2/2/w/660/interlace/1/q/75";

  static readonly cookTime:string = "30 min";

  static readonly steps: Array<Array<string>> = [
    ["将活螃蟹放入凉水中，放养十几分钟，洗净螃蟹身上的沙粒","https://i2.chuimg.com/d67249188fc911e6a9a10242ac110002_427w_428h.jpg?imageView2/2/w/300/interlace/1/q/75","true", "15分钟"],
    ["用牙刷仔细刷干净螃蟹，肚皮朝上，撒少许盐，放入蒸锅内，大约蒸15分钟左右","https://i2.chuimg.com/d6ade7348fc911e6a9a10242ac110002_523w_523h.jpg?imageView2/2/w/300/interlace/1/q/75","true", "15分钟"],
    ["蘸料汁:姜末，醋的调和汁","https://i2.chuimg.com/d6e225e48fc911e6a9a10242ac110002_207w_207h.jpg?imageView2/2/w/300/interlace/1/q/75","false"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("螃蟹", "若干"),
    new MenuIngredientInfo("醋", "适量"),
    new MenuIngredientInfo("姜", "适量"),
  ]
}