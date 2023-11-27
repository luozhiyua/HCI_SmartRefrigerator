import {FoodInfo} from '../model/DataModels'


export class FoodViewModel{

  public foodList: FoodInfo[];

  constructor() {
    this.foodList = new Array<FoodInfo>();
  }


  initData(){
    // TODO: 从远处 GET
    // let httpRequest = http.createHttp();
    // httpRequest.request(
    //   SERVER_ADDR+'/foodList',
    //   {
    //     method: http.RequestMethod.GET,
    //   }, (err, data) => {
    //   if (!err) {
    //     // 数据处理
    //     console.info('get it ! '+ data);
    //   } else {
    //     console.info('error:' + JSON.stringify(err));
    //   }
    //   httpRequest.destroy();
    // });

    // this.foodList.push(new FoodItem(1,"鸡蛋","3天","10个","肉类","冷藏1层", $r('app.media.tomato')));
    // this.foodList.push(new FoodItem(2,"鸡肉","3天","10个","肉类","冷藏1层", $r('app.media.strawberry')));
    // this.foodList.push(new FoodItem(3,"生菜","3天","10个","蔬菜","冷藏1层", $r('app.media.mushroom')));
    // this.foodList.push(new FoodItem(4,"苹果","3天","10个","水果","冷藏1层", $r('app.media.icecream')));
    // this.foodList.push(new FoodItem(5,"白菜","3天","10个","蔬菜","冷藏1层", $r('app.media.crab')));
    this.foodList.push(new FoodInfo("猪肉", $r('app.media.blueberry'), "肉类", "3天", "左侧", "冷藏1层", "10", "个", true));

  }

  getData(){
    this.initData()
    return this.foodList;
  }



}