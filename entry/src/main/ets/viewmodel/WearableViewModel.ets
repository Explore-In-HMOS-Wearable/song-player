import { DataModel } from "../models/DataModel";
import { SongModel } from "../models/SongModel";

export default class WearableViewModel {
  private songList: SongModel[] = [];

  constructor() {
    this.songList = DataModel.SONG_LIST;
  }

  public getSongList(): SongModel[] {
    return this.songList;
  }

  public getSongById(id: number): SongModel | undefined {
    return this.songList[id];
  }
}