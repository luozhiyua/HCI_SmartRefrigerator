export class FoodInfo {
  id: number = 0;
  name: string
  image: Resource;
  category: string;
  freshDate: string
  side: string
  addr: string
  quantity: string
  unit: string
  whe_frozen: boolean

  constructor(name: string, image: Resource,category: string,
  freshDate: string,side: string,addr: string,quantity: string,unit: string,whe_frozen: boolean) {
    this.name = name;
    this.image = image;
    this.category = category;
    this.freshDate = freshDate;
    this.side = side;
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
  image: Resource
  name: string
  ingredients: Array<MenuIngredientInfo>
  steps: Array<string>

  constructor(image: Resource, name: string, ingredients: Array<MenuIngredientInfo>, steps: Array<string>) {
    this.image = image
    this.name = name
    this.ingredients = ingredients
    this.steps = steps
  }

}