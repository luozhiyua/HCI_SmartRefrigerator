import { FoodInfo } from '../model/DataModels'
import systemDateTime from '@ohos.systemDateTime'
import { getAddrLists, getAutoLists, getDetailLists, getFoodCategories, getSideLists, getunitLists } from '../model/DataUtil'
import router from '@ohos.router'

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

@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  build() {
    Column() {
      Text('提交成功').fontSize(25).margin({ top: 10, bottom: 10 }).height('38%')
      Button('确认',{ type: ButtonType.Normal})
        .onClick(() => {
          this.controller.close()
          router.back()
        }).backgroundColor('#F5F5F5').fontColor(Color.Red).fontSize(20).width('100%').height('55%')
    }.margin({ bottom: 10 }).height(130)
  }
}

@Component
struct inputSelectItem{
  @State text : string = ''
  @Consume settingParams: FoodInfo
  @Consume @Watch('onAutoModeUp') autoMode: boolean
  @Consume @Watch('onNameChange') NameChoosed: boolean
  chooseRange: string[]
  chooseKey: string
  itemID: number

  onNameChange(){
    if(this.itemID == 2){
      // TODO: 适当变更 this.settingParams.unit，替换这里的 '个‘
      this.text = '个'
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
        Text(this.text).fontSize(20)
        Image($r('app.media.selector'))
          .width(25)
          .height(25)
          .onClick(()=>{
            TextPickerDialog.show({
              range: this.chooseRange,
              onAccept: (value: TextPickerResult) => {
                if(this.itemID == 1){
                  // 只要是 name 变动，就应该触发自动选择图片和单位
                  this.NameChoosed = !this.NameChoosed
                }
                this.text = this.chooseRange[value.index]
                this.settingParams[this.chooseKey] = this.text
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
  @Consume settingParams: FoodInfo
  @Consume @Watch('onAutoModeUp') autoMode: boolean
  @State text : string = ''
  selectedDate: Date = new Date("2010-1-1")
  onAutoModeUp(){
    // 实际autoMode一直在变，只要变了就触发这里
    this.text = 'Fri Jan 12 2023'
    this.settingParams.freshDate = 'Fri Jan 12 2023'
  }

  build(){
    Row(){
      Flex({justifyContent: FlexAlign.SpaceBetween}){
        Text(this.text).fontSize(20)
        Image($r('app.media.selector'))
          .width(25)
          .height(25)
          .onClick(()=>{
            DatePickerDialog.show({
              start: new Date('1970-1-1'),
              end: new Date('2100-1-1'),
              selected: this.selectedDate,
              onAccept: (value: DatePickerResult) => {
                this.selectedDate.setFullYear(value.year, value.month, value.day)
                this.text = this.selectedDate.toDateString()
                this.settingParams.freshDate = this.text
              },
              onCancel: () => {

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

@Entry
@Component
struct FoodAddPage {
  @Provide settingParams: FoodInfo = new FoodInfo(0,'',$r('app.media.default_photo'),'','','','','0','',false);
  @State whe_frozen: boolean = false
  @State quantity: string = ''
  @Provide autoMode: boolean = false
  @Provide @Watch('onNameChange') NameChoosed: boolean = false
  @State foodImage: Resource = $r('app.media.default_photo')
  unit: string = '单位'

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample()
  })

  onNameChange(){
    // 此处主要用于图片自动识别，为避免自身不断回调，此处使用foodImage，而不改变settingParams.image
    // TODO:根据 name 得到图片resourse 赋值给 this.foodImage
    this.foodImage = $r('app.media.take_picture')
    this.settingParams.image = this.foodImage
  }

  build() {
    Column(){
      Row() {
        Image($r('app.media.return_icon'))
          .width(28)
          .height(28)
          .onClick(() => {
            router.back()
          })
        Column().width(5)
        Text('添加食物').fontSize(25)
        Blank()
        Button('自动识别', { type: ButtonType.Normal, stateEffect: true })
          .onClick(() => {
            this.autoMode = !this.autoMode
            this.foodImage = $r('app.media.lettuce')
            this.quantity = '1'
            this.whe_frozen = false
          })
          .borderRadius(12)
          .backgroundColor('#73CD57')
      }.width('95%')
      .margin(10)

      Row(){
        Column(){
          Text('冷\n藏\n室\n').fontSize(25)
            .height('50%').width('100%').textAlign(TextAlign.Center)
            .backgroundColor(this.whe_frozen ? '#FFFFFF':'#98FB98')
            .onClick(()=>{
              this.whe_frozen = false;
            })

          Text('冷\n冻\n室\n').fontSize(25)
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
              TextInput({placeholder: '请输入数量',text: this.quantity}).width('45%').height(38).boardItemStyle().type(InputType.Number)
                .onChange((value: string)=>{this.quantity = value})
              // TODO: 这里 InputType.Number 和 string 混用是否会出问题
              Row().width('5%')
              inputSelectItem({ text:this.unit, chooseRange: getunitLists(),chooseKey:'unit',itemID:2 }).width('45%')
            }

            Row(){
              inputSelectItem({ text:'左/右', chooseRange: getSideLists(),chooseKey:'side',itemID:3 }).width('45%')
              Row().width('5%')
              inputSelectItem({ text:'层数', chooseRange: getAddrLists(),chooseKey:'addr',itemID:4 }).width('45%')
            }
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
            router.back()
            // router.pushUrl({url: 'pages/Index'})
          })
          .buttonStyle()

        Row().width('10%')

        Button('提交',{ type: ButtonType.Normal, stateEffect: true })
          .onClick(()=>{
            this.settingParams.whe_frozen = this.whe_frozen
            this.settingParams.quantity = this.quantity

            // TODO: 进行食材保存, 保存 settingParams 即可

            this.dialogController.open()
          })
          .buttonStyle()
      }.margin({top:'6%'})

    }
  }
}