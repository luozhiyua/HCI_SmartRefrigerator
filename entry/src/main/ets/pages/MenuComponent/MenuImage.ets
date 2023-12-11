@Component
export struct MenuImage {
  private image: Resource
  private name: string

  build() {
    Row(){
      Image(this.image)
        .width('40%')
        .height('35%')
        .borderRadius(20)
      Text(this.name)
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .margin({ left : 18, bottom: 18, top : 5 })
        .width('50%')

      // Row(){
      //
      // }
      // .width('100%')
      // .justifyContent(FlexAlign.Start)

    }
    .margin({top: 40})
    .justifyContent(FlexAlign.Start)
  }
}
