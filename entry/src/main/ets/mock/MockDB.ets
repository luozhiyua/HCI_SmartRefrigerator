import { FoodInfo } from '../model/DataModels'

export class MockDB{
  db: Map<number,FoodInfo> = new Map<number,FoodInfo>()
  idCounter: number = 7

  constructor() {
    this.db.set(1,new FoodInfo(1,'番茄', $r('app.media.tomato'), "蔬菜", "2022-11-27", "左边一层", "2","个", false));
    this.db.set(2,new FoodInfo(2,'坚果', $r('app.media.walnut'), "零食", "2022-12-20", "左边二层", "0.5","千克", false));
    this.db.set(3,new FoodInfo(3,'黄瓜', $r('app.media.cucumber'), "蔬菜", "2023-12-16", "左边三层", "3","个", false));
    this.db.set(4,new FoodInfo(4,'蓝莓', $r('app.media.blueberry'), "水果", "2023-12-12", "左边三层", "3","个", false));
    this.db.set(5,new FoodInfo(5,'螃蟹', $r('app.media.crab'), "海鲜", "2023-12-8", "左边三层", "3","个", true));
    this.db.set(6,new FoodInfo(6,'雪糕', $r('app.media.icecream'), "零食", "2024-01-21", "右边二层", "1", "个", true));
  }

  editFoodInfo(newFood : FoodInfo){
    this.db.set(newFood.id,newFood)
  }

  deleteFood(id : number){
    this.db.delete(id)
  }

  getFoodList(){
    // return this.dba;
    return this.db.values();
  }

  findFoodItem(id: number){
    return this.db.get(id)
    // return this.db.filter(item => (item.id === id))
  }

  getNewID(){
    return this.idCounter++;
  }



}