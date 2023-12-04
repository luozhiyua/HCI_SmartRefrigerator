import { FoodViewModel } from '../../viewModel/FoodViewModel'
import {FoodInfo} from '../../model/DataModels'

@Component
struct titleLine{
  build(){
    Column(){
      Text("已有食材")
        .width('90%')
        .height('100%')
        .fontSize(30)
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
        .fontSize(20)
    }
    .height("15%")
    .width("21%")
    .margin({left: '5%'})
    .borderRadius(10)
    .backgroundColor('#f1f3f5')


  }


}

@Component
export struct foodList{
  private foods: FoodInfo[];

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