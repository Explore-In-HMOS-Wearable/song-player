// models/DataModel.ts
import { SongModel } from "./SongModel";


export class DataModel {
  public static readonly SONG_LIST: SongModel[] = [
    new SongModel(
      "Starlight Avenue",
      "Lyra Vey",
      "rawfile/world.mp3",
      $r('app.media.album_1'),
      $r('app.media.artist_1'),
      "Neon Horizons",
      "Pop",
      2007
    ),
    new SongModel(
      "Arion Vale",
      "The Ghosters",
      "rawfile/dream_it_possible_delacey.mp3",
      $r('app.media.album_2'),
      $r('app.media.artist_2'),
      "Glass Petals",
      "Metal",
      2020
    ),
    new SongModel(
      "Cinders and Silence",
      "The Ember Tide",
      "rawfile/power.mp3",
      $r('app.media.album_3'),
      $r('app.media.artist_3'),
      "Chronicles of Ash",
      "Jazz",
      1999
    ),
    new SongModel(
      "Nova Meridian",
      "Lunar Static",
      "rawfile/boisterous.mp3",
      $r('app.media.album_4'),
      $r('app.media.artist_4'),
      "Velvet Frequencies",
      "Fusion",
      2023
    ),
    new SongModel(
      "Die For You",
      "Silent Rivers",
      "rawfile/boisterous.mp3",
      $r('app.media.album_5'),
      $r('app.media.artist_5'),
      "Echo Vale",
      "Classical",
      1980
    )
  ];
}