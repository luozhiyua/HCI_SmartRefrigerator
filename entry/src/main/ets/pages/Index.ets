import { MockDB } from '../mock/MockDB'
import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  onPageShow(){
    AppStorage.SetOrCreate('appDB', new MockDB());
  }

  build() {
    Row() {
      Column() {
        Button('食物').onClick(()=>{
          router.pushUrl({
            url: 'pages/Home',
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}