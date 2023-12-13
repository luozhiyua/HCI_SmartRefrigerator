import {MenuInfo} from '../model/DataModels'
import {RecipeInfo1, RecipeInfo10, RecipeInfo11, RecipeInfo12, RecipeInfo13, RecipeInfo14, RecipeInfo15, RecipeInfo16, RecipeInfo17, RecipeInfo18, RecipeInfo19, RecipeInfo2, RecipeInfo20, RecipeInfo3, RecipeInfo4, RecipeInfo5, RecipeInfo6, RecipeInfo7, RecipeInfo8, RecipeInfo9} from '../common/RecipeDetailConstants'


export class MenuViewModel{

  private menuInfoList: Array<MenuInfo> = new Array

<<<<<<< HEAD
  private menuInfo1: MenuInfo = new MenuInfo(RecipeInfo1.image, RecipeInfo1.recipe_name,RecipeInfo1.description,RecipeInfo1.cookTime, RecipeInfo1.ingredients, RecipeInfo1.steps)
  private menuInfo2: MenuInfo = new MenuInfo(RecipeInfo2.image, RecipeInfo2.recipe_name,RecipeInfo2.description,RecipeInfo2.cookTime, RecipeInfo2.ingredients, RecipeInfo2.steps)
=======
  // private menuInfo1: MenuInfo = new MenuInfo(RecipeInfo1.image, RecipeInfo1.recipe_name, RecipeInfo1.ingredients, RecipeInfo1.steps)
  // private menuInfo2: MenuInfo = new MenuInfo(RecipeInfo2.image, RecipeInfo2.recipe_name, RecipeInfo2.ingredients, RecipeInfo2.steps)
>>>>>>> dcad3564301b2c0fd13ecbb945736161a7051a5e

  public getMenuList(): Array<MenuInfo>{
     this.menuInfoList.push(new MenuInfo(RecipeInfo1.image, RecipeInfo1.recipe_name, RecipeInfo1.ingredients, RecipeInfo1.steps))
     this.menuInfoList.push(new MenuInfo(RecipeInfo2.image, RecipeInfo2.recipe_name, RecipeInfo2.ingredients, RecipeInfo2.steps))
     this.menuInfoList.push(new MenuInfo(RecipeInfo3.image, RecipeInfo3.recipe_name, RecipeInfo3.ingredients, RecipeInfo3.steps))
     this.menuInfoList.push(new MenuInfo(RecipeInfo4.image, RecipeInfo4.recipe_name, RecipeInfo4.ingredients, RecipeInfo4.steps))
     this.menuInfoList.push(new MenuInfo(RecipeInfo5.image, RecipeInfo5.recipe_name, RecipeInfo5.ingredients, RecipeInfo5.steps))
     this.menuInfoList.push(new MenuInfo(RecipeInfo6.image, RecipeInfo6.recipe_name, RecipeInfo6.ingredients, RecipeInfo6.steps))
     this.menuInfoList.push(new MenuInfo(RecipeInfo7.image, RecipeInfo7.recipe_name, RecipeInfo7.ingredients, RecipeInfo7.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo8.image, RecipeInfo8.recipe_name, RecipeInfo8.ingredients, RecipeInfo8.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo9.image, RecipeInfo9.recipe_name, RecipeInfo9.ingredients, RecipeInfo9.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo10.image, RecipeInfo10.recipe_name, RecipeInfo10.ingredients, RecipeInfo10.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo11.image, RecipeInfo11.recipe_name, RecipeInfo11.ingredients, RecipeInfo11.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo12.image, RecipeInfo12.recipe_name, RecipeInfo12.ingredients, RecipeInfo12.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo13.image, RecipeInfo13.recipe_name, RecipeInfo13.ingredients, RecipeInfo13.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo14.image, RecipeInfo14.recipe_name, RecipeInfo14.ingredients, RecipeInfo14.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo15.image, RecipeInfo15.recipe_name, RecipeInfo15.ingredients, RecipeInfo15.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo16.image, RecipeInfo16.recipe_name, RecipeInfo16.ingredients, RecipeInfo16.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo17.image, RecipeInfo17.recipe_name, RecipeInfo17.ingredients, RecipeInfo17.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo18.image, RecipeInfo18.recipe_name, RecipeInfo18.ingredients, RecipeInfo18.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo19.image, RecipeInfo19.recipe_name, RecipeInfo19.ingredients, RecipeInfo19.steps))
    this.menuInfoList.push(new MenuInfo(RecipeInfo20.image, RecipeInfo20.recipe_name, RecipeInfo20.ingredients, RecipeInfo20.steps))
    return this.menuInfoList
  }


  public getMenuInfo(id: number): MenuInfo{
    return this.getMenuList()[id];
  }


}