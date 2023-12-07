import { FoodInfo } from '../model/DataModels'
import systemDateTime from '@ohos.systemDateTime'
import { getAddrLists, getAutoIamge, getAutoLists, getAutoUnit, getDetailLists, getFoodCategories, getSideLists, getunitLists } from '../model/DataUtil'
import router from '@ohos.router'
import { MockDB } from '../mock/MockDB'

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
  .height(60)
  .backgroundColor('#73CD57')
}

@CustomDialog
struct ToCommitDialog {
  controller: CustomDialogController
  text: string = ''

  build() {
    Column() {
      Text(this.text).fontSize(25).margin({ top: 10, bottom: 10 }).height('38%')
      Button('确认',{ type: ButtonType.Normal})
        .onClick(() => {
          this.controller.close()
          if(this.text == "提交已成功") router.replaceUrl({url:'pages/FoodManage'})
        }).backgroundColor('#F5F5F5').fontColor(Color.Red).fontSize(20).width('100%').height('55%')
    }.margin({ bottom: 10 }).height(130)
  }
}

@CustomDialog
struct inputSelectDialog {
  controller: CustomDialogController
  text: string = ''
  chooseRange: string[]
  onClickFunction: Function = () => {}
  chooseKey: string

  scroller: Scroller = new Scroller()

  @State toInput: boolean = false
  inputValue: string = ''
  @State finalValue: string = ''

  build() {
    Column() {
      Row(){
        Text('选择项如下:').fontSize(30)
      }.justifyContent(FlexAlign.Start).margin(5)

      Column(){
        Scroll(this.scroller){
          Column(){
            ForEach(this.chooseRange, (item: string) => {
              Text(item).onClick(()=>{
                this.finalValue = item
              }).fontSize(25).margin(5).fontColor(item == this.finalValue ? '#1E90FF' : '#000000')
              Divider().color('#DCDCDC')
            }, (item: string) => item)
            if(this.chooseKey == 'name'){
              Row(){
                if(!this.toInput){
                  Text('其他').fontSize(25).margin(5)
                }else{
                  TextInput({placeholder:'其他'})
                    .onChange((value : string)=>{
                      this.inputValue = value
                      this.finalValue = this.inputValue
                    }).width('80%').fontSize(25)
                }
              }.onClick(()=>{
                this.finalValue='其他'
                this.toInput = true
              })
            }
          }
        }.scrollable(ScrollDirection.Vertical)  // 滚动方向纵向
        .scrollBar(BarState.On)  // 滚动条常驻显示
        .scrollBarColor(Color.Gray)  // 滚动条颜色
        .scrollBarWidth(10) // 滚动条宽度
        .edgeEffect(EdgeEffect.None)
      }
      .height('75%')
      .margin({top: 5})

      Row(){
        Button('取消',{ type: ButtonType.Normal})
          .onClick(()=>{
            this.controller.close()
          }).borderRadius(12).fontSize(20)
          .backgroundColor('#73CD57')
        Row().width('5%')
        Button('确认',{ type: ButtonType.Normal})
        .onClick(() => {
          if(this.finalValue != '') this.onClickFunction(this.finalValue)
          this.controller.close()
        }).borderRadius(12).fontSize(20)
          .backgroundColor('#73CD57')
      }.margin(5)
    }.margin({ bottom: 10 }).height('50%').width('100%')
  }
}

@Component
struct inputSelectItem{
  @State text : string = ''
  @Consume settingParams: FoodInfo
  @Consume @Watch('onAutoModeUp') autoMode: boolean
  @Consume @Watch('onNameChange') NameChoosed: boolean
  @Consume @Watch('onCategoryChange') CategoryChoosed: boolean
  @State chooseRange: string[] = []
  chooseKey: string = ''
  itemID: number
  selectedIndex: number

  dialogController: CustomDialogController = new CustomDialogController({
    builder: inputSelectDialog(
      { chooseRange: this.chooseRange,
        chooseKey: this.chooseKey,
        onClickFunction: (text)=>{
          this.text = text
          this.settingParams[this.chooseKey] = text
          if(this.itemID == 1){
            this.NameChoosed = !this.NameChoosed
          }else if(this.itemID == 0)this.CategoryChoosed = !this.CategoryChoosed
        }
      }
    ),
    alignment: DialogAlignment.Bottom
  })

