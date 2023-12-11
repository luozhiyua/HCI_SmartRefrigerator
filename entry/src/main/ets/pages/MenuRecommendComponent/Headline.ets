import router from '@ohos.router'
@Component
export struct headline {
  build() {
    Row() {
      Image($r('app.media.back'))
        .width(30)
        .height(30)
        .onClick(() => {
          router.back()
        })
      Text("菜谱详情")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 1 })
        .textAlign(TextAlign.Center)
        .width("85%")
        .fontColor(Color.Black)
    }
    .padding(10)
    .width('100%')
    .height("7%")
    .backgroundColor('#FF8C69')
  }
}