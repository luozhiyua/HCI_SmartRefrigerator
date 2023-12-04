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
        .width(35)
        .height(35)
        .onClick(() => {
          // router.replaceUrl({ url: 'pages/Home'})
          router.back()
        })
      Text("菜谱")
        .fontSize(40)
        .margin({ left: 20 })
        .fontWeight(FontWeight.Bold)
    }
    .padding(20)
    .width('100%')
    .linearGradient({
      angle: 60,
      colors: [['#EDF2F5', 0.0], ['#FF8C69', 0.9]]
    })
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