  onCategoryChange(){
    if(this.itemID == 1) {
      this.chooseRange = getDetailLists(this.settingParams.category)
    }
  }

  onNameChange(){
    if(this.itemID == 2){
      this.text = this.settingParams.name === '' ? '' : getAutoUnit(this.settingParams.name)
      this.text = this.text == null ? '单位' : this.text
      this.settingParams.unit = this.text
    }
  }

  onAutoModeUp(){
    // 实际autoMode一直在变，只要变了就触发这里
    this.text = getAutoLists()[this.itemID]
    this.settingParams[this.chooseKey] = this.text
  }

  build(){
    Row(){
      Flex({justifyContent: FlexAlign.SpaceBetween}){
        Text(this.text).fontSize(25)
        Image($r('app.media.selector'))
          .width(25)
          .height(25)
      }.margin({ left:8,right:8})
      .onClick(()=>{
        this.dialogController.open()
        // TextPickerDialog.show({
        //   range: this.chooseRange,
        //   selected: this.selectedIndex,
        //   onAccept: (value: TextPickerResult) => {
        //     this.selectedIndex = value.index
        //     this.text = this.chooseRange[value.index]
        //     this.settingParams[this.chooseKey] = this.text
        //     if(this.itemID == 1){
        //       this.NameChoosed = !this.NameChoosed
        //     }else if(this.itemID == 0)this.CategoryChoosed = !this.CategoryChoosed
        //   }
        // })
      })
    }
    .width('100%')
    .height('13%')
    .boardItemStyle()
  }
}

@Component
struct DateSelectItem{
  @Consume settingParams: FoodInfo
  @Consume @Watch('onAutoModeUp') autoMode: boolean
  @State text : string = ''
  selectedDate: Date = new Date("2023-12-1")
  onAutoModeUp(){
    // 实际autoMode一直在变，只要变了就触发这里
    this.text = 'Fri Jan 12 2023'
    this.settingParams.freshDate = 'Fri Jan 12 2023'
  }

  build(){
    Row(){
      Flex({justifyContent: FlexAlign.SpaceBetween}){
        Text(this.text).fontSize(25)
        Image($r('app.media.selector'))
          .width(25)
          .height(25)
      }.margin({ left:8,right:8})
      .onClick(()=>{
        DatePickerDialog.show({
          start: new Date('2023-1-1'),
          end: new Date('2100-1-1'),
          selected: this.selectedDate,
          onAccept: (value: DatePickerResult) => {
            this.selectedDate.setFullYear(value.year, value.month, value.day)
            this.text = value.year + '-' + value.month + '-' + value.day
            this.settingParams.freshDate = this.text
          }
        })
      })
    }
    .width('100%')
    .height('13%')
    .boardItemStyle()
  }
}

@Entry
@Component
struct FoodAddPage {
  @Provide settingParams: FoodInfo = new FoodInfo(0,'',$r('app.media.default_photo'),'','','','','',false);
  @State whe_frozen: boolean = false
  @State quantity: string = ''
  @Provide autoMode: boolean = false
  @Provide @Watch('onNameChange') NameChoosed: boolean = false
  @Provide CategoryChoosed: boolean = false
  @State foodImage: Resource = $r('app.media.default_photo')
  mockDB : MockDB = AppStorage.Link('appDB').get();
  tipText: string = ''

  dialogController: CustomDialogController = new CustomDialogController({
    builder: ToCommitDialog({text: this.tipText})
  })

  onNameChange(){
    this.foodImage = this.settingParams.name === '' ? $r('app.media.default_photo') : getAutoIamge(this.settingParams.name)
    this.settingParams.image = this.foodImage
  }

