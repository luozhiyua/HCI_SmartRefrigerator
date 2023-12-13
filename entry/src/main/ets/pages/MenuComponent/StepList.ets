
@Component
export struct StepList{
  steps: Array<string>

  build(){
    Column(){
      Text($r('app.string.recipe_detail_step_title'))
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .width($r('app.string.recipe_width'))
        .height('5%')
        .align(Alignment.Center)
        // .backgroundColor(Color.Pink)
        .margin({top: 20})
      ForEach(this.steps, (item: string, index?: number) =>{
        Column() {
          Text('第' + (index + 1) + '步')
            .textAlign(TextAlign.Start)
            .fontWeight(FontWeight.Bold)
            .fontSize(25)
            .width($r('app.string.recipe_width'))
            .margin({ top: $r('app.float.recipeDetail_margin_top') })
          Text(item)
            .width($r('app.string.recipe_width'))
            .margin({ top: $r('app.float.recipeDetail_margin_top') })
            .fontSize(20)
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