import { router } from '@kit.ArkUI'
import { UserInfo, UserInfoModel } from '../../models/user'
import { CurrentUserKey } from '../../constant/index'
import BottomInput from './Components/BottomInput'

@Entry
@Component
struct ChatDetail {
  @StorageProp(CurrentUserKey)
  currentUser: UserInfoModel = new UserInfoModel({} as UserInfo)

  @Provide
  chatUser: UserInfoModel = new UserInfoModel({} as UserInfo)

  aboutToAppear(): void {
    this.getChatUser()
  }

  getChatUser() {
    this.chatUser = router.getParams() as UserInfoModel
  }

  build() {
    Column() {
      Stack({alignContent: Alignment.TopStart}) {
        Text(this.chatUser.username)
          .fontSize(18)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
          .textAlign(TextAlign.Center)
        Image($r('app.media.ic_public_arrow_left'))
          .width(30)
          .height(30)
          .onClick(() => {
            router.back()
          })
      }
      .padding({left: 10, right: 10})
      .width('100%')
      .height(50)
      BottomInput()
    }
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)

  }
}