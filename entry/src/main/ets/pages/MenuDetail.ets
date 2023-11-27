import curves from '@ohos.curves'
import router from '@ohos.router'

// import {MenuInfo} from '../model/DataModels'
// import {getMenuInfo} from '../model/DataUtil'
import {PageTitle} from '../pages/MenuComponent/PageTitle'
import {MenuImage} from '../pages/MenuComponent/MenuImage'
import {IngredientList} from '../pages/MenuComponent/IngredientList'
import {MenuViewModel} from '../viewModel/MenuViewModel'
import {StepList} from '../pages/MenuComponent/StepList'
import thermal from '@ohos.thermal'

@Component
struct content{
  private menuViewModel: MenuViewModel

  build(){
    Column(){
      MenuImage({ image: this.menuViewModel.getMenuInfo().image, name: this.menuViewModel.getMenuInfo().name })
      IngredientList({ ingredients: this.menuViewModel.getMenuInfo().ingredients })
      StepList({ steps: this.menuViewModel.getMenuInfo().steps })
    }
  }
}


@Component
struct MenuTitle {
  private title: string | Resource | undefined = '';
  private subtitle: string | Resource | undefined = '';

  build() {
    Row() {
      Text(this.title)
        .fontSize(26)
      Blank()
      Text(this.subtitle)
        .fontSize(13)
        .fontColor('rgba(0,0,0,0.6)')
    }
    .width('100%')
    .height(26)
  }
}



@Entry
@Component
struct MenuDetail {
  // @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm'
  private menuViewModel: MenuViewModel = new MenuViewModel();
  scroller: Scroller = new Scroller()

  build() {

    Column(){

      Stack({alignContent: Alignment.TopStart}) {
        Scroll(this.scroller) {
          Column() {
            content({menuViewModel: this.menuViewModel})
          }
          .backgroundColor('#EDF2F5')
          //.height('100%')
          .align(Alignment.Top)
          .justifyContent(FlexAlign.Start)
        }
        .scrollBar(BarState.On)
        .scrollable(ScrollDirection.Vertical)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)
        .edgeEffect(EdgeEffect.Spring)

        PageTitle()
      }
    }
  }
}