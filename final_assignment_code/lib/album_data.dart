import 'album_page.dart'; // Import your detail page if needed

class Album {
  final String imagePath;
  final String albumTitle;
  final String artist;
  final String releaseDate;
  final double rating;
  final List<String> genres;

  const Album({
    required this.imagePath,
    required this.albumTitle,
    required this.artist,
    required this.releaseDate,
    required this.rating,
    required this.genres,
  });
}

const List<Album> albums = [
  Album(
    imagePath: 'assets/album1.jpg',
    albumTitle: 'Midnight Memories',
    artist: 'One Direction',
    releaseDate: 'November 25, 2013',
    rating: 4.5,
    genres: ['Pop', 'Rock'],
  ),
  Album(
    imagePath: 'assets/album2.jpg',
    albumTitle: '25',
    artist: 'Adele',
    releaseDate: 'November 20, 2015',
    rating: 5.0,
    genres: ['Soul', 'Pop'],
  ),
  Album(
    imagePath: 'assets/album3.jpg',
    albumTitle: 'DAMN.',
    artist: 'Kendrick Lamar',
    releaseDate: 'April 14, 2017',
    rating: 4.8,
    genres: ['Hip-Hop', 'Rap'],
  ),
  // Add more albums here!
];
