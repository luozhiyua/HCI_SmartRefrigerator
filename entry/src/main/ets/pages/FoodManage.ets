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
import { MockDB } from '../mock/MockDB'
import { FoodInfo } from '../model/DataModels'
import { getFoodCategories } from '../model/DataUtil'

@Component
struct FoodGridItem {
  private foodItem?: FoodInfo

  build() {
    Column() {
      Image(this.foodItem!.image!)
        .objectFit(ImageFit.Contain)
        .backgroundColor('#f1f3f5')
        .width('100%')
        .height(152)
      Row() {
        Text(this.foodItem?.name)
          .fontSize(22)
      }
      .padding({ left: 12, right: 12 })
      .width('100%')
      .height(32)
      .backgroundColor('#E5E5E5')
    }
    .height(180)
    .clip(new Rect({ width: '100%', height: '100%', radius: 12 }))
    .onClick(() => {
      router.replaceUrl({ url: 'pages/FoodDetail', params: { foodId: this.foodItem.id, showEdit: true} })
    })
  }
}

@Component
struct FoodGrid {
  private foodItems?: FoodInfo[]

  build() {
    Grid() {
      ForEach(this.foodItems!, (item: FoodInfo) => {
        GridItem() {
          FoodGridItem({ foodItem: item })
        }
      })
    }
    .columnsTemplate('1fr 1fr')
    .columnsGap(8)
    .rowsGap(8)
    .padding({ left: 16, right: 16 })
  }
}

@Component
struct CategoryModeFoods {
  mockDB : MockDB = AppStorage.Link('appDB').get();
  @State currentTabIndex: number = 0
  @State foodItems: FoodInfo[] = [...this.mockDB.getFoodList()]
  private foodCategories: string[] = getFoodCategories()

  @Builder
  tabBarItemBuilder(value: string, index: number) {
    Text(value)
      .fontColor(this.currentTabIndex === index ? 'rgba(0,0,0,0.9)' : 'rgba(0,0,0,0.6)')
      .fontSize(this.currentTabIndex === index ? 24 : 18)
      .margin({ top: 2 })
      .height(50)
  }

  build() {
    Tabs() {
      TabContent() {
        FoodGrid({ foodItems: this.foodItems })
      }.tabBar(this.tabBarItemBuilder("所有", 0))

      ForEach(this.foodCategories, (foodCategory: string, index?: number) => {
        TabContent() {
          FoodGrid({ foodItems: this.foodItems.filter(item => (item.category === foodCategory)) })
        }.tabBar(this.tabBarItemBuilder(foodCategory,
          index! + 1))
      })
    }
    .vertical(true)
    .animationDuration(0)
    .barWidth('15%')
    .onChange((index) => {
      this.currentTabIndex = index
    })
  }
}

@Entry
@Component
struct Home {
  @State isCategoryMode: boolean = true

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      CategoryModeFoods()
      Button('添加').onClick(()=>{
        router.replaceUrl({url:'pages/AddFoodPage'})
      })
    }
  }
}