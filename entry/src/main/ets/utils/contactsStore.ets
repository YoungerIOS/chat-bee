//使用首选项存储通讯录联系人
import { preferences } from '@kit.ArkData'
import { ContactRepoName, ContactsKey, CurrentUserKey } from '../constant'
import { UserInfo, UserInfoModel, currentUser, defaultUserList} from '../models/user'
import { Context } from '@ohos.arkui.UIContext'


export class ContactsStore {
  static  getRepo(context?: Context) {
    return preferences.getPreferencesSync(context || getContext(), {
      name: ContactRepoName
    })
  }

  static getContacts(context?: Context) {
    const repo = ContactsStore.getRepo(context)
    const defValue = JSON.stringify(defaultUserList)
    const valueStr = repo.getSync(ContactsKey, defValue) as string
    return JSON.parse(valueStr) as UserInfoModel[]
  }

  static getCurrentUser(context?: Context) {
    const repo = ContactsStore.getRepo(context)
    const defValue = JSON.stringify(currentUser)
    const valueStr = repo.getSync(CurrentUserKey, defValue) as string
    return JSON.parse(valueStr) as UserInfoModel
  }
}

