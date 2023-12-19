import { CondimentInfo } from '../model/DataModels'
import Configuration from '@system.configuration'
export class MockCondiment{
  CondimentInfoList: Map<number,CondimentInfo> = new Map<number,CondimentInfo>()
  idCounter: number = 11

  constructor(){
    this.CondimentInfoList.set(0, new CondimentInfo("盐", true))
    this.CondimentInfoList.set(1, new CondimentInfo("油", true))
    this.CondimentInfoList.set(2, new CondimentInfo("糖", true))
    this.CondimentInfoList.set(3, new CondimentInfo("味精", false))
    this.CondimentInfoList.set(4, new CondimentInfo("水", true))
    this.CondimentInfoList.set(5, new CondimentInfo("白糖", true))
    this.CondimentInfoList.set(6, new CondimentInfo("料酒", true))
    this.CondimentInfoList.set(7, new CondimentInfo("葱", true))
    this.CondimentInfoList.set(8, new CondimentInfo("姜", false))
    this.CondimentInfoList.set(9, new CondimentInfo("生抽", true))
    this.CondimentInfoList.set(10, new CondimentInfo("醋", true))
  }

  public getCondimentList(){
    return this.CondimentInfoList.values();
  }

  public setCondimentAvailable(id: number, is_exist: boolean){
    let newCon: CondimentInfo = new CondimentInfo(this.CondimentInfoList.get(id).name, is_exist)
    this.CondimentInfoList.set(id, newCon)
  }

  public addCondiment(con: CondimentInfo) {
    this.CondimentInfoList.set(this.idCounter, con);
    this.idCounter = this.idCounter+1;
  }
}