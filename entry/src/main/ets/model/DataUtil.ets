import router from '@ohos.router'
import {foodImageMap, foodUnitMap } from '../mock/MockData'

import { FoodInfo } from './DataModels'
// import { mockFoods, mockFoodInfo } from '../mock/MockData'

const DEBUG_PREVIEW = false

export function getFoodCategories(): string[] {
  return ['蔬菜','水果','肉类','海鲜','零食','其他']
}

export function getDetailLists(category): string[] {
  if(category == '蔬菜') return ['青菜','白菜','豆腐','萝卜','胡萝卜','番茄','黄瓜','土豆','豆角']
  else if(category == '水果')return ['苹果','香蕉','橙子','梨','西瓜','葡萄','草莓','桃子','樱桃']
  else if(category == '肉类')return ['鸡蛋','猪肉','牛肉','鸡肉','羊肉','鸭肉','火腿','香肠','肉丸']
  else if(category == '海鲜')return ['鱼','虾','蟹','贝类','海参','海蜇','鲍鱼','墨鱼']
  else if(category == '零食')return ['薯片','巧克力','饼干','糖果','坚果','瓜子','蜜饯','果冻','膨化食品']
  else if(category == '其他')return ['米面粮油','调味品','罐头','速冻食品','饮料','酒水']
  else return ['青菜','白菜','豆腐','萝卜','胡萝卜','番茄','黄瓜','土豆','豆角','苹果','香蕉','橙子','梨','西瓜','葡萄','草莓','桃子','樱桃']
}

export function getSideLists(): string[] {
  return ['左边','右边']
}

export function getAddrLists(): string[] {
  return ['左边一层','左边二层','左边三层','右边一层','右边二层','右边三层']
}
export function getunitLists(): string[] {
  return ['个','千克','升']
}

export function getAutoLists(): string[]{
  return ['蔬菜','生菜','千克','左边','一层']
}

export function getAutoUnit(name: string){
  return foodUnitMap.get(name)
}

export function getAutoIamge(name: string){
  return foodImageMap.get(name)
}