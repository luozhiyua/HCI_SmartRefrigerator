import {MenuInfo} from '../model/DataModels'
import {RecipeInfo1, RecipeInfo2,RecipeInfo3,RecipeInfo4,RecipeInfo5,RecipeInfo6,RecipeInfo7,RecipeInfo8,RecipeInfo9,RecipeInfo10} from '../common/RecipeDetailConstants'


export class MenuViewModel{

  private menuInfoList: Array<MenuInfo> = new Array

  private menuInfo1: MenuInfo = new MenuInfo(RecipeInfo1.image, RecipeInfo1.recipe_name,RecipeInfo1.description,RecipeInfo1.cookTime, RecipeInfo1.ingredients, RecipeInfo1.steps)
  private menuInfo2: MenuInfo = new MenuInfo(RecipeInfo2.image, RecipeInfo2.recipe_name,RecipeInfo2.description,RecipeInfo2.cookTime, RecipeInfo2.ingredients, RecipeInfo2.steps)
  private menuInfo3: MenuInfo = new MenuInfo(RecipeInfo3.image, RecipeInfo3.recipe_name,RecipeInfo3.description,RecipeInfo3.cookTime, RecipeInfo3.ingredients, RecipeInfo3.steps)
  private menuInfo4: MenuInfo = new MenuInfo(RecipeInfo4.image, RecipeInfo4.recipe_name,RecipeInfo4.description,RecipeInfo4.cookTime, RecipeInfo4.ingredients, RecipeInfo4.steps)
  private menuInfo5: MenuInfo = new MenuInfo(RecipeInfo5.image, RecipeInfo5.recipe_name,RecipeInfo5.description,RecipeInfo5.cookTime, RecipeInfo5.ingredients, RecipeInfo5.steps)
  private menuInfo6: MenuInfo = new MenuInfo(RecipeInfo6.image, RecipeInfo6.recipe_name,RecipeInfo6.description,RecipeInfo6.cookTime, RecipeInfo6.ingredients, RecipeInfo6.steps)
  private menuInfo7: MenuInfo = new MenuInfo(RecipeInfo7.image, RecipeInfo7.recipe_name,RecipeInfo7.description,RecipeInfo7.cookTime, RecipeInfo7.ingredients, RecipeInfo7.steps)
  private menuInfo8: MenuInfo = new MenuInfo(RecipeInfo8.image, RecipeInfo8.recipe_name,RecipeInfo8.description,RecipeInfo8.cookTime, RecipeInfo8.ingredients, RecipeInfo8.steps)
  private menuInfo9: MenuInfo = new MenuInfo(RecipeInfo9.image, RecipeInfo9.recipe_name,RecipeInfo9.description,RecipeInfo9.cookTime, RecipeInfo9.ingredients, RecipeInfo9.steps)
  private menuInfo10: MenuInfo = new MenuInfo(RecipeInfo10.image, RecipeInfo10.recipe_name,RecipeInfo10.description,RecipeInfo10.cookTime, RecipeInfo10.ingredients, RecipeInfo10.steps)

  public getMenuList(): Array<MenuInfo>{
    this.menuInfoList.push(this.menuInfo1)
    this.menuInfoList.push(this.menuInfo2)
    this.menuInfoList.push(this.menuInfo3)
    this.menuInfoList.push(this.menuInfo4)
    this.menuInfoList.push(this.menuInfo5)
    this.menuInfoList.push(this.menuInfo6)
    this.menuInfoList.push(this.menuInfo7)
    this.menuInfoList.push(this.menuInfo8)
    this.menuInfoList.push(this.menuInfo9)
    this.menuInfoList.push(this.menuInfo10)
    return this.menuInfoList
  }


  public getMenuInfo(id: number): MenuInfo{
    return this.getMenuList()[id];
  }


}