  build() {
    Column(){
      Row() {
        Image($r('app.media.return_icon'))
          .width(32)
          .height(32)
          .onClick(() => {
            router.replaceUrl({url:'pages/FoodManage'})
          })
        Column().width(5)
        Text('添加食物').fontSize(40)
        Blank()
        Button('自动识别', { type: ButtonType.Normal, stateEffect: true })
          .onClick(() => {
            this.autoMode = !this.autoMode
            this.foodImage = $r('app.media.lettuce')
            this.quantity = '1'
            this.whe_frozen = false
          })
          .fontSize(30).height(60)
          .borderRadius(12)
          .backgroundColor('#73CD57')
      }.width('95%')
      .margin(10)

      Row(){
        Column(){
          Text('冷\n藏\n室\n').fontSize(28)
            .height('50%').width('100%').textAlign(TextAlign.Center)
            .backgroundColor(this.whe_frozen ? '#FFFFFF':'#98FB98')
            .onClick(()=>{
              this.whe_frozen = false;
            })

          Text('冷\n冻\n室\n').fontSize(28)
            .height('50%').width('100%').textAlign(TextAlign.Center)
            .backgroundColor(this.whe_frozen ? '#98FB98':'#FFFFFF')
            .onClick(()=>{
              this.whe_frozen = true;
            })
        }
        .width('30%')
        .height('100%')
        .justifyContent(FlexAlign.SpaceAround)

        Column(){
          Column(){
            Image(this.foodImage).objectFit(ImageFit.Contain)
          }.height('20%')

          Column().height('5%')

          Column(){
            inputSelectItem({ text:'品类', chooseRange: getFoodCategories(),chooseKey:'category',itemID:0 }).width('95%')
            inputSelectItem({ text:'名称', chooseRange: getDetailLists(this.settingParams.category),chooseKey:'name',itemID:1 }).width('95%')
            DateSelectItem({text:'保质期'}).width('95%')

            Row(){
              TextInput({placeholder: '请输入数量',text: this.quantity}).width('45%').height('13%').boardItemStyle().type(InputType.Number)
                .onChange((value: string)=>{this.quantity = value}).fontSize(25)
              Row().width('5%')
              inputSelectItem({ text:'单位', chooseRange: getunitLists(),chooseKey:'unit',itemID:2 }).width('45%')
            }
            inputSelectItem({ text:'位置', chooseRange: getAddrLists(),chooseKey:'addr',itemID:3 }).width('95%')
            // Row(){
            //   inputSelectItem({ text:'左/右', chooseRange: getSideLists(),chooseKey:'side',itemID:3 }).width('45%')
            //   Row().width('5%')
            //   inputSelectItem({ text:'层数', chooseRange: getAddrLists(),chooseKey:'addr',itemID:4 }).width('45%')
            // }
          }.height('70%').justifyContent(FlexAlign.SpaceAround)

        }.backgroundColor('##FFFFFF')
        .width('65%')
        .margin({left:10,right:5})
      }
      .width('95%')
      .height('50%')
      .backgroundColor('#EDF2F5')
      .borderRadius(18)
      .margin({top:20})


      Row(){
        Button('取消',{ type: ButtonType.Normal, stateEffect: true })
          .onClick(()=>{
            router.replaceUrl({url: 'pages/AddFoodPage'})
          })
          .buttonStyle().fontSize(30)

        Row().width('10%')

        Button('提交',{ type: ButtonType.Normal, stateEffect: true })
          .onClick(()=>{
            this.settingParams.whe_frozen = this.whe_frozen
            this.settingParams.image = this.foodImage
            this.settingParams.quantity = this.quantity

            if(this.settingParams.category == ''){
              this.tipText = "未选择品类！"
            }else if(this.settingParams.name == ''){
              this.tipText = "未选择名称！"
            }else if(this.settingParams.freshDate == ''){
              this.tipText = "未选择保质期！"
            }else if(this.settingParams.addr == ''){
              this.tipText = "未选择位置！"
            }else if(this.settingParams.quantity == ''){
              this.tipText = "未填入数量！"
            }else if(this.settingParams.unit == ('' || '单位')){
              this.tipText = "未选择单位！"
            } else {
              this.settingParams.id = this.mockDB.getNewID()
              this.mockDB.editFoodInfo(this.settingParams)
              this.tipText = "提交已成功"
            }
            this.dialogController.open()
          })
          .buttonStyle().fontSize(30)
      }.margin({top:'6%'})

    }
  }
}