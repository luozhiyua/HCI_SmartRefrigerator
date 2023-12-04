import router from '@ohos.router'
import { PageTitle } from './MenuComponent/PageTitle'

@Entry
@Component
struct clock {
  @State accumulateTime: number = 0
  // 导入对象
  controller: TextClockController = new TextClockController()
  textTimerController: TextTimerController = new TextTimerController()
  @State format: string = 'mm:ss.SS'
  private select1: number = 0
  private select2: number = 10
  private hours: Array<string> = new Array<string>()
  private minutes: Array<string> = new Array<string>()
  @State text: string = ''
  textController: TextInputController = new TextInputController()
  @State timeCount :number = 10;

  aboutToAppear(){
    for (let i = 0; i < 24; i++) {
      this.hours.push(i.toString());
    }
    for (let i = 0; i < 60; i++) {
      this.minutes.push(i.toString());
    }
  }

  build() {
    Column() {
      PageTitle({ pageName: "定时" })
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
        .fontSize(30)
      // Button("start TextClock")
      //   .margin({ bottom: 10 })
      //   .onClick(() => {
      //     // 启动文本时钟
      //     this.controller.start()
      //   })
      // Button("stop TextClock")
      //   .onClick(() => {
      //     // 停止文本时钟
      //     this.controller.stop()
      //   })

      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Button('5分钟',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .onClick(()=>{
            this.timeCount = 5;
          })
        Button('15分钟',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .margin({left:5})
          .onClick(()=>{
            this.timeCount = 15;
          })
        Button('30分钟',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .margin({left:5})
          .onClick(()=>{
            this.timeCount = 30;
          })
        Button('45分钟',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .margin({left:5})
          .onClick(()=>{
            this.timeCount = 45;
          })
        Button('1小时',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .margin({left:5})
          .onClick(()=>{
            this.timeCount = 60;
          })
      }
      .width('90%')
      .height(120)
      .padding(10)
      .margin({top:20})

      Row() {
        //TODO：调整滑动器文本大小
        TextPicker({ range: this.hours, selected: this.select1 })
          .onChange((value: string, index: number) => {
            this.timeCount = 60 * index;
          })
          .width('35%')
          .height('90%')
        Text("小时")
          .width('15%')
          .fontSize(30)

        TextPicker({ range: this.minutes, selected: this.select2 })
          .onChange((value: string, index: number) => {
            this.timeCount += index;
          })
          .width('35%')
          .height('90%')
        Text("分钟")
          .width('15%')
          .fontSize(30)
      }
      .width('90%')
      .height('40%')
      .margin({ top: 40 })

      TextInput({ text: this.text, placeholder: '备注', controller: this.textController })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 30, weight: 400 })
        .caretColor(Color.Blue)
        .width('90%')
        .height('8%')
        .margin(20)
        .fontSize(30)
        .fontColor(Color.Black)
        .onChange((value: string) => {
          this.text = value
        })

      Row() {
        // Button("取消")
        //   .height('7%')
        //   .width('40%')
        //   .margin({ top: 15, left: 0 })
        //   .fontSize(30)
        //   .onClick(()=>{
        //     this.timeCount = 0;
        //   })

        Button("开始计时:" + this.timeCount + "分钟")
          .height('7%')
          .width('100%')
          //.margin({ top: 15,left:100,right:0})
          .fontSize(30)
          .onClick(()=>{
            //TODO：跳转到倒计时
            router.pushUrl({
              url: 'pages/CountDown',
              params: {
                timeCount:this.timeCount,
                text:this.text
              }
            })
          })
      }
      .width('90%')
      .align(Alignment.Center)
      .margin(20)
    }
  }
}