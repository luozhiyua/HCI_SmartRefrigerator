import {PageTitle} from './MenuComponent/PageTitle'
import {temperatures} from '../common/TemperatureConstants'



@Component
struct TempController{
  @Prop idNum: number;
  max: number = this.idNum == 1 ? temperatures.max1 : temperatures.max2
  min: number = this.idNum == 1 ? temperatures.min1 : temperatures.min2
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
          console.log("click")
          console.log(this.temp.toString())
          if (this.temp < this.max){
            if (this.idNum == 1) {
              this.temp++;
              temperatures.temp1++;
              console.log(temperatures.temp1.toString())
            }else if (this.idNum == 2){
              this.temp++;
              temperatures.temp2++;
            }else {
              this.temp++
              temperatures.temp3++;
            }
          }
          // console.log(this.temp.toString())
        })

      Text(" " + this.temp + "°")
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
          console.log("click")
          console.log(this.idNum.toString())
          if (this.temp > this.min){
            if (this.idNum == 1) {
              this.temp--;
              temperatures.temp1--;
              console.log(temperatures.temp1.toString())
            }else if (this.idNum == 2){
              this.temp--;
              temperatures.temp2--;
            }else {
              this.temp--;
              temperatures.temp3--;
            }
          }

        })


    }
  }
}

@Component
struct Buttons{

  @Link temp1: number
  @Link temp2: number
  @Link temp3: number

  build(){
    Row(){
      Button("智能调节")
        .height("50%")
        .width("25%")
        .margin({right: '3%'})
        .fontSize(25)
        .onClick(() => {
          this.temp1 = 5
          this.temp2 = -18
          this.temp3 = -18
          temperatures.temp1 = 5
          temperatures.temp2 = -18
          temperatures.temp3 = -18
        })
      Button("速冷")
        .height("50%")
        .width("25%")
        .margin({right: '3%'})
        .fontSize(25)
        .onClick(() => {
          this.temp1 = 2
          temperatures.temp1 = 2
        })
      Button("速冻")
        .height("50%")
        .width("25%")
        .fontSize(25)
        .onClick(() => {
          this.temp2 = -26
          this.temp3 = -26
          temperatures.temp2 = -26
          temperatures.temp3 = -26
        })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .margin({top: '5%'})

  }
}

@Component
@Entry
struct TemperatureController{
  @State temp1: number = temperatures.temp1;
  @State temp2: number = temperatures.temp2;
  @State temp3: number = temperatures.temp3;

  build(){
    Column(){
      PageTitle({
        pageName: "温度调节", bgColor: Color.White, titleColor: Color.Black
      })
        .width('100%')
        // .height('30%')
        .alignSelf(ItemAlign.Start)
        .opacity(80)
        .position({x: 0, y: 0})

      Column(){
        TempController({idNum: 1, temp: $temp1})
          .height("50%")
          .width("100%")
          .backgroundColor("#1E90FF")
          .border({
            width: 5
          })

        Row(){
          TempController({idNum: 2, temp: $temp2})
            .width("50%")
            .height("100%")
            .backgroundColor("#87CEFA")
            .border({
              width: 5
            })

          TempController({idNum: 3, temp: $temp3})
            .width("50%")
            .height("100%")
            .border({
              width: 5
            })
        }
        .height("50%")
      }
      .height('70%')
      .width('80%')
      .backgroundColor($r('app.color.temperature'))
      .opacity(0.5)

      Buttons({
        temp1: $temp1, temp2: $temp2, temp3: $temp3
      })
        .height('15%')
        .width('100%')

    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.main_background'))
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.End)
  }
}