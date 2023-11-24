export function getFoodCategories(): string[] {
  return ['蔬菜','水果','肉类','海鲜','零食','其他']
}

export function getDetailLists(category): string[] {
  // TODO: 应该根据category有不同的结果，数据库    category可能为‘’，应该返回某默认列
  return ['蔬菜','水果','肉类','海鲜','零食','其他']
}

export function getSideLists(): string[] {
  return ['左边','右边']
}

export function getAddrLists(): string[] {
  return ['一层','二层','三层']
}
export function getunitLists(): string[] {
  return ['个','千克','升']
}

export function getAutoLists(): string[]{
  return ['蔬菜','生菜','千克','左边','一层']
}