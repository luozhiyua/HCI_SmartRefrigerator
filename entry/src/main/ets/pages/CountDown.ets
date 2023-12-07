import { PageTitle } from './MenuComponent/PageTitle'
import router from '@ohos.router'

@Entry
@Component
struct countDown {
  @State accumulateTime: number = 0
  // 导入对象
  controller: TextClockController = new TextClockController()
  textTimerController: TextTimerController = new TextTimerController()
  private  text: string;
  textController: TextInputController = new TextInputController()
  private timeCount :number;
  private warn:Boolean = false;
  aboutToAppear() {
    const params = router.getParams(); // 获取传递过来的参数对象
    this.timeCount = params['timeCount']; // 获取id属性的值
    this.text = params['text']; // 获取id属性的值
  }
  onPageShow(){
    this.textTimerController.start()
  }

  build() {
    Column() {
      PageTitle({ pageName: "倒计时",bgColor:Color.Pink,titleColor:Color.Black })
      // 以12小时制显示东八区的系统时间
      TextClock({ timeZoneOffset: -8, controller: this.controller })
        .format('YYYYMMdd')
        .onDateChange((value: number) => {
          this.accumulateTime = value
        })
        .margin({ left: 10, top: 10 })
        .width('90%')
        .height("5%")
        .fontSize(30)
        .fontColor(Color.Gray)
        .fontWeight(FontWeight.Bold)
      TextClock({ timeZoneOffset: -8, controller: this.controller })
        .format('HHm')
        .onDateChange((value: number) => {
          this.accumulateTime = value
        })
        .margin({ left: 10, top: 10 })
        .width('90%')
        .height("10%")
        .fontSize(70)
        .fontColor(Color.Gray)
        .fontWeight(FontWeight.Bold)
        //.backgroundColor(Color.Pink)
        //.shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})

      Text("备注：" + this.text)
        .fontSize(30)
        .fontColor(Color.Gray)
        .width('90%')
        .height('10%')
        .borderRadius(10)
        .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
        .padding({left:25})

      //this.timeCount * 60000
      TextTimer({ isCountDown: true, count: this.timeCount * 60000, controller: this.textTimerController })
        .format('hh:mm:ss')
        .fontColor(Color.Gray)
        .fontSize(100)
        .onTimer((utc: number, elapsedTime: number) => {
          console.info(elapsedTime.toString())// + " " + this.timeCount.toString())
          if (elapsedTime <= this.timeCount*60000 && elapsedTime >= (this.timeCount - 0.01) * 60000) {
          //if (elapsedTime > 4000 && elapsedTime < 5000) {
            //console.info("倒计时完成")
            if (!this.warn) {
              this.warn = true
              AlertDialog.show(
                {
                  //title: '倒计时结束',
                  message: '倒计时结束',
                  autoCancel: true,
                  alignment: DialogAlignment.Center,
                  offset: { dx: 0, dy: -20 },
                  gridCount: 3,
                  confirm: {
                    value: 'OK',
                    action: () => {
                      console.info("点击OK")
                      router.replaceUrl({
                        url: 'pages/Clock'
                      })
                    }
                  },
                  cancel: () => {
                    console.info('Closed callbacks')
                  }
                }
              )
            }
          }
        })
        .padding(90)
        .width('90%')
        .height('40%')

      Row() {
        // Button("开始").onClick(() => {
        //   this.textTimerController.start()
        // })

        Button("重置").onClick(() => {
          this.textTimerController.reset()
          this.textTimerController.start()
        })
          .height('8%')
          .width('25%')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .backgroundColor(Color.Pink)
          .fontColor(Color.White)
          .borderRadius(10)
          .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
        Button("暂停").onClick(() => {
          this.textTimerController.pause()
        })
          .height('8%')
          .width('25%')
          .margin({left:20})
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .backgroundColor(Color.Pink)
          .fontColor(Color.White)
          .borderRadius(10)
          .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
        Button("继续").onClick(() => {
          //this.textTimerController.reset()
          this.textTimerController.start()
        })
          .height('8%')
          .width('25%')
          .margin({left:20})
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .backgroundColor(Color.Pink)
          .fontColor(Color.White)
          .borderRadius(10)
          .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
      }

      // Row() {
      //   Button("取消")
      //     .height('7%')
      //     .width('40%')
      //     .margin({ top: 15, left: 0 })
      //     .onClick(()=>{
      //       this.timeCount = 0;
      //     })
      //
      //   Button("开始计时")
      //     .height('7%')
      //     .width('40%')
      //     .margin({ top: 15,left:100,right:0})
      //     .onClick(()=>{
      //       //TODO：跳转到倒计时
      //     })
      // }
      // .width('90%')
      // .align(Alignment.Center)
    }
    .height("100%")
    .backgroundColor("#FFF0F5")
  }
}