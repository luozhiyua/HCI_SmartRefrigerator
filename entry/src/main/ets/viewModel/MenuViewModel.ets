import {MenuInfo} from '../model/DataModels'
import {RecipeInfo} from '../common/RecipeDetailConstants'


export class MenuViewModel{

  private menuInfoList: Array<MenuInfo> = new Array

  private menuInfo: MenuInfo = new MenuInfo(RecipeInfo.image, RecipeInfo.recipe_name, RecipeInfo.ingredients, RecipeInfo.steps)

  public getMenuList(): Array<MenuInfo>{
    this.menuInfoList.push(this.menuInfo)
    this.menuInfoList.push(this.menuInfo)
    this.menuInfoList.push(this.menuInfo)
    this.menuInfoList.push(this.menuInfo)
    this.menuInfoList.push(this.menuInfo)
    this.menuInfoList.push(this.menuInfo)
    this.menuInfoList.push(this.menuInfo)
    this.menuInfoList.push(this.menuInfo)
    return this.menuInfoList
  }


  public getMenuInfo(): MenuInfo{
    return this.menuInfo;
  }


}