export class SongModel {
  public songName: string;
  public songAuthor: string;
  public songPath: string;
  public songPic: Resource;
  public artistPic: Resource;
  public album: string;
  public genre: string;
  public releaseYear: number;

  /*  toObject() {
      return {
        songName: this.songName,
        songAuthor: this.songAuthor,
        songPath: this.songPath,
        songPic: this.songPic.toString(),
        album:this.album,
        genre:this.genre,
        releaseYear:this.releaseYear.toString()
      };
    }

    static fromObject(obj: any): SongModel {
      return new SongModel(
        obj.songName,
        obj.songAuthor,
        obj.songPath,
        $rawfile(obj.songPic) || $r('app.media.background'),
        obj.album,
        obj.genre,
        Number(obj.releaseYear)
      );
    }*/

  constructor(songName: string, songAuthor: string, songPath: string, songPic: Resource, artistPic:Resource, album: string, genre: string,
    releaseYear: number) {
    this.songName = songName;
    this.songAuthor = songAuthor;
    this.songPath = songPath;
    this.songPic = songPic;
    this.artistPic=artistPic;
    this.album = album;
    this.genre = genre;
    this.releaseYear = releaseYear;

  }

  static empty() {
    return new SongModel('', '', '', $r('app.media.background'),$r('app.media.background'), '', '', 2000);
  }
}
