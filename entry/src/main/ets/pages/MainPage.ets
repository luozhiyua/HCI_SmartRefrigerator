import router from '@ohos.router'
import { MockDB } from '../mock/MockDB'
import systemDateTime from '@ohos.systemDateTime'
import { beforeAll } from '@ohos/hypium'


@Component
struct time {
  // @State time: string = getTime()
  TimeController: TextClockController = new TextClockController()
  DateController: TextClockController = new TextClockController()
  @State accumulateTime: number = 0
  @State accumulateDate: string = ""

  build(){
    Column(){
      // Text("2023/12/4")
      //   .fontSize(30)
      //   .width("90%")
      //   .alignSelf(ItemAlign.Start)
      //   .margin({
      //     top: '2%', bottom: '2%', left: '2%'
      //   })
      //   .fontWeight(FontWeight.Bold)
      //   .fontColor(Color.White)
      TextClock({ timeZoneOffset: -8, controller: this.DateController })
        .format('yyyy/MM/dd')
        .fontSize(30)
        .width("90%")
        .alignSelf(ItemAlign.Start)
        .margin({
          top: '2%', bottom: '2%', left: '2%'
        })
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)


      Row(){
        Text("8°")
          .fontSize(25)
          .width("15%")
          .fontColor(Color.White)
        Text("晴")
          .fontSize(25)
          .fontColor(Color.White)
      }
      .width("90%")
      .margin({
        left: "2%"
      })

      // Text("13:00")
      //   .fontSize(80)
      //   .fontWeight(FontWeight.Bolder)
      //   .fontColor(Color.White)
      TextClock({ timeZoneOffset: -8, controller: this.TimeController })
        .format('Hm')
        .onDateChange((value: number) => {
          this.accumulateTime = value
        })
        .fontSize(80)
        .fontWeight(FontWeight.Bolder)
        .fontColor(Color.White)
    }
    .height("20%")
  }
}



@Component
@Entry
struct MainPage {

  onPageShow(){
    AppStorage.SetOrCreate('appDB', new MockDB());
  }

  build(){
    Column(){
      time()
      Row(){
        Text("食物管理")
          .height("90%")
          .width("48%")
          .backgroundColor("#87CEFA")
          .margin({
             right: "4%",top: "5%", bottom: "5%"
          })
          .textAlign(TextAlign.Center)
          .fontSize('50')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            router.push({url: 'pages/Home'})
          })
          .borderRadius(20)

        Text("菜谱推荐")
          .height("90%")
          .width("48%")
          .backgroundColor("#9ACD32")
          .margin({
            top: "5%", bottom: "5%"
          })
          .textAlign(TextAlign.Center)
          .fontSize('50')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Medium)
          .borderRadius(20)
          .onClick(() => {
            router.push({url: 'pages/Menus'})
          })
      }
      .height("40%")
      .width("84%")
      .margin({
        left: "8%", right:"8%"
      })



      Row(){
        Text("计时")
          .height("90%")
          .width("48%")
          .backgroundColor(Color.Pink)
          .margin({
           right: "4%", bottom: "5%"
          })
          .textAlign(TextAlign.Center)
          .fontSize('50')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Medium)
          .borderRadius(20)

        Text("温度调节")
          .height("90%")
          .width("48%")
          .backgroundColor("#FF8C69")
          .margin({
            bottom: "5%"
          })
          .textAlign(TextAlign.Center)
          .fontSize('50')
          .fontColor(Color.White)
          .fontWeight(FontWeight.Medium)
          .borderRadius(20)
      }
      .height("40%")
      .width("84%")
      .margin({
        left: "8%", right:"8%"
      })

    }
    .width("100%")
    // .backgroundColor("#f1f3f5")
    .backgroundColor("#363636")
  }
}