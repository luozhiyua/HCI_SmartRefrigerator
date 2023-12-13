import router from '@ohos.router'
@Entry
@Component
export struct cookProcess{
  steps: Array<string> = router.getParams()['steps']

  build(){
    Column(){
      Text("开始做饭")
    }
    .width('90%')
    .borderRadius(10)
    .margin({top:20})
    .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
    // .margin({bottom:20})
  }

}