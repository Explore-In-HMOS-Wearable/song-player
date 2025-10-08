import lottie, { AnimationItem } from '@ohos/lottie';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct SearchPage {
  private politeChickyController: CanvasRenderingContext2D = new CanvasRenderingContext2D();
  private politeChicky: string = 'politeChicky';
  private politeChickyPath: string = 'rawfile/scanning.json';
  private animateItem?: AnimationItem;
  @State private statusText: string = "Listening for music";

  onBackPress(): boolean {
    return true;
  }

  build() {
    Column() {
      Canvas(this.politeChickyController)
        .width(125)
        .height(125)
        .borderRadius(3)
        .onReady(() => {
          this.animateItem = lottie.loadAnimation({
            container: this.politeChickyController,
            renderer: 'canvas',
            loop: true,
            autoplay: true,
            name: this.politeChicky,
            path: this.politeChickyPath,
          });

          setTimeout(() => {
            this.statusText = "Searching, please wait";
          }, 4000);

          setTimeout(() => {
            router.pushUrl({ url: 'pages/ListPage' });
          }, 7000);
        })

      Text(this.statusText)
        .fontColor(Color.White)
        .fontSize(12)
        .fontWeight(FontWeight.Bolder)

      Text("Make sure your device can hear the song clearly")
        .fontSize(8)
        .fontColor(Color.Gray)
    }
    .backgroundColor($r('app.color.app_background_scan'))
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