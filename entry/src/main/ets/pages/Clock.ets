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
  private select2: number = 1
  private hours: Array<string> = new Array<string>()
  private minutes: Array<string> = new Array<string>()
  @State text: string = ''
  textController: TextInputController = new TextInputController()
  @State timeCount :number = 10;
  @State private hourNum:number = 0;
  @State private minuteNum:number = 1;
  private selfTimeCount:Boolean = false;


  aboutToAppear(){
    for (let i = 0; i < 24; i++) {
      this.hours.push(i.toString());
    }
    for (let i = 0; i < 60; i++) {
      this.minutes.push(i.toString());
    }
    this.text = ""
  }
  onPageShow(){
    this.text = ""
  }

  build() {
    Column() {
      PageTitle({ pageName: "定时",bgColor:Color.Pink,titleColor:Color.Black })
        .padding({bottom:"2%"})
      // 以12小时制显示东八区的系统时间，精确到秒。
      TextClock({ timeZoneOffset: -8, controller: this.controller })
        .format('YYYYMMddHHm')
        .onDateChange((value: number) => {
          this.accumulateTime = value
        })
        .fontColor(Color.White)
        .borderRadius(10)
        .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
        .margin({ left: 10, top: 10 })
        .width('90%')
        .height('8%')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(Color.Pink)
        .padding({left:100})
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

      Text("快捷时间选择 （单位：分钟）")
      .padding({top: "5%"})
      .fontSize(25)
      .fontColor(Color.Gray)
      Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Button('5',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .fontColor(Color.White)
          .fontSize(38)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            this.minuteNum = 5;
            this.hourNum = 0;
            this.selfTimeCount = true;
          })
          .backgroundColor("#D8BFD8")
          .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
        Button('15',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .fontColor(Color.White)
          .fontSize(38)
          .fontWeight(FontWeight.Bold)
          .margin({left:5})
          .onClick(()=>{
            this.minuteNum = 15;
            this.hourNum = 0;
            this.selfTimeCount = true;

          })
          .backgroundColor("#DB7093")
          .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})

        Button('30',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .fontColor(Color.White)
          .fontSize(38)
          .fontWeight(FontWeight.Bold)
          .margin({left:5})
          .onClick(()=>{
            this.minuteNum = 30;
            this.hourNum = 0;
            this.selfTimeCount = true;

          })
          .backgroundColor("#B0C4DE")
          .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})

        Button('45',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .fontColor(Color.White)
          .fontSize(38)
          .fontWeight(FontWeight.Bold)
          .margin({left:5})
          .onClick(()=>{
            this.minuteNum = 45;
            this.hourNum = 0;
            this.selfTimeCount = true;

          })
          .backgroundColor("#9370DB")
          .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})

        Button('60',{type:ButtonType.Normal,stateEffect:true})
          .flexGrow(1) // 父容器分配给该Text的宽度为剩余宽度的2/3
          .height('100%')
          .borderRadius(20)
          .fontColor(Color.White)
          .fontSize(38)
          .fontWeight(FontWeight.Bold)
          .margin({left:5})
          .onClick(()=>{
            this.minuteNum = 60;
            this.hourNum = 0;
            this.selfTimeCount = true;

          })
          .backgroundColor("#BA55D3")
          .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})

      }
      .width('90%')
      .height(120)
      .padding(10)

      Row() {
        //TODO：调整滑动器文本大小
        TextPicker({ range: this.hours, selected: this.select1 })
          .onChange((value: string, index: number) => {
            this.hourNum = index;
            this.selfTimeCount = false;
          })
          .backgroundColor("#FFF0F5")
          .width('35%')
          .height('90%')
          .margin({left:15})
        Text("小时")
          .width('15%')
          .fontSize(30)
          .fontColor(Color.Gray)

        TextPicker({ range: this.minutes, selected: this.select2 })
          .onChange((value: string, index: number) => {
            this.minuteNum = index;
            this.selfTimeCount = false;
          })
          .backgroundColor("#FFF0F5")
          .width('35%')
          .height('90%')
        Text("分钟")
          .width('15%')
          .fontSize(30)
          .fontColor(Color.Gray)
      }
      .width('90%')
      .height('40%')
      .margin({ top: 40 })

      // TextInput({ text: this.text, placeholder: '备注', controller: this.textController })
      //   .placeholderColor(Color.Grey)
      //   .placeholderFont({ size: 30, weight: 400 })
      //   .caretColor(Color.Blue)
      //   .width('90%')
      //   .height('8%')
      //   .margin(20)
      //   .fontSize(30)
      //   .fontColor(Color.Black)
      //   .onChange((value: string) => {
      //     this.text = value
      //   })
      //   .maxLength(100)


      Row() {
        // Button("取消")
        //   .height('7%')
        //   .width('40%')
        //   .margin({ top: 15, left: 0 })
        //   .fontSize(30)
        //   .onClick(()=>{
        //     this.timeCount = 0;
        //   })

        Button("开始计时:" + this.hourNum + "小时" + this.minuteNum + "分钟",{type:ButtonType.Normal,stateEffect:true})
          .height('7%')
          .width('100%')
          //.margin({ top: 15,left:100,right:0})
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .backgroundColor(Color.Pink)
          .fontColor(Color.White)
          .borderRadius(10)
          .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
          .onClick(()=>{
            if (this.selfTimeCount) {
              this.timeCount = this.minuteNum
            }
            else{
              this.timeCount = this.minuteNum + 60 * this.hourNum
            }
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
    //.backgroundColor("#C0C0C0")
    .height("100%")
    .backgroundColor("#FFF0F5")
  }
}