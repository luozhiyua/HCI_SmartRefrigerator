import router from '@ohos.router'
import { MockDB } from '../mock/MockDB';
import { FoodInfo } from '../model/DataModels'
import { getAddrLists, getSideLists } from '../model/DataUtil'

const params = router.getParams(); // 获取传递过来的参数对象
const foodItemID = params['foodId']

@Styles
function boardItemStyle() {
  .borderRadius(12)
  .backgroundColor('#FFF5EE')
  .margin(8)
}

@Styles
function buttonStyle() {
  .borderRadius(12)
  .width(100)
  .height(50)
  .backgroundColor('#73CD57')
}
@Styles
function cardStyle() {
  .height('100%')
  .padding({ top: 20, right: 20, left: 20 })
  .backgroundColor(Color.White)
  .borderRadius(12)
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
          router.replaceUrl({ url: 'pages/Home'})
        })
      Text("食物详情")
        .fontSize(25)
        .margin({ left: 20 })
      Blank()
      Button('自动识别',{ type: ButtonType.Normal})
        .borderRadius(12).backgroundColor('#73CD57').fontSize(20).height(50)
        .onClick(()=>{
          this.autoMode = !this.autoMode
        })
    }
    .padding(12)
    .width('100%')
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
        .fontSize(20)
        .margin({ top: 10, bottom: 10 })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .onClick(() => {
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('确定')
          .onClick(() => {
            this.mockDB.deleteFood(this.foodItemID)
            router.replaceUrl({ url: 'pages/Home'})
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }
  }
}

@Component
struct FoodImageDisplay {
  private foodInfo: FoodInfo
  @State imageBgColorA: number = 0
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm'

  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Image(this.foodInfo.image!)
        .backgroundColor(`rgba(255, 255, 255, ${this.imageBgColorA})`)
        .objectFit(ImageFit.Contain)
      Text(this.foodInfo.name)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 26, bottom: 18 })
    }
    .height(this.currentBreakpoint == 'lg' ? 166 : 280)
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
    .height(35)
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
          .width(25)
          .height(25)
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
    .height(35)
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

  fontSize: number = 20

  build(){
    Row() {
      Text(this.title)
        .fontSize(this.fontSize)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .align(Alignment.Start)
      Row() {
        Circle({ width: 6, height: 6 })
          .margin({ right: 12 })
          .fill(this.colorValue)

        if(this.chooseKey == 'category' || !this.whe_edit){
          Text(this.value)
            .fontSize(this.fontSize)
        }else if(this.chooseKey == 'quantity'){
          TextInput({placeholder:this.value.split(' ')[0], text: this.quantityValue})
            .onChange((newValue : string)=>{
              this.quantityValue = newValue
              this.editParams.quantity = this.quantityValue
            })
            .width('20%')
          Text(this.value.split(' ')[1]).padding({left:5}).fontSize(this.fontSize)

          Row().width('20%')

          Button('+',{type: ButtonType.Circle}).onClick(()=>{
            if(this.quantityValue == '')this.quantityValue = this.value.split(' ')[0]
            this.quantityValue = (Number.parseInt(this.quantityValue) + 1).toString()
            this.editParams.quantity = this.quantityValue
          }).margin(5).fontSize(25).backgroundColor('#73CD57')

          Button('-',{type: ButtonType.Circle}).onClick(()=>{
            if(this.quantityValue == '')this.quantityValue = this.value.split(' ')[0]
            this.quantityValue = (Number.parseInt(this.quantityValue) - 1).toString()
            this.editParams.quantity = this.quantityValue
          }).fontSize(25).backgroundColor('#73CD57')

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
        PageTitle({autoMode: $autoMode})
        FoodImageDisplay({ foodInfo: this.foodInfo })
        Column() {
          Column() {
            IngredientItem({title: "品类",colorValue: '#CCC',name: "品类",value: this.foodInfo.category,chooseKey: "category",chooseRange: this.nullValue}).height('15%')
            IngredientItem({title: '保质期',colorValue: '#9E9EFF',name: "日期",value: this.foodInfo.freshDate,chooseKey: "freshDate",chooseRange: this.nullValue}).height('15%')
            IngredientItem({title: '数量',colorValue: '#F5D640',name: "数量",value: this.quanShow,chooseKey: "quantity",chooseRange: this.nullValue}).height('15%')
            IngredientItem({title: '位置',colorValue: '#53F540',name: "冷藏/冷冻",value: this.foodInfo.whe_frozen ? "冷冻":"冷藏",chooseKey: "whe_frozen",chooseRange: ['冷藏','冷冻']}).height('15%')
            IngredientItem({title: '',colorValue: '#53F540',name: "左/右",value: this.foodInfo.side,chooseKey: "side",chooseRange: getSideLists()}).height('15%')
            IngredientItem({title: '',colorValue: '#53F540',name: "层数",value: this.foodInfo.addr,chooseKey: "addr",chooseRange: getAddrLists()}).height('15%')
          }
          .cardStyle()
        }
        .height(400)
        .margin({ top: 10, right: 10, left: 10 })

        Row(){
          if(!this.whe_edit){
            Button('删除',{ type: ButtonType.Normal}).onClick(()=>{
              this.deleteCheckController.open()
            }).buttonStyle().fontSize(20)
            Row().width('25%')
            Button('编辑',{ type: ButtonType.Normal}).onClick(()=>{
              this.whe_edit = true
            }).buttonStyle().fontSize(20)
          }else{
            Button('取消',{ type: ButtonType.Normal}).onClick(()=>{
              this.editParams = this.foodInfo
              this.whe_edit = false
            }).buttonStyle().fontSize(20)
            Row().width('25%')
            Button('完成',{ type: ButtonType.Normal}).onClick(()=>{
              this.editParams.id = foodItemID
              this.mockDB.editFoodInfo(this.editParams)
              this.foodInfo = this.editParams
              router.replaceUrl({ url: 'pages/FoodDetail', params: { foodId: foodItemID} })
            }).buttonStyle().fontSize(20)
          }
        }.margin({top:30})

      }
      .alignItems(HorizontalAlign.Center)
    }
    .backgroundColor('#EDF2F5')
    .height('100%')
    .align(Alignment.Top)
  }
}