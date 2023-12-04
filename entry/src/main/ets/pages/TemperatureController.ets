
@Component
struct TempController{
  @Link temp: number;
  @State temperature: string = " " + this.temp.toString() + "°"

  build(){
    Column(){
      Text("︿")
        .height('25%')
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .fontSize(80)
        .onClick(() => {
          this.temp++;
          console.log(this.temp.toString())
        })

      Text(this.temperature)
        .height('50%')
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .fontSize(80)

      Text("﹀")
        .height('25%')
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .fontSize(80)
        .onClick(() => {
          this.temp--;
        })


    }
  }
}

@Component
@Entry
struct TemperatureController{
  @State temp1: number = 5;
  @State temp2: number = -2;
  @State temp3: number = -5;

  build(){
    Column(){
      Column(){
        // Text("︿5°")
        //   .height('50%')
        //   .width('100%')
        //   .textAlign(TextAlign.Center)
        //   .fontColor(Color.Black)
        //   .fontSize(80)
        //   .border({
        //     width: 5
        //   })
        TempController({temp: $temp1})
          .height("50%")
          .width("100%")
          .border({
            width: 5
          })


        Row(){
          // Text('-2°')
          //   .width('50%')
          //   .height('100%')
          //   .textAlign(TextAlign.Center)
          //   .fontColor(Color.Black)
          //   .fontSize(80)
          //   .border({
          //     width: 5
          //   })

          TempController({temp: $temp2})
            .width("50%")
            .height("100%")
            .border({
              width: 5
            })


          // Text('-5°')
          //   .width('50%')
          //   .height('100%')
          //   .textAlign(TextAlign.Center)
          //   .fontColor(Color.Black)
          //   .fontSize(80)
          //   .border({
          //     width: 5
          //   })

          TempController({temp: $temp3})
            .width("50%")
            .height("100%")
            .border({
              width: 5
            })


        }
        .height("50%")

      }
      .height('80%')
      .width('80%')
      .backgroundColor($r('app.color.temperature'))
      .opacity(0.5)


    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.main_background'))
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}