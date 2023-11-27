import {MenuIngredientInfo} from '../../model/DataModels'





@Component
export struct IngredientList {

  private ingredients: Array<MenuIngredientInfo>



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