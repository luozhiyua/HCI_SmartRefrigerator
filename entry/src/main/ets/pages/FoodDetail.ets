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
  .padding({ top: 30, right: 50, left: 50 })
  .backgroundColor(Color.White)
  .borderRadius(40)
}

@Component
struct PageTitle {
  @Link autoMode: boolean
  build() {
    Row() {
      Image($r('app.media.back'))
        .width(35)
        .height(35)
        .onClick(() => {
          if(show_edit)router.replaceUrl({ url: 'pages/FoodManage'})
          else router.back()
          // router.back()
        })
      Text("食物详情")
        .fontSize(40)
        .margin({ left: 20 })
      Blank()
      if(show_edit) {
        Button('自动识别',{ type: ButtonType.Normal})
          .borderRadius(12).backgroundColor('#73CD57').opacity(0.9).fontSize(30).height(60)
          .onClick(()=>{
            this.autoMode = !this.autoMode
          })
      }
    }
    .padding(20)
    .width('100%')
    .linearGradient({
      angle: 60,
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
        .fontSize(28)
        .margin({ top: 15, bottom: 15 })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .fontSize(25)
          .onClick(() => {
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('确定')
          .fontSize(25)
          .onClick(() => {
            this.mockDB.deleteFood(this.foodItemID)
            router.replaceUrl({ url: 'pages/FoodManage'})
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
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 45, bottom: 18 })
    }
    .height(300)
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
        Text(this.text).fontSize(30)
        Image($r('app.media.selector'))
          .width(25)
          .height(25)
      }.margin({ left:8,right:8})
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
    }
    .width('100%')
    .height(39)
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
        Text(this.text).fontSize(30)
        Image($r('app.media.selector'))
          .width(22)
          .height(22)
      }.margin({ left:8,right:8})
      .onClick(()=>{
        DatePickerDialog.show({
          start: new Date('2023-1-1'),
          end: new Date('2100-1-1'),
          selected: this.selectedDate,
          onAccept: (value: DatePickerResult) => {
            this.selectedDate.setFullYear(value.year, value.month, value.day)
            this.text = value.year + '-' + (value.month+1) + '-' + value.day
            this.editParams.freshDate = this.text
          }
        })
      })
    }
    .width('100%')
    .height(39)
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
  @Consume @Watch('onEditCancel') whe_edit: boolean
  @Consume editParams: FoodInfo
  @State quantityValue: string = this.value
  fontSize: number = 30

  onEditCancel(){
    if(this.whe_edit == false)this.quantityValue = ''
  }

  build(){
    Row() {
      Text(this.title)
        .fontSize(this.fontSize)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .align(Alignment.Start)
      Row() {
        Circle({ width: 9, height: 9 })
          .margin({ right: 15 })
          .fill(this.colorValue)

        if(this.chooseKey == 'category' || !this.whe_edit){
          Text(this.value)
            .fontSize(this.fontSize)
        }else if(this.chooseKey == 'quantity'){
          TextInput({placeholder:this.editParams.quantity, text: this.quantityValue})
            .onChange((newValue : string)=>{
              this.quantityValue = newValue
              this.editParams.quantity = this.quantityValue == '' ? this.value.split(' ')[0] : this.quantityValue
            })
            .fontSize(30)
            .width('30%')
            .height('100%')
          Text(this.value.split(' ')[1]).padding({left:10}).fontSize(this.fontSize)

          Row().width('10%')

          Button('+',{type: ButtonType.Circle}).onClick(()=>{
            if(this.quantityValue == '')this.quantityValue = this.value.split(' ')[0]
            this.quantityValue = (Number.parseInt(this.quantityValue) + 1).toString()
            this.editParams.quantity = this.quantityValue
          }).margin(5).fontSize(35).backgroundColor('#73CD57')

          Button('-',{type: ButtonType.Circle}).onClick(()=>{
            if(this.quantityValue == '')this.quantityValue = this.value.split(' ')[0]
            this.quantityValue = (Number.parseInt(this.quantityValue) - 1).toString()
            this.editParams.quantity = this.quantityValue
          }).fontSize(35).backgroundColor('#73CD57')

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
    .margin({ bottom: 20,top: 6 })
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
            }).height('20%')
            IngredientItem({
              title: '数量',
              colorValue: '#F5D640',
              name: "数量",
              value: this.quanShow,
              chooseKey: "quantity",
              chooseRange: this.nullValue
            }).height('20%')
            IngredientItem({
              title: '保质期',
              colorValue: '#9E9EFF',
              name: "日期",
              value: this.foodInfo.freshDate,
              chooseKey: "freshDate",
              chooseRange: this.nullValue
            }).height('20%')
            IngredientItem({
              title: '位置',
              colorValue: '#AFEEEE',
              name: "冷藏/冷冻",
              value: this.foodInfo.whe_frozen ? "冷冻" : "冷藏",
              chooseKey: "whe_frozen",
              chooseRange: ['冷藏', '冷冻']
            }).height('20%')
            IngredientItem({
              title: '',
              colorValue: '#AFEEEE',
              name: "位置",
              value: this.foodInfo.addr,
              chooseKey: "addr",
              chooseRange: getAddrLists()
            }).height('20%')
          }
          .cardStyle()
        }
        .height(400)
        .margin({ top: 10, right: 30, left: 30 })
        .backgroundColor("#EDF2F5")

        if(show_edit) {
          Row() {
            if (!this.whe_edit) {
              Button('删除', { type: ButtonType.Normal }).onClick(() => {
                this.deleteCheckController.open()
              }).buttonStyle().fontSize(30)
              Row().width('25%')
              Button('编辑', { type: ButtonType.Normal }).onClick(() => {
                this.whe_edit = true
              }).buttonStyle().fontSize(30)
            } else {
              Button('取消', { type: ButtonType.Normal }).onClick(() => {
                this.editParams = this.foodInfo
                this.whe_edit = false
              }).buttonStyle().fontSize(30)
              Row().width('25%')
              Button('完成', { type: ButtonType.Normal }).onClick(() => {
                this.editParams.id = foodItemID
                this.mockDB.editFoodInfo(this.editParams)
                this.foodInfo = this.editParams
                router.replaceUrl({ url: 'pages/FoodDetail', params: { foodId: foodItemID, showEdit : true } })
              }).buttonStyle().fontSize(30)
            }
          }.margin({ top: 30 , left: 20, right: 20})
        }
      }
      .alignItems(HorizontalAlign.Center)
    }
    .height('100%')
    .align(Alignment.Top)
    .backgroundColor('#EDF2F5')
  }
}
