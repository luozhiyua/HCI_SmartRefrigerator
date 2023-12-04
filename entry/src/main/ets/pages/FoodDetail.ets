import router from '@ohos.router'
import { MockDB } from '../mock/MockDB';
import { FoodInfo } from '../model/DataModels'
import { getAddrLists, getSideLists } from '../model/DataUtil'

const params = router.getParams(); // 获取传递过来的参数对象
const foodItemID = params['foodId']
const show_edit = params['showEdit']

@Styles
function boardItemStyle() {
  .borderRadius(12)
  .backgroundColor('#FFF5EE')
  .margin(8)
}

@Styles
function buttonStyle() {
  .borderRadius(12)
  .width(130)
  .height(60)
  .backgroundColor('#73CD57')
}
@Styles
function cardStyle() {
  .height('100%')
  .padding({ top: 20, right: 30, left: 20 })
  .backgroundColor(Color.White)
  .borderRadius(30)
}

@Component
struct PageTitle {
  @Link autoMode: boolean
  build() {
    Row() {
      Image($r('app.media.back'))
        .width(25)
        .height(25)
        .onClick(() => {
          // router.replaceUrl({ url: 'pages/Home'})
          router.back()
        })
      Text("食物详情")
        .fontSize(30)
        .margin({ left: 10 })
      Blank()
      if(show_edit) {
        Button('自动识别',{ type: ButtonType.Normal})
          .borderRadius(12).backgroundColor('#73CD57').opacity(0.9).fontSize(22).height(30)
          .onClick(()=>{
            this.autoMode = !this.autoMode
          })
      }
    }
    .padding(20)
    .width('100%')
    .linearGradient({
      angle: 90,
      colors: [['#EDF2F5', 0.0], ['#73CD57', 0.9]]
    })
  }
}

@CustomDialog
struct CheckDelete {
  controller: CustomDialogController
  foodItemID: number
  mockDB : MockDB = AppStorage.Link('appDB').get();

  build() {
    Column() {
      Text('确定删除吗？')
        .fontSize(25)
        .margin({ top: 15, bottom: 15 })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .fontSize(22)
          .onClick(() => {
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('确定')
          .fontSize(22)
          .onClick(() => {
            this.mockDB.deleteFood(this.foodItemID)
            router.replaceUrl({ url: 'pages/Home'})
            // router.back()
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 5 })
    }
    .width("100%")
  }
}

@Component
struct FoodImageDisplay {
  private foodInfo: FoodInfo
  @State imageBgColorA: number = 0

  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Image(this.foodInfo.image!)
        .backgroundColor(`rgba(255, 255, 255, ${this.imageBgColorA})`)
        .objectFit(ImageFit.Contain)
      Text(this.foodInfo.name)
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 25, bottom: 13 })
    }
    .height(280)
  }
}

@Component
struct inputSelectItem{
  @State text : string = ''
  @Consume editParams: FoodInfo
  chooseRange: string[]
  chooseKey: string
  selectedIndex: number

  build(){
    Row(){
      Flex({justifyContent: FlexAlign.SpaceBetween}){
        Text(this.text).fontSize(20)
        Image($r('app.media.selector'))
          .width(25)
          .height(25)
          .onClick(()=>{
            TextPickerDialog.show({
              range: this.chooseRange,
              selected: this.selectedIndex,
              onAccept: (value: TextPickerResult) => {
                this.text = this.chooseRange[value.index]
                this.editParams[this.chooseKey] = this.text
              }
            })
          })
      }.margin({ left:8,right:8})
    }
    .width('100%')
    .height(30)
    .boardItemStyle()
  }
}

@Component
struct DateSelectItem{
  @Consume editParams: FoodInfo
  @State text : string = ''
  selectedDate: Date = new Date("2023-12-1")
  build(){
    Row(){
      Flex({justifyContent: FlexAlign.SpaceBetween}){
        Text(this.text).fontSize(20)
        Image($r('app.media.selector'))
          .width(22)
          .height(22)
          .onClick(()=>{
            DatePickerDialog.show({
              start: new Date('2023-1-1'),
              end: new Date('2100-1-1'),
              selected: this.selectedDate,
              onAccept: (value: DatePickerResult) => {
                this.selectedDate.setFullYear(value.year, value.month, value.day)
                this.text = value.year + '-' + value.month + '-' + value.day
                this.editParams.freshDate = this.text
              }
            })
          })
      }.margin({ left:8,right:8})
    }
    .width('100%')
    .height(30)
    .boardItemStyle()
  }
}

@Component
struct IngredientItem{
  title: string
  colorValue: string
  name: string
  value: string = ''
  chooseKey: string
  chooseRange: string[]
  @Consume whe_edit: boolean
  @Consume editParams: FoodInfo
  @State quantityValue: string = this.value

  fontSize: number = 22

