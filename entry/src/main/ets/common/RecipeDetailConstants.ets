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

  static readonly cookTime:string = "5 min";

  static readonly description:string = "西红柿炒鸡蛋，又名番茄炒蛋。是许多百姓家庭中一道普通的大众菜肴。它的烹调方法简单易学，营养搭配合理。在口感方面，它色泽鲜艳，口味宜人，爽口、开胃，深受大众喜爱。"

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

export class

RecipeInfo2{
  static readonly FONT_WEIGHT: number = 500;

  static readonly name_fontBold = FontStyle.Italic;

  static readonly step_fontSize:Number = 100

  static readonly step_fontBold = FontStyle.Normal;

  static readonly recipe_name:string = "鸡蛋炒西红柿";

  static readonly description:string = "西红柿炒鸡蛋，又名番茄炒蛋。是许多百姓家庭中一道普通的大众菜肴。它的烹调方法简单易学，营养搭配合理。在口感方面，它色泽鲜艳，口味宜人，爽口、开胃，深受大众喜爱。"

  static readonly image: Resource = $r('app.media.tomato')

  static readonly cookTime:string = "5 min";

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
    new MenuIngredientInfo("螃蟹", "适量"),
    new MenuIngredientInfo("盐", "适量"),
    new MenuIngredientInfo("雪糕", "适量"),
    new MenuIngredientInfo("油", "适量")
  ]

}