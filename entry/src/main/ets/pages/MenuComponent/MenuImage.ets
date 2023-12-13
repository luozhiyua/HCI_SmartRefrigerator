@Component
export struct MenuImage {
  private image: string
  private name: string
  private description:string

  build() {
    Row(){
      Image(this.image)
        .width('40%')
        .height('25%')
        .borderRadius(20)
      Column() {
        Text(this.name)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .width('50%')
          .margin({bottom:10})
          .onClick(()=>{
            console.info(this.description)
          })
        Text(this.description)
          .fontSize(20)
          .width('50%')
      }
      .height('25%')
      .margin({ left: 18})
      .padding(10)
      .borderRadius(10)
      .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
    }
    //.justifyContent(FlexAlign.Start)
    .margin({top:20})
  }
}
