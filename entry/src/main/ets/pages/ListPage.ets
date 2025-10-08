import {
  UIContext,
  ArcList,
  ArcListItem,
  ArcListAttribute,
  ArcListItemAttribute,
  ComponentContent,
} from '@kit.ArkUI';
import { SongCardComponent } from '../components/SongCardComponent';
import { AppFontSize } from '../constants/AppFontSize';
import WearableViewModel from '../viewmodel/WearableViewModel';
import { SongModel } from '../models/SongModel';
import { routePageWithObjectParams } from '../utils/RouterUtils';

@Builder
function buildText() {
  Column() {
    Text('Recommended')
      .fontSize(AppFontSize.LARGE)
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.White)
    Text('Songs')
      .fontSize(AppFontSize.LARGE)
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.White)
  }.margin(0)
}

@Entry
@Component
struct ListPage {
  private viewModel: WearableViewModel = new WearableViewModel();
  @State songs: SongModel[] = [];
  @StorageLink('selectIndex') selectIndex: number = 0;
  @StorageLink('songList') songList: SongModel[] = [];
  context: UIContext = this.getUIContext();
  tabBar1: ComponentContent<Object> = new ComponentContent(this.context, wrapBuilder(buildText));

  aboutToAppear(): void {
    this.songs = this.viewModel.getSongList();
    AppStorage.setOrCreate('songList', this.songs);
  }
  onBackPress(): boolean {
    return true;
  }
  build() {
    Column() {
      ArcList({ initialIndex: 0, header: this.tabBar1 }) {
        ForEach(this.songs, (song: SongModel, index: number) => {
          ArcListItem() {
            SongCardComponent({
              image: {
                src: song.songPic,
                height: 60,
                borderRadius: 12
              },
              title: {
                text: song.songName,
                fontSize: 16,
                textColor: Color.White
              },
              desc: {
                text: song.songAuthor,
                fontSize: 14,
                textColor: Color.White
              }
            })
          }
          .onClick(() => {
            this.selectIndex = index;
            routePageWithObjectParams(
              'pages/SongPage',
              song
            )
          })
          .backgroundColor($r('app.color.card_background_color'))
          .width('80%')
          .borderRadius(16)
          .padding(4)
          .align(Alignment.Center)
        }, (song: SongModel) => song.songName)
      }
      .width('100%')
      .height('100%')
    }
    .backgroundColor($r('app.color.app_background'))
    .width('100%')
    .height('100%')
  }
}