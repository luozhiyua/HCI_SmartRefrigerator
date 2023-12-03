import curves from '@ohos.curves'
import router from '@ohos.router'

// import {MenuInfo} from '../model/DataModels'
// import {getMenuInfo} from '../model/DataUtil'
// import {PageTitle} from '../pages/MenuComponent/PageTitle'
import {headline} from './MenuRecommendComponent/Headline'
import {MenuImage} from '../pages/MenuComponent/MenuImage'
import {MenuViewModel} from '../viewModel/MenuViewModel'
import {StepList} from '../pages/MenuComponent/StepList'
import { MockDB } from '../mock/MockDB';
import {FoodInfo, MenuInfo, MenuIngredientInfo} from '../model/DataModels'
import thermal from '@ohos.thermal'

const params = router.getParams();
const menuID = params['menuId']


@CustomDialog
struct FoodNotFound {
  controller: CustomDialogController

  build() {
    Column() {
      Text('冰箱里没有该食材')
        .fontSize(20)
        .margin({ top: 12, bottom: 12 })

        Button('确定')
          .fontSize(20)
          .onClick(() => {
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 5 })
  }
}

@Component
export struct IngredientList {

  private ingredients: Array<MenuIngredientInfo>
  mockDB : MockDB = AppStorage.Link('appDB').get();
  foodItems: FoodInfo[] = [...this.mockDB.getFoodList()]

  foodNotFoundController: CustomDialogController = new CustomDialogController({
    builder: FoodNotFound(),
    alignment : DialogAlignment.Center
  })

  build() {
    // List(){
    Column() {
      Text($r('app.string.recipe_detail_ingredient_title'))
        .fontSize($r('app.float.TitleSizeM'))
        .fontWeight(FontWeight.Normal)
        .width($r('app.string.recipe_width'))
        .height('6%')
        .align(Alignment.Center)
      // .backgroundColor(Color.Pink)

      ForEach(this.ingredients, (item: MenuIngredientInfo) => {
        Row() {
          Text(item.name)
            .width('50%')
            .height(20)
            .fontSize($r('app.float.textSize'))
            .textAlign(TextAlign.Start)
            .borderRadius(10)
            .margin({
              top: $r('app.float.recipeDetail_margin_top'),
              // left: 20

            })
            .padding({left:30})
            .onClick(()=>{
              let isFound: boolean = false;
              for (let index = 0; index < this.foodItems.length; index++) {
                const element = this.foodItems[index];
                if(element.name == item.name) {
                  isFound = true
                  router.pushUrl({ url: 'pages/FoodDetail', params: { foodId: element.id} })
                }
              }
              if (!isFound) {
                this.foodNotFoundController.open()
              }
            })

          Text(item.quantity)
            .width('50%')
            .height(20)
            .fontSize($r('app.float.textSize'))
            .textAlign(TextAlign.End)
            .borderRadius(10)
            .margin({
              top: $r('app.float.recipeDetail_margin_top'),

            })
            .padding({right:40})
        }
        .height(20)
        // .backgroundColor(Color.Yellow)

        Text($r('app.string.dotted_line'))
          .width('85%')
          .textOverflow({overflow: TextOverflow.Clip})
          .height(20)
      })

    }
    // .width('50%')
    // .border({width: 4,
    //   color: Color.Gray,
    //   radius: 30,
    //   style:{
    //   left: BorderStyle.Dashed,
    //   right: BorderStyle.Dashed,
    //   top: BorderStyle.Dashed,
    //   bottom: BorderStyle.Dashed
    // }})
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
  private menuViewModel: MenuViewModel = new MenuViewModel();
  scroller: Scroller = new Scroller()
  @State menuInfo: MenuInfo = this.menuViewModel.getMenuInfo(menuID)

  build() {

    Column(){

      Stack({alignContent: Alignment.TopStart}) {
        Scroll(this.scroller) {
          Column() {
            Column(){
              //TODO: menuID传递有问题
              MenuImage({ image: this.menuViewModel.getMenuInfo(0).image, name: this.menuViewModel.getMenuInfo(0).name })
              IngredientList({ ingredients: this.menuViewModel.getMenuInfo(0).ingredients })
              StepList({ steps: this.menuViewModel.getMenuInfo(0).steps })
            }
          }
          // .backgroundColor('#EDF2F5')
          //.height('100%')
          .align(Alignment.Top)
          .justifyContent(FlexAlign.Start)
        }
        .scrollBar(BarState.On)
        .scrollable(ScrollDirection.Vertical)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)
        .edgeEffect(EdgeEffect.Spring)

        // PageTitle({pageName: "菜谱详情"})
        headline({pageName: "菜谱详情"})
      }
    }
  }
}