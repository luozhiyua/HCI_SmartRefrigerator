@Component
export struct MenuImage {
  private image: Resource
  private name: string
  private description:string

  build() {
    Row(){
      Image(this.image)
        .width('40%')
<<<<<<< HEAD
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
=======
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
>>>>>>> dcad3564301b2c0fd13ecbb945736161a7051a5e
  }
}
