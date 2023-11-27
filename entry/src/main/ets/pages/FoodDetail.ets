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

import router from '@ohos.router'
import { FoodInfo } from '../model/DataModels'
import { getFoodInfo } from '../model/DataUtil'

@Styles
function cardStyle() {
  .height('100%')
  .padding({ top: 20, right: 20, left: 20 })
  .backgroundColor(Color.White)
  .borderRadius(12)
}

@Component
struct PageTitle {
  build() {
    Row() {
      Image($r('app.media.back'))
        .width(20)
        .height(20)
        .onClick(() => {
          router.back()
        })
      Text("食物详情")
        .fontSize(22)
        .margin({ left: 20 })
    }
    .padding(12)
    .width('100%')
  }
}

@Component
struct FoodImageDisplay {
  private foodInfo: FoodInfo = new FoodInfo('',$r('app.media.cucumber'),'','','','','0','',false)
  @State imageBgColorA: number = 0
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm'

  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Image(this.foodInfo.image!)
        .backgroundColor(`rgba(255, 255, 255, ${this.imageBgColorA})`)
        .objectFit(ImageFit.Contain)
      Text(this.foodInfo.name)
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 26, bottom: 18 })
    }
    .height(this.currentBreakpoint == 'lg' ? 166 : 280)
  }
}

@Component
struct ContentTable {
  private foodInfo: FoodInfo = new FoodInfo('',$r('app.media.cucumber'),'','','','','0','',false)

  @Builder
  IngredientItem(title: string | Resource | undefined, colorValue: string, name: string, value: string) {
    Row() {
      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .align(Alignment.Start)
      Row() {
        Circle({ width: 6, height: 6 })
          .margin({ right: 12 })
          .fill(colorValue)
        Text(value)
          .fontSize(18)
      }
      .width('100%')
      .layoutWeight(2)
    }
    .margin({ bottom: 20 })
  }

  build() {
    Column() {
      this.IngredientItem("品类", '#CCC', "品类", "蔬菜")
      this.IngredientItem('保质期', '#9E9EFF', "日期", "2023-11-27")
      this.IngredientItem('数量', '#F5D640', "数量", "2个")
      this.IngredientItem('位置', '#53F540', "冷藏/冷冻", "冷藏")
      this.IngredientItem('', '#53F540', "左/右", "左")
      this.IngredientItem('', '#53F540', "层数", "一层")
    }
    .cardStyle()
  }
}

@Entry
@Component
struct FoodDetail {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm'
  private foodInfo: FoodInfo = getFoodInfo()

  build() {
    Scroll() {
      Column() {
        PageTitle()
        FoodImageDisplay({ foodInfo: this.foodInfo })
        Column() {
          ContentTable({ foodInfo: this.foodInfo })
        }
        .height(330)
        .margin({ top: 10, right: 10, left: 10 })
      }
      .alignItems(HorizontalAlign.Center)
    }
    .backgroundColor('#EDF2F5')
    .height('100%')
    .align(Alignment.Top)
  }
}