/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { FoodInfo } from '../model/DataModels'

export let mockFoodInfo: FoodInfo = new FoodInfo('番茄', $r('app.media.tomato'), "蔬菜", "2023-11-27", "左边", "一层", "临期", "2个", false)

export let walnut: FoodInfo = new FoodInfo('坚果', $r('app.media.walnut'), "零食", "2023-12-20", "左边", "二层", "新鲜", "0.5千克", false)

export let cucumber: FoodInfo = new FoodInfo('黄瓜', $r('app.media.cucumber'), "蔬菜", "2023-12-27", "左边", "三层", "新鲜", "3个", false)

export let blueberry: FoodInfo = new FoodInfo('蓝莓', $r('app.media.blueberry'), "水果", "2023-12-27", "左边", "三层", "新鲜", "3个", false)

export let crab: FoodInfo = new FoodInfo('螃蟹', $r('app.media.crab'), "海鲜", "2023-12-27", "左边", "三层", "新鲜", "3个", true)

export let iceCream: FoodInfo = new FoodInfo('雪糕', $r('app.media.icecream'), "零食", "2023-11-20", "右边", "二层", "过期", "1个", true)

export let mockFoods: Array<FoodInfo> = [
  mockFoodInfo, walnut, cucumber, blueberry, crab, iceCream
]