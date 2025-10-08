import lottie, { AnimationItem } from '@ohos/lottie';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct SearchPage {
  private politeChickyController: CanvasRenderingContext2D = new CanvasRenderingContext2D();
  private politeChicky: string = 'politeChicky';
  private politeChickyPath: string = 'rawfile/tap_scan.json';
  private animateItem?: AnimationItem;
  private onClicked?: boolean = false;

  build() {
    Column() {
      Stack() {
        Canvas(this.politeChickyController)
          .width(125)
          .height(125)
          .borderRadius(3)
          .alignSelf(ItemAlign.Center)
          .onReady(() => {
            this.animateItem = lottie.loadAnimation({
              container: this.politeChickyController,
              renderer: 'canvas',
              loop: true,
              autoplay: true,
              name: this.politeChicky,
              path: this.politeChickyPath,
            })
          })

        Text("Tap")
          .fontColor(Color.White)
      }
      .width('100%')
      .height('100%')
      .alignSelf(ItemAlign.Center)
      .onClick(() => {
        router.pushUrl({ url: "pages/ScanPage" })
      })
    }
    .backgroundColor($r('app.color.app_background_search'))
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignSelf(ItemAlign.Center)
    .alignItems(HorizontalAlign.Center)

  }

  onPageHide(): void {
    lottie.destroy();
  }
}