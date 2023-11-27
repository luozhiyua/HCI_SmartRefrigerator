import {MenuList} from './MenuRecommendComponent/MenuRecommendList'
import {MenuViewModel} from '../viewModel/MenuViewModel'
import {FoodViewModel} from '../viewModel/FoodViewModel'
import {foodList} from './MenuRecommendComponent/AvailableFoods'
import {PageTitle} from '../pages/MenuComponent/PageTitle'


@Entry
@Component
struct Menus {
  private menuList: MenuViewModel = new MenuViewModel()
  private foodList: FoodViewModel = new FoodViewModel()
  build(){
    Column(){

      PageTitle({pageName: "菜谱"})
      foodList({foods: this.foodList})
      MenuList({menuList: this.menuList})

    }
  }
}