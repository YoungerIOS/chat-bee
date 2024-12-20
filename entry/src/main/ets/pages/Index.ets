import { TabBarClass } from '../models/Tab'
import Contacts from './contact/Contact'

@Entry
@Component
struct Index {
  @State tabList: TabBarClass[] = [{
    icon: $r('app.media.ic_public_message'),
    name: 'chatBee',
    title: '蜜聊',
    selectIcon: $r('app.media.ic_public_message_filled')
  },{
    icon: $r('app.media.ic_public_contacts_group'),
    name: 'contacts',
    title: '通讯录',
    selectIcon: $r('app.media.ic_public_contacts_group_filled')
  },{
    icon: $r('app.media.ic_gallery_discover'),
    name: 'discover',
    title: '发现',
    selectIcon: $r('app.media.ic_gallery_discover_filled')
  },{
    icon: $r('app.media.ic_public_contacts'),
    name: 'my',
    title: '我',
    selectIcon: $r('app.media.ic_public_contacts_filled')
  }]

  @State currentIndex: number = 0
  @Builder
  customTabBar(item: TabBarClass, index: number) {
    Column() {
      Image(this.currentIndex === index ? item.selectIcon : item.icon)
        .width(20)
        .aspectRatio(1)
      Text(item.title)
        .fontSize(12)
        .fontColor(this.currentIndex === index ? $r('app.color.primary') : $r('app.color.text_primary'))
        .margin({top: 4})
    }
  }

  build() {
    Tabs({index: $$this.currentIndex}) {
      ForEach(this.tabList, (item: TabBarClass, index: number) => {
        TabContent(){
          if (item.name === 'contacts') {
            Contacts()
          }else {
            Text(item.title)
          }
        }
        .tabBar(this.customTabBar(item, index))
      })
    }
    .animationDuration(20)
    .barPosition(BarPosition.End)

  }
}