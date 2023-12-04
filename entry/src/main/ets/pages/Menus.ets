import {MenuList} from './MenuRecommendComponent/MenuRecommendList'
import {MenuViewModel} from '../viewModel/MenuViewModel'
import {FoodViewModel} from '../viewModel/FoodViewModel'
import {foodList} from './MenuRecommendComponent/AvailableFoods'
import {PageTitle} from '../pages/MenuComponent/PageTitle'
import { MockDB } from '../mock/MockDB'
import { FoodInfo } from '../model/DataModels'

@Entry
@Component
struct Menus {
  private menuList: MenuViewModel = new MenuViewModel()
  mockDB : MockDB = AppStorage.Link('appDB').get();
  @State foodList: FoodInfo[] = [...this.mockDB.getFoodList()]

  build(){
    Column(){
      PageTitle({pageName: "菜谱"})
      foodList({foods: this.foodList})
      MenuList({menuList: this.menuList})

    }
  }
}