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
import { PageTitle } from './MenuComponent/PageTitle'
import url from '@ohos.url'

const params = router.getParams();
const menuID = params['menuID']

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
export struct CookTime{
  private time:string;
  build(){
    Row() {
      Text("烹饪时间  :   ")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Text(this.time)
        .fontSize(30)
        .fontColor(Color.Gray)
        .align(Alignment.TopEnd)
    }
    .width('90%')
    .height('5%')
    .margin({top:30})
    .padding({ left: 6})
    .borderRadius(10)
    .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})

  }
}

@Component
export struct menuDetailPageTitle{
  build(){
    Row() {
      Image($r('app.media.back'))
        .width(35)
        .height(35)
        .onClick(() => {
          // router.replaceUrl({ url: 'pages/Home'})
          router.back()
        })
      Text("菜谱详情")
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

@Component
export struct ButtonBeginCook{
  steps: Array<string>

  build(){
    Button("确认做菜")
      .borderRadius(10)
      .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
      .margin({top:20,bottom:20})
      .onClick(()=>{
        router.pushUrl({url:'pages/CookProcess',params:{steps:this.steps}})
      })
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
<<<<<<< HEAD
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .width($r('app.string.recipe_width'))
        .height('5%')
        .align(Alignment.Center)
=======
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .width($r('app.string.recipe_width'))
        .height('6%')
>>>>>>> dcad3564301b2c0fd13ecbb945736161a7051a5e
      // .backgroundColor(Color.Pink)

      ForEach(this.ingredients, (item: MenuIngredientInfo) => {
        Row() {
          Text(item.name)
            .width('50%')
<<<<<<< HEAD
            .height(40)
            .fontSize(20)
=======
            .height(28)
            .fontSize(25)
>>>>>>> dcad3564301b2c0fd13ecbb945736161a7051a5e
            .textAlign(TextAlign.Start)
            .borderRadius(10)
            .margin({
              top: $r('app.float.recipeDetail_margin_top'),

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
<<<<<<< HEAD
            .height(40)
            .fontSize(20)
=======
            .height(28)
            .fontSize(25)
>>>>>>> dcad3564301b2c0fd13ecbb945736161a7051a5e
            .textAlign(TextAlign.End)
            .borderRadius(10)
            .margin({
              top: $r('app.float.recipeDetail_margin_top'),
            })
            .padding({right:50})
        }
        .height(35)
        // .backgroundColor(Color.Yellow)

        Text($r('app.string.dotted_line'))
          .width('90%')
          .textOverflow({overflow: TextOverflow.Clip})
          .height(20)
          .margin({top:3,bottom:3})
          .fontColor(Color.Gray)
      })

    }
<<<<<<< HEAD
    .width('90%')
    .padding({left:6})
    .margin({top: 30 })
    .borderRadius(10)
    .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})

=======
    // .backgroundColor("#f1f3f5")
    .borderRadius(40)
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
>>>>>>> dcad3564301b2c0fd13ecbb945736161a7051a5e
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

<<<<<<< HEAD
      //Stack({alignContent: Alignment.TopStart}) {
      Scroll(this.scroller) {
        Column() {
          Column(){
            menuDetailPageTitle()
            MenuImage({ image: this.menuInfo.image, name: this.menuInfo.name,description:this.menuInfo.description })
            CookTime({time:this.menuInfo.cookTime})
            IngredientList({ ingredients: this.menuInfo.ingredients })
            StepList({ steps: this.menuInfo.steps })
            ButtonBeginCook()
=======
      Stack({alignContent: Alignment.TopStart}) {
        Scroll(this.scroller) {
          Column() {
            Column(){
              Blank().height("4%")
              MenuImage({ image: this.menuInfo.image, name: this.menuInfo.name })
              Blank().height("2%")
              IngredientList({ ingredients: this.menuInfo.ingredients })
              StepList({ steps: this.menuInfo.steps })
            }
>>>>>>> dcad3564301b2c0fd13ecbb945736161a7051a5e
          }
        }
<<<<<<< HEAD
        // .backgroundColor('#EDF2F5')
        //.height('100%')
        .align(Alignment.Top)
        .justifyContent(FlexAlign.Start)
=======
        .scrollBar(BarState.On)
        .scrollable(ScrollDirection.Vertical)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)
        .edgeEffect(EdgeEffect.Spring)

        // PageTitle({pageName: "菜谱详情"})
        headline()
>>>>>>> dcad3564301b2c0fd13ecbb945736161a7051a5e
      }
      .scrollBar(BarState.On)
      .scrollable(ScrollDirection.Vertical)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .edgeEffect(EdgeEffect.Spring)

      // PageTitle({pageName: "菜谱详情"})
      headline({pageName: "菜谱详情"})
      //}
    }
  }
}