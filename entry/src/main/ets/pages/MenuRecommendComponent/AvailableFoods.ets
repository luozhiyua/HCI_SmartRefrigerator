import {FoodInfo} from '../../model/DataModels'
import router from '@ohos.router'

@Component
struct titleLine{
  build(){
    Column(){
      Text("已有食材")
        .width('90%')
        .height('100%')
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Gray)
        // .margin({top: '3%'})

    }
    .height("8%")
    // .margin({bottom: '3%'})
    .alignItems(HorizontalAlign.Start)
  }

}

@Component
struct foodItem{
  private food: FoodInfo
  build(){
    Column(){
      Image(this.food.image)
        .height('80%')
        .width('90%')
      Text(this.food.name)
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
    }
    .height("18%")
    .width("23%")
    .margin({left: '4%'})
    .borderRadius(10)
    .backgroundColor('#f1f3f5')
    .onClick(() => {
      router.pushUrl({ url: 'pages/FoodDetail', params: { foodId: this.food.id, showEdit : false} })
    })
  }


}

@Component
export struct foodList{
  @Link foods: FoodInfo[];

  scroller: Scroller = new Scroller();
  build(){
    Column(){
      titleLine()
      Scroll(this.scroller){
        Row(){
          ForEach(this.foods, (item: FoodInfo) => {
            foodItem({food: item})
          })
        }
        // .backgroundColor(Color.Grey)

      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)

    }
  }
}