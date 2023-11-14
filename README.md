# Prolog Music Playlist App

## Overview

The Prolog program simulates a music playlist app, allowing users to create and manage custom playlists. Each playlist can contain multiple songs, and the program supports operations such as creating playlists, adding songs to existing playlists, and displaying the contents of a playlist.

## Prerequisites

To run this Prolog program, you need a Prolog interpreter installed on your machine. You can use popular Prolog interpreters such as SWI-Prolog.

## Usage

1. **Creating a Playlist:**

   To create a new playlist, use the `playlist/2` predicate. For example:

   ```prolog
   ?- playlist('My Playlist', []).
   ```

   This creates a playlist named 'My Playlist' with an empty list of songs.

2. **Adding a Song to a Playlist:**

   To add a song to an existing playlist, use the `add_song/4` predicate. For example:

   ```prolog
   ?- add_song('My Playlist', 'Song Title', 'Artist Name', UpdatedPlaylist).
   ```

   This adds a new song with the specified title and artist to the 'My Playlist' and returns the updated playlist in `UpdatedPlaylist`.

3. **Displaying a Playlist:**

   To display the contents of a playlist, use the `display_playlist/1` predicate. For example:

   ```prolog
   ?- display_playlist('My Playlist').
   ```

   This will show the name of the playlist and a list of songs.

## Note

- The program uses dynamic predicates to store playlist information.
- The `cut` predicate is employed to prevent backtracking and ensure only one solution is found for each predicate call.
- The `fail` predicate is used to explicitly fail a predicate and force backtracking in case of failure.
- Lists are used to store songs in each playlist, and the `append` predicate is used to concatenate lists when adding a new song.

## Author
[Vikranth Udandarao](https://github.com/Vikranth3140)