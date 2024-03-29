export class FoodInfo {
  id: number = 0;
  name: string
  image: Resource
  category: string;
  freshDate: string
  addr: string
  quantity: string
  unit: string
  whe_frozen: boolean

  constructor(id:number,name: string, image: Resource,category: string,
  freshDate: string,addr: string,quantity: string, unit: string,whe_frozen: boolean) {
    this.id = id;
    this.name = name;
    this.image = image;
    this.category = category;
    this.freshDate = freshDate;
    this.addr = addr;
    this.quantity = quantity;
    this.unit = unit;
    this.whe_frozen = whe_frozen;
  }
}

export class MenuIngredientInfo{
  name: string
  quantity: string

  constructor(name: string = '', quantity: string = '') {
    this.name = name
    this.quantity = quantity
  }
}

export class MenuInfo{
  image: string
  name: string
  description:string
  cookTime:string
  ingredients: Array<MenuIngredientInfo>
  steps: Array<Array<string>>

  constructor(image: string, name: string,description:string,cookTime:string, ingredients: Array<MenuIngredientInfo>, steps: Array<Array<string>>) {
    this.image = image
    this.name = name
    this.description = description
    this.cookTime = cookTime
    this.ingredients = ingredients
    this.steps = steps
  }

}

export class CondimentInfo{
  name: string
  is_exist: boolean

  constructor(name: string, is_exist: boolean) {
    this.name = name
    this.is_exist = is_exist
  }
}