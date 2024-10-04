import { UserInfo, UserInfoModel } from '../../models/user'
import { ContactsStore } from '../../utils/contactsStore'
import { router } from '@kit.ArkUI'

@Preview
@Component
struct Contacts {
  @State list: UserInfoModel[] = []

  aboutToAppear(): void {
    this.getContactList()
  }
  getContactList() {
    this.list = ContactsStore.getContacts()
  }
  build() {
    Column() {
      Row() {
        Search({placeholder: '搜索'})
          .width('100%')
          .height(30)
          .borderRadius(4)
          .backgroundColor($r('app.color.white'))
      }
      .padding({left: 10, right: 10 })

      List() {
        ForEach(this.list, (item: UserInfoModel) => {
          ListItem() {
            Row() {
              Image(item.avatar)
                .width(40)
                .borderRadius(4)
                .aspectRatio(1)
              Text(item.username)
                .height('100%')
                .layoutWeight(1)
                .margin({left: 10})
                .fontSize(16)
                .fontColor($r('app.color.text_primary'))

                // .border({width:{bottom: 0.5}, color: Color.Gray})
            }
            .padding({left: 10})
          }
          .height(55)
          .stateStyles({
            pressed: {
              .backgroundColor($r('app.color.back_color'))
            },
            normal: {
              .backgroundColor($r('app.color.white'))
            }
          })
          .onClick(() => {
            router.pushUrl({
              url: 'pages/ChatDetail/ChatDetail',
              params: item
            })
          })
        })
      }
      .divider({
        strokeWidth: 1,
        color: $r('app.color.border_color'),
        startMargin: 60
      })
      .layoutWeight(1)
      .backgroundColor($r('app.color.white'))
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.back_color'))
  }
}

export  default Contacts