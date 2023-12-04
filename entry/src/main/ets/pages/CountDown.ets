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
      PageTitle({ pageName: "倒计时" })
      // 以12小时制显示东八区的系统时间，精确到秒。
      TextClock({ timeZoneOffset: -8, controller: this.controller })
        .format('YYYYMMddHHm')
        .onDateChange((value: number) => {
          this.accumulateTime = value
        })
          //.borderRadius(10)
          //.shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
        .margin({ left: 10, top: 10 })
        .width('90%')
        .fontSize(35)

      Text("备注：" + this.text)
        .fontSize(50)
        .width('90%')
        .height('10%')

      TextTimer({ isCountDown: true, count: this.timeCount * 60000, controller: this.textTimerController })
        .format('hh:mm:ss')
        .fontColor(Color.Black)
        .fontSize(100)
        .onTimer((utc: number, elapsedTime: number) => {
          console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
        })
        .padding(90)
        .width('90%')
        .height('40%')

      Row() {
        // Button("开始").onClick(() => {
        //   this.textTimerController.start()
        // })
        Button("暂停").onClick(() => {
          this.textTimerController.pause()
        })
          .height('8%')
          .width('40%')
          .fontSize(30)
        Button("重新开始").onClick(() => {
          this.textTimerController.reset()
          this.textTimerController.start()
        })
          .height('8%')
          .width('40%')
          .margin({left:20})
          .fontSize(30)
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
  }
}