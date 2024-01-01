# Prolog Music Playlist App

## Overview

The Prolog program simulates a music playlist app, allowing users to create and manage custom playlists. Each playlist can contain multiple songs, and the program supports operations such as creating playlists, adding songs to existing playlists, and displaying the contents of a playlist.

## Features

- Create and manage playlists.
- Add songs to playlists with details like title, artist, album, and year.
- Display the list of songs in a playlist.
- Rename playlists.
- Delete playlists.

## Prerequisites

To run this Prolog program, you need a Prolog interpreter installed on your machine. You can use popular Prolog interpreters such as SWI-Prolog.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Vikranth3140/Music-Playlist.git
   ```

2. Change directory to the music player:
   ```bash
   cd Music-Playlist
   ```

3. Load the Prolog code in your Prolog interpreter:
   ```bash
   ?- [playlist].
   ```

## Usage

1. **Creating a Playlist:**

   To create a new playlist, use the `playlist/2` predicate. For example:

   ```prolog
   ?- playlist('My Playlist', []).
   ```

   This creates a playlist named 'My Playlist' with an empty list of songs.

2. **Adding a Song to a Playlist:**

   To add a song to an existing playlist, use the `add_song/4` predicate.

   ```prolog
   ?- add_song('My Playlist', 'Song Title', 'Artist Name', UpdatedPlaylist).
   ```

   This adds a new song with the specified title and artist to the 'My Playlist' and returns the updated playlist in `UpdatedPlaylist`.

3. **Displaying a Playlist:**

   To display the contents of a playlist, use the `display_playlist/1` predicate.

   ```prolog
   ?- display_playlist('My Playlist').
   ```

   This will show the name of the playlist and a list of songs.

4. **Renaming a Playlist:**

   To rename the playlist, use the `rename_playlist/1` predicate.

   ```prolog
   ?- rename_playlist('Old Playlist', 'New Playlist').
   ```

   This will rename the name of the playlist.

5. **Deleting a Playlist:**

   To delete the playlist, use the `delete_playlist/1` predicate.

   ```prolog
   ?- delete_playlist('My Playlist').
   ```

   This will delete the playlist.

## Note

- The program uses dynamic predicates to store playlist information.
- The `cut` predicate is employed to prevent backtracking and ensure only one solution is found for each predicate call.
- The `fail` predicate is used to explicitly fail a predicate and force backtracking in case of failure.
- Lists are used to store songs in each playlist, and the `append` predicate is used to concatenate lists when adding a new song.

## How to Contribute

Welcome to contribute to Prolog Music PLaylist App! Feel free to fork the repository and suggest any improvements. To contribute, follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them.
4. Push the changes to your fork.
5. Submit a pull request.

Thank you for your contributions!

## License

This project is licensed under the [MIT License](LICENSE.md).

## Author

[Vikranth Udandarao](https://github.com/Vikranth3140)