class Song {
  final String title;
  final String artist;
  final String image;
  final String duration;
  final bool ep;
  bool liked;
  bool disliked;
  bool playing;
  final int year;
  final int index;

  Song({
    required this.title,
    required this.artist,
    required this.image,
    required this.duration,
    required this.year,
    this.ep = false,
    this.liked = false,
    this.disliked = false,
    this.playing = false,
    this.index = 0,
  });

  static List<Song> songs = [
    Song(
      artist: 'PERSONPERSON',
      duration: '3:07',
      image: 'bonnie-clyde',
      title: 'Bonnie & Clyde',
      year: 2019,
      index: 1,
    ),
    Song(
      artist: 'Trevor Daniel',
      duration: '2:56',
      image: 'lovesick',
      title: 'Lovesick',
      year: 2020,
      ep: true,
      index: 2,
    ),
    Song(
      artist: 'Munn & Jude.',
      duration: '2:40',
      image: 'munn',
      title: 'Me & My Friends (feat. Fortune)',
      year: 2020,
      index: 3,
    ),
    Song(
      artist: 'COTIS',
      duration: '3:04',
      image: 'cotis',
      title: 'Reckless',
      year: 2020,
      ep: true,
      index: 4,
    ),
    Song(
      artist: 'Chris Krahn',
      duration: '3:02',
      image: 'chris',
      title: 'Hope He Gives You Life',
      year: 2020,
      index: 5,
    ),
    Song(
      artist: 'LXVI',
      duration: '3:05',
      image: 'lxvi',
      title: 'Hurt You',
      year: 2019,
      ep: true,
      index: 6,
    ),
    Song(
      artist: 'Mezsiah',
      duration: '3:33',
      image: 'goons',
      title: 'Goons',
      year: 2020,
      index: 7,
    ),
    Song(
      artist: 'Vaboh',
      duration: '3:09',
      image: 'vaboh',
      title: "I'm Sick of Trying",
      year: 2018,
      index: 8,
    ),
    Song(
      artist: 'nicoteen ninyo',
      duration: '2:43',
      image: 'ninyo',
      title: 'cut the deepest',
      year: 2020,
      ep: true,
      index: 9,
    ),
    Song(
      artist: 'XAM',
      duration: '2:34',
      image: 'xam',
      title: 'FIGHTING (feat. d1v)',
      year: 2018,
      index: 10,
    ),
  ];
}
