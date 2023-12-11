import {MenuList} from './MenuRecommendComponent/MenuRecommendList'
import {MenuViewModel} from '../viewModel/MenuViewModel'
import {foodList} from './MenuRecommendComponent/AvailableFoods'
import {PageTitle} from '../pages/MenuComponent/PageTitle'
import { MockDB } from '../mock/MockDB'
import { FoodInfo } from '../model/DataModels'
import router from '@ohos.router'

@Component
struct MenuPageTitle {
  build() {
    Row() {
      Image($r('app.media.back'))
        .width(30)
        .height(30)
        .onClick(() => {
          router.back()
        })
      Text("菜谱")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 1 })
        .textAlign(TextAlign.Center)
        .width("85%")
        .fontColor(Color.Black)
    }
    .padding(10)
    .width('100%')
    .height("7%")
    .backgroundColor('#FF8C69')
  }
}

@Entry
@Component
struct Menus {
  private menuList: MenuViewModel = new MenuViewModel()
  mockDB : MockDB = AppStorage.Link('appDB').get();
  @State foodList: FoodInfo[] = [...this.mockDB.getFoodList()]

  build(){
    Column(){
      MenuPageTitle()
      foodList({foods: this.foodList})
      MenuList({menuList: this.menuList})

    }
  }
}