
import { SizeConstants } from '../constants/SizeConstants';

@Component
export struct PlayPauseButton {
  @StorageLink('isPlay') isPlay: boolean = false;
  @StorageLink('progress') value: number = 0;
  @StorageLink('progressMax') max: number = 0;

  build() {
    Stack() {
      RelativeContainer() {
        Image(this.isPlay ? $r('app.media.ic_pause') : $r('app.media.ic_play'))
          .aspectRatio(1)
          .objectFit(ImageFit.Contain)
          .width($r('app.float.control_width'))
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
      }
      .width(SizeConstants.FULL_WIDTH_PERCENT)
      .borderRadius(SizeConstants.FULL_WIDTH_PERCENT)
      .aspectRatio(1)
      .backgroundColor($r('app.color.deep_aqua'))

      Progress({
        value: this.value,
        total: this.max,
        type: ProgressType.Ring
      })
        .aspectRatio(1)
        .value(this.value)
        .width(SizeConstants.FULL_WIDTH_PERCENT)
        .color($r('app.color.deep_teal'))
        .style({ strokeWidth: 8 })
        .backgroundColor($r('app.color.card_background_color'))
    }
    .width(SizeConstants.WIDTH_PERCENT_40)
    .height(SizeConstants.HEIGHT_PERCENT_40)
    .alignContent(Alignment.Center)
    .onClick(() => {
      if(this.isPlay){
        this.isPlay=false
      }
      else{
        this.isPlay=true
      }
    })
  }
}