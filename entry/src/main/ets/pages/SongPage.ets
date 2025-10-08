import { SongModel } from "../models/SongModel";
import { AudioService, AudioStatus } from "../services/AudioService";
import { getParams } from "../utils/RouterUtils";
import { router } from "@kit.ArkUI";

@Entry
@Component
export struct SongPage {
  audioService: AudioService = AudioService.getInstance();
  @State song: SongModel = SongModel.empty();
  @State receivedSongData: string = '';

  aboutToAppear(): void {
    let paramObject = getParams() as SongModel
    this.song = paramObject
    console.log(this.song.songName)
  }

  onBackPress(): boolean {
    return true;
  }

  build() {
    Scroll() {
      Column() {
        Stack() {
          Image(this.song.songPic)
            .width('100%')
            .height('35%')
            .borderRadius(20)
            .objectFit(ImageFit.Cover)
            .backgroundColor(Color.Black)
            .margin({ 'bottom': 10 })
          Column() {
            Row() {
              Row() {
                Image($r('app.media.ic_back'))
                  .width(24)
                  .height(24)
                  .fillColor(Color.White)
              }
              .width(40)
              .height(40)
              .borderRadius(20)
              .backgroundColor('rgba(0, 0, 0, 0.5)')
              .justifyContent(FlexAlign.Center)
              .alignItems(VerticalAlign.Center)
              .alignSelf(ItemAlign.Start)
              .align(Alignment.TopStart)
              .margin({ top: 15, left: 15 })
              .onClick(() => {
                router.back()
              })
            }
            .width('100%')
            .alignSelf(ItemAlign.Start)
            .align(Alignment.TopStart)

            Column()
              .height(80)
          }

        }
        .alignSelf(ItemAlign.Start)

        .expandSafeArea()

        Row() {
          Column() {
            Text(this.song.songName).fontWeight(FontWeight.Bold).fontSize('14sp').margin({ 'bottom': 5 })
            Text(this.song.songAuthor).fontSize('12sp');
          }.alignItems(HorizontalAlign.Start);


          Image(this.audioService.audioStatus == AudioStatus.Playing ? $r('app.media.ic_pause') :
          $r('app.media.ic_play'))
            .width(30)
            .height(30)
            .fillColor(Color.White)
            .onClick(async () => {
              if (this.audioService.audioStatus === AudioStatus.Paused) {
                this.resumeAudio();
              } else if (this.audioService.audioStatus !== AudioStatus.Playing) {
                await this.startAudio(this.song);
              } else {
                this.pauseAudio();
              }
            });

        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('90%')
        .margin({ 'bottom': 20 })

        Row() {
          Image(this.song.artistPic)
            .width(40)
            .height(40)
            .borderRadius(48)
            .objectFit(ImageFit.Cover)
            .margin({ right: 10, left: 10 });
          Text(this.song.songAuthor).fontSize('12sp').fontWeight(FontWeight.Bold);
          Image(this.song.songPic)
            .width(20)
            .height(20)
            .margin({ left: 10 })
            .fillColor(Color.White)
        }
        .height(50)
        .width('90%')
        .backgroundColor($r('app.color.soft_green'))
        .borderRadius(8)
        .justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)
        .margin({ bottom: 10 })

        Row() {
          Text('About This Song').fontSize('12sp').fontWeight(FontWeight.Bold);
        }
        .width('90%')
        .justifyContent(FlexAlign.Start)


        Row() {
          Text('Genre').fontSize('10sp');
          Text(this.song.genre).fontSize('10sp').fontWeight(FontWeight.Bold);
        }.width('90%').justifyContent(FlexAlign.SpaceBetween).margin({ top: 10, bottom: 4 })

        Row() {
        }.width('90%').backgroundColor(Color.Grey).height(1);

        Row() {
          Text('Album').fontSize('10sp');
          Text(this.song.album).fontSize('10sp').fontWeight(FontWeight.Bold);
        }.width('90%').justifyContent(FlexAlign.SpaceBetween).margin({ top: 10, bottom: 4 })

        Row() {
        }.width('90%').backgroundColor(Color.Grey).height(1);

        Row() {
          Text('Released').fontSize('10sp');
          Text(this.song.releaseYear.toString()).fontSize('10sp').fontWeight(FontWeight.Bold);
        }.width('90%').justifyContent(FlexAlign.SpaceBetween).margin({ top: 10, bottom: 4 })

        Row() {
        }.width('90%').backgroundColor(Color.Grey).height(1);

      }
      .width('100%')
      .height('250%')
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)

      .linearGradient({
        direction: GradientDirection.Bottom,
        colors: [[$r('app.color.base_background_gradient_start'), 0.0],
          [$r('app.color.base_background_gradient_end'), 1],]
      })
    }.direction(Direction.Ltr)
  }

  resumeAudio() {
    this.audioService.resume();
  }

  async startAudio(songModel: SongModel) {
    await this.audioService.playEmbeddedMp3(songModel.songPath);
  }

  pauseAudio() {
    this.audioService.pause();
  }
}