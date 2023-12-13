import {MenuViewModel} from '../../viewModel/MenuViewModel'
import {MenuInfo} from '../../model/DataModels'
import router from '@ohos.router'

@Component
struct titleLine{
  build(){
    Column(){
      Text("推荐菜谱")
        .width('90%')
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Gray)
        .margin({top: '4%'})

    }
    .height("8%")
    .margin({top: '2%'})
    .alignItems(HorizontalAlign.Start)

  }

}



@Component
struct MenuListItem {
  private menu : MenuInfo;
  @State menuID: number = 0;

  build(){
    Row(){
      Image(this.menu.image)
        .width('30%')
        .height('90%')
        .margin({left:'3%'})
        .borderRadius(10)

      Text(this.menu.name)
        .fontSize(30)
        .margin({left: '5%'})
    }
    .height('25%')
    .width("90%")
    .margin({top: '5%', left: '5%',right:'5%'})
    .borderRadius(10)
    .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
    .onClick(() => {
      console.info(this.menuID.toString())
      router.pushUrl({url: 'pages/MenuDetail', params: { menuID: this.menuID}})
    })
  }



}

@Component
export struct MenuList{
  private menuList: MenuViewModel
  scroller: Scroller = new Scroller()
  build(){
    Column(){
      titleLine()
      List({scroller: this.scroller}){
        ForEach(this.menuList.getMenuList(), (item: MenuInfo, index: number) => {
          ListItem(){
            MenuListItem({menu: item, menuID: index})

          }
        })

      }
      .height('62%')

    }
  }

}