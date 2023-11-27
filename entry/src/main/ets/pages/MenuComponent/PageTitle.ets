import router from '@ohos.router'
@Component
export struct PageTitle {
  private foodName: Resource

  build() {
    Row() {
      Image($r('app.media.back'))
        .width(20)
        .height(20)
        .onClick(() => {
          router.back()
        })
      Text(this.foodName)
        .fontSize(10)
        .margin({ left: 20 })
    }
    .padding(12)
    .width('100%')
    .backgroundColor('#EDF2F5')
  }
}