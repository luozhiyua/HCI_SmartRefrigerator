import {MenuList} from './MenuRecommendComponent/MenuRecommendList'
import {MenuViewModel} from '../viewModel/MenuViewModel'
import {foodList} from './MenuRecommendComponent/AvailableFoods'
import {PageTitle} from '../pages/MenuComponent/PageTitle'
import { MockDB } from '../mock/MockDB'
import { CondimentInfo, FoodInfo } from '../model/DataModels'
import router from '@ohos.router'
import { MockCondiment } from '../mock/MockCondiment'

@CustomDialog
struct CondimentDialog {
  controller: CustomDialogController
  mockCondiment: MockCondiment = AppStorage.Link('appCondiment').get();
  @State condimentList: CondimentInfo[] = [...this.mockCondiment.getCondimentList()]

  scroller: Scroller = new Scroller();
  build(){
    Column(){
      Scroll(this.scroller){
        Column(){
          ForEach(this.condimentList, (item: CondimentInfo, index: number) => {
            Row(){
              Text(item.name)
                .fontSize(30)
              Toggle({type: ToggleType.Checkbox, isOn: item.is_exist})
                .height(30)
                .onChange((isOn: boolean) => {
                  this.mockCondiment.setCondimentAvailable(index, isOn)
                })
            }
            .height(43)
          })
        }
        // .backgroundColor(Color.Grey)
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)
    }
    .margin({ bottom: 10 })
    .height(130)
    .width(130)
  }
}

@Component
struct MenuPageTitle {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CondimentDialog()
  })

  build() {
    Row() {
      Image($r('app.media.back'))
        .width(30)
        .height(30)
        .onClick(() => {
          // router.clear()
          router.back()
        })
      Text("菜谱")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 1 })
        .width("46%")
        .textAlign(TextAlign.End)
        .fontColor(Color.Black)
      Blank()
      Button('调味品管理',{ type: ButtonType.Normal})
        .borderRadius(12).backgroundColor('#FF8C69').opacity(0.9).fontSize(30).height(60)
        .onClick(()=>{
          this.dialogController.open()
        })
    }
    .padding(10)
    .width('100%')
    .height("8%")
    .backgroundColor('#FF8C69')
  }
}

@Entry
@Component
struct Menus {
  private menuList: MenuViewModel = new MenuViewModel()
  mockDB : MockDB = AppStorage.Link('appDB').get();
  @State foodList: FoodInfo[] = [...this.mockDB.getFoodList()]

  build(){
    Column(){
      MenuPageTitle()
      MenuList({menuList: this.menuList})
    }
  }
}