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
    new MenuIngredientInfo("酒", "适量"),
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
    ["蒸锅选择1000瓦，定时10分钟，蒸好将小香葱洗净切碎撒在蒸好的香菇盏上即可","https://st-cn.meishij.net/rs/61/235/12871311/n12871311_153325947547033.jpg","true","10分钟"]
  ];


  static readonly ingredients: Array<MenuIngredientInfo> = [
    new MenuIngredientInfo("番茄", "2个"),
    new MenuIngredientInfo("鸡蛋", "3个"),
    new MenuIngredientInfo("姜葱蒜末", "适量"),
    new MenuIngredientInfo("螃蟹", "适量"),
    new MenuIngredientInfo("盐", "适量"),
    new MenuIngredientInfo("雪糕", "适量"),
    new MenuIngredientInfo("油", "适量")
  ]

}