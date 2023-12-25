import router from '@ohos.router'
import { MenuInfo } from '../model/DataModels'
@Entry
@Component
struct cookProcess{
  menuName:string = router.getParams()['menuName']
  steps: Array<Array<string>> = router.getParams()['steps']
  index:number = router.getParams()['index']
  menuID:number = router.getState()['menuID']

  build(){
    Column(){
      PageTitle({menuName:this.menuName,menuID:this.menuID})
      Column() {
        Image(this.steps[this.index][1])
          //.width('100%')
          .height('50%')
          .align(Alignment.Center)
          .borderRadius(20)
          .shadow({ radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20 })
        Row() {
          Text((this.index + 1).toString())
            .width(65)
            .fontSize(40)
            .borderColor(Color.Orange)
            .borderRadius(50)
            .borderWidth(10)
            .backgroundColor(Color.Orange)
            .textAlign(TextAlign.Center)
          Text(this.steps[this.index][0])
            .width('80%')
            .fontSize(30)
            .align(Alignment.End)
            .margin({left:20})
        }
        .width('90%')
        .align(Alignment.Center)
        .margin({top:50})

        Row(){
          if (this.steps[this.index][2] === "true"){
            Button("开始计时:" + this.steps[this.index][3],{type:ButtonType.Normal,stateEffect:true})
              .height('7%')
              //.width('100%')
                //.margin({ top: 15,left:100,right:0})
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
              .backgroundColor(Color.Pink)
              .fontColor(Color.White)
              .borderRadius(10)
              .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
              .onClick(()=>{
                //TODO：跳转到倒计时
                var timeCount = new Number(this.steps[this.index][3].substring(0,2))
                router.pushUrl({
                  url: 'pages/CountDown',
                  params: {
                    timeCount:timeCount,
                    text:this.menuName
                  }
                })
              })
              .margin({top:30})
          }
        }

        Row() {
          Button("<—")
            .fontSize(50)
            .fontColor(Color.White)
            .backgroundColor('#FF8C69')
            .borderRadius(20)
            .shadow({ radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20 })
            .margin({right:120})
            .onClick(() => {
              router.back()
            })

          if (this.index === this.steps.length - 1) {
            Button("完成！")
              .fontSize(50)
              .fontColor(Color.White)
              .backgroundColor('#FF8C69')
              .borderRadius(20)
              .shadow({ radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20 })
              .onClick(() => {
                router.replaceUrl({ url: 'pages/Menus' })
              })
              .margin({left:120})
          }
          else {
            Button("—>")
              .fontSize(50)
              .fontColor(Color.White)
              .backgroundColor('#FF8C69')
              .borderRadius(20)
              .shadow({ radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20 })
              .onClick(() => {
                router.pushUrl({ url: 'pages/CookProcess', params: { steps: this.steps, index: this.index + 1,menuName:this.menuName } })
              })
              .margin({left:120})
          }
        }
        .margin({top:30})
      }
      .width('95%')
      .borderRadius(10)
      .margin({top:20,left:'2.5%',right:'2.5%'})
      .align(Alignment.Center)
    }
    // .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
    // .margin({bottom:20})
  }
}

@Component
struct PageTitle {
  menuID:number
  menuName:string
  build() {
    Row() {
      Image($r('app.media.back'))
        .width(35)
        .height(35)
        .onClick(() => {
          router.clear()
          router.replaceUrl({ url: 'pages/Menus'})
          //router.back()
        })
      Text(this.menuName)
        .fontSize(40)
        .margin({ left: 20 })
        .fontWeight(FontWeight.Bold)
    }
    .padding(20)
    .width('100%')
    .linearGradient({
      angle: 60,
      colors: [['#EDF2F5', 0.0], ['#FF8C69', 0.9]]
    })
  }
}