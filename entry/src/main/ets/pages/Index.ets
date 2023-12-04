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
        Button('菜谱').onClick(()=>{
          router.pushUrl({
            url: 'pages/Menus',
          })
        })
        Button('时钟').onClick(()=>{
          router.pushUrl({
            url: 'pages/Clock',
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}