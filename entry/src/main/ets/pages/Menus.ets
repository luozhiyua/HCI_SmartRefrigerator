import {MenuList} from './MenuRecommendComponent/MenuRecommendList'
import {MenuViewModel} from '../viewModel/MenuViewModel'
import { FoodViewModel } from '../viewModel/FoodViewModel'
import {foodList} from './MenuRecommendComponent/AvailableFoods'


@Entry
@Component
struct Menus {
  private menuList: MenuViewModel = new MenuViewModel()
  private foodList: FoodViewModel = new FoodViewModel()
  build(){
    Column(){

      foodList({foods: this.foodList})
      MenuList({menuList: this.menuList})

    }
  }
}