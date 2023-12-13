
@Component
export struct StepList{
  steps: Array<Array<string>>

  build(){
    Column(){
      Text($r('app.string.recipe_detail_step_title'))
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .width($r('app.string.recipe_width'))
        .height('5%')
        .align(Alignment.Center)
        // .backgroundColor(Color.Pink)
        .margin({top: 20})
      ForEach(this.steps, (item: Array<string>, index?: number) =>{
        Column() {
          Row() {
            Text('step ' + (index + 1).toString())
              .borderColor(Color.Orange)
              .borderRadius(50)
              .borderWidth(10)
              .backgroundColor(Color.Orange)
              .textAlign(TextAlign.Start)
              .fontWeight(FontWeight.Bold)
              .fontSize(30)
              .fontColor(Color.White)
              .margin({ top: 10})

            Text(item[0])
              .margin({ top: 10})
              .fontSize(25)
              .textAlign(TextAlign.Center)
              .width('80%')
          }
          .width('100%')
          .margin({top:30,left:10})

          Image(this.steps[index][1])
            //.width('100%')
            .height('30%')
            .align(Alignment.Center)
            .borderRadius(20)
            .margin({top:15})
            .shadow({ radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20 })

        }
      })
    }
    .width('90%')
    .borderRadius(10)
    .margin({top:20})
    .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
    // .margin({bottom:20})
  }

}