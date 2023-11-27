import router from '@ohos.router'
import { FoodInfo } from '../model/DataModels'
@Styles
function cardStyle() {
  .height('100%')
  .padding({ top: 20, right: 20, left: 20 })
  .backgroundColor(Color.White)
  .borderRadius(12)
}

@Component
struct PageTitle {
  build() {
    Row() {
      Image($r('app.media.return_icon'))
        .width(20)
        .height(20)
        .onClick(() => {
          router.back()
        })
      Text("食材详情")
        .fontSize(22)
        .margin({ left: 20 })
    }
    .padding(12)
    .width('100%')
  }
}

@Component
struct FoodImageDisplay {
  // private foodInfo: FoodInfo = new FoodInfo(0, '', '', null)
  // @State imageBgColorA: number = 0
  // @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm'

  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Image($r('app.media.lettuce'))
        // .sharedTransition(this.foodInfo.letter, {
        //   duration: 400,
        //   curve: curves.cubicBezier(0.2, 0.2, 0.1, 1.0),
        //   delay: 100
        // })
        // .backgroundColor(`rgba(255, 255, 255, ${this.imageBgColorA})`)
        .objectFit(ImageFit.Contain)
      Text("生菜")
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 26, bottom: 18 })
    }
    .height(280)
  }
}

@Component
struct ContentTable {
  private foodInfo: FoodInfo = new FoodInfo('',$r('app.media.default_photo'),'','','','','0','',false)

  @Builder
  IngredientItem(title: string | Resource | undefined, colorValue: string, name: string, value: string) {
    Row() {
      Text(title)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .align(Alignment.Start)
      Row() {
        Circle({ width: 6, height: 6 })
          .margin({ right: 12 })
          .fill(colorValue)
        // Text(name)
        //   .fontSize(18)
        // Blank()
        Text(value)
          .fontSize(22)
      }
      .width('100%')
      .layoutWeight(2)
    }
    .margin({ bottom: 20 })
  }

  build() {
    Column() {
      this.IngredientItem("品类", '#CCC', "品类", "蔬菜")
      this.IngredientItem('保质期', '#9E9EFF', "日期", "2023-11-27")
      this.IngredientItem('数量', '#F5D640', "数量", "2个")
      this.IngredientItem('位置', '#53F540', "冷藏/冷冻", "冷藏")
      this.IngredientItem('', '#53F540', "左/右", "左")
      this.IngredientItem('', '#53F540', "层数", "一层")
    }
    .cardStyle()
  }
}

@Entry
@Component
struct FoodDetailPage {
  build(){
    Column() {
      PageTitle()
      FoodImageDisplay()
      ContentTable()
    }
  }
}