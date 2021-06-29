class Song {
  final String title;
  final String artist;
  final String image;
  final String duration;
  final bool ep;
  final bool liked;
  final bool disliked;
  final int year;

  Song({
    required this.title,
    required this.artist,
    required this.image,
    required this.duration,
    required this.year,
    this.ep = false,
    this.liked = false,
    this.disliked = false,
  });

  static List<Song> songs = [
    Song(
      artist: 'PERSONPERSON',
      duration: '3:07',
      image: 'bonnie-clyde',
      title: 'Bonnie & Clyde',
      year: 2019,
    ),
    Song(
      artist: 'Trevor Daniel',
      duration: '2:56',
      image: 'lovesick',
      title: 'Lovesick',
      year: 2020,
      ep: true,
    ),
    Song(
      artist: 'Munn & Jude.',
      duration: '2:40',
      image: 'munn',
      title: 'Me & My Friends(feat. Fortune)',
      year: 2020,
    ),
    Song(
      artist: 'COTIS',
      duration: '3:04',
      image: 'cotis',
      title: 'Reckless',
      year: 2020,
      ep: true,
    ),
    Song(
      artist: 'Chris Krahn',
      duration: '3:02',
      image: 'chris',
      title: 'Hope He Gives You Life',
      year: 2020,
    ),
    Song(
      artist: 'LXVI',
      duration: '3:05',
      image: 'lxvi',
      title: 'Hurt You',
      year: 2019,
      ep: true,
    ),
    Song(
      artist: 'Mezsiah',
      duration: '3:33',
      image: 'goons',
      title: 'Goons',
      year: 2020,
    ),
    Song(
      artist: 'Vaboh',
      duration: '3:09',
      image: 'vaboh',
      title: "I'm Sick of Trying",
      year: 2018,
    ),
    Song(
      artist: 'nicoteen ninyo',
      duration: '2:43',
      image: 'ninyo',
      title: 'cut the deepest',
      year: 2020,
      ep: true,
    ),
    Song(
      artist: 'XAM',
      duration: '2:34',
      image: 'xam',
      title: 'FIGHTING(feat. d1v)',
      year: 2018,
    ),
  ];
}
