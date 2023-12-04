import router from '@ohos.router'
@Component
export struct PageTitle {
  private pageName: string
  private bgColor:Color
  private titleColor:Color

  build() {
    Row() {
      Image($r('app.media.back'))
        .width(30)
        .height(30)
        .onClick(() => {
          router.back()
        })
      Text(this.pageName)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 1 })
        .textAlign(TextAlign.Center)
        .width("85%")
        .fontColor(this.titleColor)
    }
    .padding(10)
    .width('100%')
    .height("7%")
    .backgroundColor(this.bgColor)
  }
}