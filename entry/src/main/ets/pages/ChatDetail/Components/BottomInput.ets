@Preview
@Component
struct BottomInput {
  @State
  showVoice: boolean = false

  build() {
    Row({space: 10}) {
      Image(this.showVoice ? $r('app.media.ic_public_sound') : $r('app.media.ic_public_keyboard'))
        .width(25)
        .height(25)
        .onClick(() => {
          this.showVoice = !this.showVoice
        })

      if (this.showVoice) {
        TextInput()
          .height(35)
          .borderRadius(2)
          .backgroundColor($r('app.color.white'))
          .layoutWeight(1)
      } else {
        Button('按住 说话')
          .height(35)
          .borderRadius(2)
          .backgroundColor($r('app.color.white'))
          .fontColor($r('app.color.text_primary'))
          .type(ButtonType.Normal)
          .layoutWeight(1)
      }

      Image($r('app.media.ic_public_add_norm'))
        .width(25)
        .height(25)

    }
    .width("100%")
    .height(60)
    .backgroundColor($r('app.color.second_back_color'))
    .padding({
      left:10,
      right:10
    })


  }
}

export default BottomInput