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
import {CondimentInfo, FoodInfo, MenuInfo, MenuIngredientInfo} from '../model/DataModels'
import thermal from '@ohos.thermal'
import { PageTitle } from './MenuComponent/PageTitle'
import url from '@ohos.url'
import { MockCondiment } from '../mock/MockCondiment'

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
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .padding({left:25})
      Text(this.time)
        .fontSize(30)
        .fontColor(Color.Gray)
        .align(Alignment.TopEnd)
    }
    .width('55%')
    .height('7%')
    .margin({top:30,left:25,right:15})
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
          router.replaceUrl({ url: 'pages/Menus'})
          //router.back()
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
  steps: Array<Array<string>>
  menuName:string
  menuID:number

  build(){
    Button("开始做菜",{type:ButtonType.Normal,stateEffect:true})
      .height('7%')
      .width('35%')
        //.margin({ top: 15,left:100,right:0})
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .backgroundColor('#FF8C69')
      .fontColor(Color.White)
      .borderRadius(10)
      .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
      .margin({top:30,right:30})
      .onClick(()=>{
        router.pushUrl({url:'pages/CookProcess',params:{steps:this.steps,index:0,menuName:this.menuName,menuID:this.menuID}})
      })
  }
}

@Component
export struct IngredientList {

  private ingredients: Array<MenuIngredientInfo>
  private is_exist: Array<boolean> = new Array<boolean>()
  mockDB : MockDB = AppStorage.Link('appDB').get();
  foodItems: FoodInfo[] = [...this.mockDB.getFoodList()]
  mockCondiment: MockCondiment = AppStorage.Link('appCondiment').get();
  condimentItems: CondimentInfo[] = [...this.mockCondiment.getCondimentList()]

  aboutToAppear(){
    for (let i = 0; i < this.ingredients.length; i++) {
      let item: MenuIngredientInfo = this.ingredients[i]
      let isFound: boolean = false;
      for (let index = 0; index < this.foodItems.length; index++) {
        const element = this.foodItems[index];
        if(element.name == item.name) {
          isFound = true
          router.pushUrl({ url: 'pages/FoodDetail', params: { foodId: element.id} })
        }
      }
      for (let index = 0; index < this.condimentItems.length; index++) {
        const element = this.condimentItems[index];
        if(element.name == item.name && element.is_exist) {
          isFound = true
        }
      }
      if (isFound)
        this.is_exist.push(true)
      else
        this.is_exist.push(false)
    }
  }

  foodNotFoundController: CustomDialogController = new CustomDialogController({
    builder: FoodNotFound(),
    alignment : DialogAlignment.Center
  })

  build() {
    // List(){
    Column() {
      Text($r('app.string.recipe_detail_ingredient_title'))
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .width($r('app.string.recipe_width'))
        .height('5%')
        .align(Alignment.Center)
      // .backgroundColor(Color.Pink)

      ForEach(this.ingredients, (item: MenuIngredientInfo, index: number) => {
        Row() {
          if (this.is_exist[index]) {
            Image($r("app.media.has_food"))
              .width("10%")
          } else {
            Blank()
              .width("10%")
          }
          Text(item.name)
            .width('50%')
            .height(40)
            .fontSize(25)
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
              for (let index = 0; index < this.condimentItems.length; index++) {
                const element = this.condimentItems[index];
                if(element.name == item.name && element.is_exist) {
                  isFound = true
                }
              }
              if (!isFound) {
                this.foodNotFoundController.open()
              }
            })

          Text(item.quantity)
            .width('50%')
            .height(40)
            .fontSize(20)
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
          .width('90%')
          .textOverflow({overflow: TextOverflow.Clip})
          .height(20)
          .margin({top:12,bottom:3})
          .fontColor(Color.Gray)
      })

    }
    .width('90%')
    .padding({left:6})
    .margin({top: 30 })
    //.borderRadius(10)
    //.shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})

  }


}

@Entry
@Component
struct MenuDetail {
  private menuViewModel: MenuViewModel = new MenuViewModel();
  scroller: Scroller = new Scroller()
  index:number
  @State menuInfo: MenuInfo = this.menuViewModel.getMenuInfo(menuID)

  build() {

    Column(){

      //Stack({alignContent: Alignment.TopStart}) {
      Scroll(this.scroller) {
        Column() {
          Column(){
            menuDetailPageTitle()
            MenuImage({ image: this.menuInfo.image, name: this.menuInfo.name,description:this.menuInfo.description })
            Row() {
              CookTime({ time: this.menuInfo.cookTime })
              ButtonBeginCook({steps:this.menuInfo.steps,menuName:this.menuInfo.name,menuID:this.index})
            }
            IngredientList({ ingredients: this.menuInfo.ingredients })
            StepList({ steps: this.menuInfo.steps })
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
    }
  }
}