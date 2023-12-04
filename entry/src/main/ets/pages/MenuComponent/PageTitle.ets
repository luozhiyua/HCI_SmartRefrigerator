import router from '@ohos.router'
@Component
export struct PageTitle {
  private pageName: string

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
        //.margin({ left: 5 })
        .textAlign(TextAlign.Center)
        .width("85%")
    }
    .padding(12)
    .width('100%')
    .height("7%")
    .backgroundColor('#EDF2F5')
  }
}