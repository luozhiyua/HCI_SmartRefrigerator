import {MenuViewModel} from '../../viewModel/MenuViewModel'
import {CondimentInfo, FoodInfo, MenuInfo, MenuIngredientInfo} from '../../model/DataModels'
import router from '@ohos.router'
import { MockDB } from '../../mock/MockDB'
import { MockCondiment } from '../../mock/MockCondiment'

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
      router.replaceUrl({url: 'pages/MenuDetail', params: { menuID: this.menuID,index:this.menuID}})
    })
  }
}

@Component
struct MenuListItemAvail {
  private menu : MenuInfo;
  @State menuID: number = 0;

  build(){
    Column(){
      Image(this.menu.image)
        .width('85%')
        .height('70%')
        .margin({top:'3%'})
        .borderRadius(10)

      Text(this.menu.name)
        .fontSize(30)
        .margin({top: '3%'})
    }
    .height('85%')
    .width("30%")
    .margin({top: '5%', left: '2%',right:'2%'})
    .borderRadius(10)
    .shadow({radius: 30, color: Color.Gray, offsetX: 20, offsetY: 20})
    .onClick(() => {
      console.info(this.menuID.toString())
      router.replaceUrl({url: 'pages/MenuDetail', params: { menuID: this.menuID,index:this.menuID}})
    })
  }
}

@Component
export struct MenuList{
  private menuList: MenuViewModel
  mockDB : MockDB = AppStorage.Link('appDB').get();
  foodItems: FoodInfo[] = [...this.mockDB.getFoodList()]
  mockCondiment: MockCondiment = AppStorage.Link('appCondiment').get();
  condimentItems: CondimentInfo[] = [...this.mockCondiment.getCondimentList()]
  private is_available_menu: Array<boolean> = new Array<boolean>()
  scroller: Scroller = new Scroller()

  aboutToAppear(){
    let Menus: Array<MenuInfo> = this.menuList.getMenuList();
    for(let menuIndex = 0; menuIndex < Menus.length; menuIndex++) {
      let ingredients = Menus[menuIndex].ingredients;
      for (let i = 0; i < ingredients.length; i++) {
        let item: MenuIngredientInfo = ingredients[i]
        let isFound: boolean = false;
        for (let index = 0; index < this.foodItems.length; index++) {
          const element = this.foodItems[index];
          if(element.name == item.name) {
            isFound = true
          }
        }
        for (let index = 0; index < this.condimentItems.length; index++) {
          const element = this.condimentItems[index];
          if(element.name == item.name && element.is_exist) {
            isFound = true
          }
        }
        if(!isFound) {
          this.is_available_menu.push(false)
          break
        } else if (i == ingredients.length - 1) {
          this.is_available_menu.push(true)
        }
      }
    }
  }

  build(){
    Column(){
      Row(){
        Text("可做菜谱")
          .width('85%')
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Gray)
          .margin({top: '2%'})
      }
      .height("6%")
      .margin({top: '2%'})
      List({scroller: this.scroller}){
        ForEach(this.menuList.getMenuList(), (item: MenuInfo, index: number) => {
          ListItem(){
            // MenuListItem({menu: item, menuID: index})
            if (this.is_available_menu[index]) {
              MenuListItemAvail({menu: item, menuID: index})
            }
          }
        })
      }
      .padding({left: "1%", right: "1%"})
      .listDirection(Axis.Horizontal)
      .height('26%')


      Row(){
        Text("推荐菜谱")
          .width('85%')
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Gray)
          .margin({top: '3%'})
      }
      .height("6%")
      .margin({top: '2%', bottom:"2%"})

      List({scroller: this.scroller}){
        ForEach(this.menuList.getMenuList(), (item: MenuInfo, index: number) => {
          ListItem(){
            MenuListItem({menu: item, menuID: index})
          }
        })
        ListItem() {
          Column() {
          }
          .height("25%")
        }
      }
      .height('64%')
    }
    }

}