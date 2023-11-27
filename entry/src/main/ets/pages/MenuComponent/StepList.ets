
@Component
export struct StepList{
  steps: Array<string>

  build(){
    Column(){
      Text($r('app.string.recipe_detail_step_title'))
        .fontSize($r('app.float.TitleSizeM'))
        .fontWeight(FontWeight.Normal)
        .width($r('app.string.recipe_width'))
        .height('6%')
        .align(Alignment.Center)
        // .backgroundColor(Color.Pink)
        .margin({top: 10})
      ForEach(this.steps, (item: string, index?: number) =>{
        Column() {
          Text('第' + (index + 1) + '步')
            .textAlign(TextAlign.Start)
            .fontWeight(FontWeight.Bold)
            .fontSize('18fp')
            .width($r('app.string.recipe_width'))
            .margin({ top: $r('app.float.recipeDetail_margin_top') })
          Text(item)
            .width($r('app.string.recipe_width'))
            .margin({ top: $r('app.float.recipeDetail_margin_top') })
        }
      })
    }
    .margin({bottom:20})
  }

}