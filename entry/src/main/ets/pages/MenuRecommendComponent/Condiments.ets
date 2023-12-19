import { MockCondiment } from '../../mock/MockCondiment'
import { CondimentInfo } from '../../model/DataModels';
@Component
struct titleLine{
  build(){
    Column(){
      Text("已有调料")
        .width('90%')
        .height('100%')
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Gray)
      // .margin({top: '3%'})
    }
    .height("8%")
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
export struct CondimentsList{
  mockCondiment: MockCondiment = AppStorage.Link('appCondiment').get();
  @State condimentList: CondimentInfo[] = [...this.mockCondiment.getCondimentList()]

  scroller: Scroller = new Scroller();
  build(){
    Column(){
      titleLine()
      Scroll(this.scroller){
        Row(){
          Blank().width("5%")
          ForEach(this.condimentList, (item: CondimentInfo, index: number) => {
            Text(item.name)
            Toggle({type: ToggleType.Checkbox, isOn: item.is_exist})
              .onChange((isOn: boolean) => {
                this.mockCondiment.setCondimentAvailable(index, isOn)
              })
          })
        }
        // .backgroundColor(Color.Grey)
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
    }
  }
}