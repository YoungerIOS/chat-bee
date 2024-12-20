import { UserInfo, UserInfoModel } from './User'
import { util } from '@kit.ArkTS'

export interface MessageInfo {
  id: string //标识
  sendUser: UserInfo //消息发送者
  connectUser: UserInfo //消息归属者
  messageContent: string //消息内容(任何需要以文本显示的内容)
  sendTime: number //发送时间
  messageType: MessageType //消息类型
  sourceFilePath: string //媒体文件地址
  duration: number //音视频时长
}

export enum MessageType {
  TEXT,//文本
  IMAGE,//图片
  AUDIO,//音频
  VIDEO,//视频
  LOCATION,//位置
  LINK //链接

}
export class MessageInfoModel implements MessageInfo {
  id: string = ''
  sendUser: UserInfo = new UserInfoModel({} as UserInfo)
  connectUser: UserInfo = new UserInfoModel({} as UserInfo)
  messageContent: string = ''
  sendTime: number = 0
  messageType: MessageType = MessageType.TEXT
  sourceFilePath: string = ''
  duration: number = 0

  constructor(model: MessageInfo) {
    this.id = model.id || util.generateRandomUUID()
    this.sendUser = model.sendUser
    this.connectUser = model.connectUser
    this.messageContent = model.messageContent
    this.sendTime = model.sendTime || Date.now()
    this.messageType = model.messageType || MessageType.TEXT
    this.sourceFilePath = model.sourceFilePath
    this.duration = model.duration
  }
}
