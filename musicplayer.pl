% Defining dynamic predicate to store a playlist with its name and list of songs
:- dynamic playlist/2.

% Creating an empty playlist with the name 'My Playlist' and an empty list of songs
playlist('My Playlist', []).

% add_song predicate to add a new song to a playlist
add_song(Name, Title, Artist, Album, Year, UpdatedPlaylist) :-
    % Retrieving the old playlist using the playlist/2 predicate
    playlist(Name, OldPlaylist),
    % Appending the new song to the old playlist to create a new playlist
    append(OldPlaylist, [[Title, Artist, Album, Year]], NewPlaylist),
    % Removing the old playlist from the database
    retract(playlist(Name, OldPlaylist)),
    % Asserting the new playlist with the same name and updated list of songs
    asserta(playlist(Name, NewPlaylist)),
    % Assigning the updated playlist to the UpdatedPlaylist variable
    UpdatedPlaylist = playlist(Name, NewPlaylist),
    % Using cut to prevent backtracking and ensuring that only one solution is found
    !.
% If the add_song predicate fails, it returns false
add_song(_, _, _, _, _, _) :-
    write('Failed to add song. Please check your input.'), nl,
    fail.

% create_playlist predicate to create a new playlist
create_playlist(Name) :-
    % Check if the playlist already exists
    \+ playlist(Name, _),
    % If not, assert a new empty playlist with the given name
    asserta(playlist(Name, [])),
    write('Playlist created successfully.'), nl,
    !.
% If the playlist already exists, display an error message
create_playlist(Name) :-
    write('Playlist with the name '), write(Name), write(' already exists.'), nl,
    fail.

% delete_playlist predicate to delete a playlist
delete_playlist(Name) :-
    % Check if the playlist exists
    playlist(Name, _),
    % If it exists, retract the playlist from the database
    retract(playlist(Name, _)),
    write('Playlist deleted successfully.'), nl,
    !.
% If the playlist doesn't exist, display an error message
delete_playlist(Name) :-
    write('Playlist with the name '), write(Name), write(' does not exist.'), nl,
    fail.

% rename_playlist predicate to rename a playlist
rename_playlist(OldName, NewName) :-
    % Check if the old playlist exists
    playlist(OldName, OldPlaylist),
    % Delete the old playlist
    delete_playlist(OldName),
    % Create a new playlist with the new name and the songs from the old playlist
    create_playlist(NewName),
    add_songs_to_playlist(NewName, OldPlaylist),
    write('Playlist renamed successfully.'), nl,
    !.
% If the old playlist doesn't exist, display an error message
rename_playlist(OldName, _) :-
    write('Playlist with the name '), write(OldName), write(' does not exist.'), nl,
    fail.

% add_songs_to_playlist predicate to add a list of songs to a playlist
add_songs_to_playlist(_, []).
add_songs_to_playlist(Name, [[Title, Artist, Album, Year]|Rest]) :-
    add_song(Name, Title, Artist, Album, Year, _),
    add_songs_to_playlist(Name, Rest).

% display_playlist predicate to display the list of songs in a playlist
display_playlist(Name) :-
    % Retrieving the playlist using the playlist/2 predicate
    playlist(Name, Songs),
    % Displaying the name of the playlist
    write('Playlist: '), write(Name), nl,
    % Displaying the list of songs
    write('Songs: '), nl,
    % Calling the display_songs predicate to display each song in the list
    display_songs(Songs).

% display_songs predicate to display each song in a list of songs
display_songs([]).
display_songs([[Title, Artist, Album, Year]|Rest]) :-
    % Displaying the title, artist, album, and year of the song
    write('- '), write(Title), write(' by '), write(Artist),
    write(' [Album: '), write(Album), write(', Year: '), write(Year), write(']'), nl,
    % Recursively calling the display_songs predicate for the rest of the list
    display_songs(Rest).