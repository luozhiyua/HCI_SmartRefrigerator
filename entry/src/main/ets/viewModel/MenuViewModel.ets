import {MenuInfo} from '../model/DataModels'
import {RecipeInfo1, RecipeInfo2} from '../common/RecipeDetailConstants'


export class MenuViewModel{

  private menuInfoList: Array<MenuInfo> = new Array

  private menuInfo1: MenuInfo = new MenuInfo(RecipeInfo1.image, RecipeInfo1.recipe_name,RecipeInfo1.description,RecipeInfo1.cookTime, RecipeInfo1.ingredients, RecipeInfo1.steps)
  private menuInfo2: MenuInfo = new MenuInfo(RecipeInfo2.image, RecipeInfo2.recipe_name,RecipeInfo2.description,RecipeInfo2.cookTime, RecipeInfo2.ingredients, RecipeInfo2.steps)

  public getMenuList(): Array<MenuInfo>{
     this.menuInfoList.push(this.menuInfo1)
     this.menuInfoList.push(this.menuInfo2)
     return this.menuInfoList
  }


  public getMenuInfo(id: number): MenuInfo{
    return this.getMenuList()[id];
  }


}