  build(){
    Row() {
      Text(this.title)
        .fontSize(this.fontSize)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .align(Alignment.Start)
      Row() {
        Circle({ width: 9, height: 9 })
          .margin({ right: 12 })
          .fill(this.colorValue)

        if(this.chooseKey == 'category' || !this.whe_edit){
          Text(this.value)
            .fontSize(this.fontSize)
        }else if(this.chooseKey == 'quantity'){
          TextInput({placeholder:this.value.split(' ')[0], text: this.quantityValue})
            .onChange((newValue : string)=>{
              this.quantityValue = newValue
              this.editParams.quantity = this.quantityValue == '' ? this.value.split(' ')[0] : this.quantityValue
            })
            .width('30%')
            .height(50)
          Text(this.value.split(' ')[1]).padding({left:10}).fontSize(this.fontSize)

          Row().width('10%')

          Button('+',{type: ButtonType.Circle}).onClick(()=>{
            if(this.quantityValue == '')this.quantityValue = this.value.split(' ')[0]
            this.quantityValue = (Number.parseInt(this.quantityValue) + 1).toString()
            this.editParams.quantity = this.quantityValue
          }).margin(5).fontSize(20).backgroundColor('#73CD57')

          Button('-',{type: ButtonType.Circle}).onClick(()=>{
            if(this.quantityValue == '')this.quantityValue = this.value.split(' ')[0]
            this.quantityValue = (Number.parseInt(this.quantityValue) - 1).toString()
            this.editParams.quantity = this.quantityValue
          }).fontSize(20).backgroundColor('#73CD57')

        }else if(this.chooseKey == 'freshDate'){
          DateSelectItem({text: this.value}).width('80%')
        }
        else {
          inputSelectItem({text: this.value,chooseKey: this.chooseKey,chooseRange: this.chooseRange}).width('80%')
        }

      }
      .width('100%')
      .layoutWeight(2)
    }
    .margin({ bottom: 12,top: 6 })
  }

}

@Entry
@Component
struct FoodDetail {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm'
  mockDB : MockDB = AppStorage.Link('appDB').get();
  @State foodInfo: FoodInfo = this.mockDB.findFoodItem(foodItemID)
  @Provide editParams: FoodInfo = this.foodInfo;
  @Provide whe_edit: boolean = false
  @State @Watch('onAutoModeUp') autoMode: boolean = false
  nullValue: string[]
  quanShow: string = this.foodInfo.quantity + " " + this.foodInfo.unit

  // 这是用来控制 ”确认删除“弹窗的
  deleteCheckController: CustomDialogController = new CustomDialogController({
    builder: CheckDelete({foodItemID: this.foodInfo.id}),
    alignment : DialogAlignment.Center
  })

  onAutoModeUp(){
    this.whe_edit = true
    // TODO: 先不管，默认无变更值
  }

  build() {
    Scroll() {
      Column() {
        PageTitle({ autoMode: $autoMode })
        FoodImageDisplay({ foodInfo: this.foodInfo })
        Column() {
          Column() {
            IngredientItem({
              title: "品类",
              colorValue: '#CCC',
              name: "品类",
              value: this.foodInfo.category,
              chooseKey: "category",
              chooseRange: this.nullValue
            }).height('15%')
            IngredientItem({
              title: '数量',
              colorValue: '#F5D640',
              name: "数量",
              value: this.quanShow,
              chooseKey: "quantity",
              chooseRange: this.nullValue
            }).height('15%')
            IngredientItem({
              title: '保质期',
              colorValue: '#9E9EFF',
              name: "日期",
              value: this.foodInfo.freshDate,
              chooseKey: "freshDate",
              chooseRange: this.nullValue
            }).height('15%')
            IngredientItem({
              title: '位置',
              colorValue: '#AFEEEE',
              name: "冷藏/冷冻",
              value: this.foodInfo.whe_frozen ? "冷冻" : "冷藏",
              chooseKey: "whe_frozen",
              chooseRange: ['冷藏', '冷冻']
            }).height('15%')
            IngredientItem({
              title: '',
              colorValue: '#AFEEEE',
              name: "左/右",
              value: this.foodInfo.side,
              chooseKey: "side",
              chooseRange: getSideLists()
            }).height('15%')
            IngredientItem({
              title: '',
              colorValue: '#AFEEEE',
              name: "层数",
              value: this.foodInfo.addr,
              chooseKey: "addr",
              chooseRange: getAddrLists()
            }).height('15%')
          }
          .cardStyle()
        }
        .height(300)
        .margin({ top: 10, right: 10, left: 10 })
        .backgroundColor("#EDF2F5")

        if(show_edit) {
          Row() {
            if (!this.whe_edit) {
              Button('删除', { type: ButtonType.Normal }).onClick(() => {
                this.deleteCheckController.open()
              }).buttonStyle().fontSize(22)
              Row().width('15%')
              Button('编辑', { type: ButtonType.Normal }).onClick(() => {
                this.whe_edit = true
              }).buttonStyle().fontSize(22)
            } else {
              Button('取消', { type: ButtonType.Normal }).onClick(() => {
                this.editParams = this.foodInfo
                this.whe_edit = false
              }).buttonStyle().fontSize(22)
              Row().width('15%')
              Button('完成', { type: ButtonType.Normal }).onClick(() => {
                this.editParams.id = foodItemID
                this.mockDB.editFoodInfo(this.editParams)
                this.foodInfo = this.editParams
                router.replaceUrl({ url: 'pages/FoodDetail', params: { foodId: foodItemID, showEdit : true } })
              }).buttonStyle().fontSize(22)
            }
          }.margin({ top: 20 , left: 20, right: 20})
        }
      }
      .alignItems(HorizontalAlign.Center)
    }
    .height('100%')
    .align(Alignment.Top)
    .backgroundColor('#EDF2F5')
  }
}