% Defining dynamic predicate to store a playlist with its name and list of songs
:- dynamic playlist/2.

% Creating an empty playlist with the name 'My Playlist' and an empty list of songs
playlist('My Playlist', []).

% add_song predicate to add a new song to a playlist
add_song(Name, Title, Artist, UpdatedPlaylist) :-
    % Retrieving the old playlist using the playlist/2 predicate
    playlist(Name, OldPlaylist),
    % Appending the new song to the old playlist to create a new playlist
    append(OldPlaylist, [[Title, Artist]], NewPlaylist),
    % Removing the old playlist from the database
    retract(playlist(Name, OldPlaylist)),
    % Asserting the new playlist with the same name and updated list of songs
    asserta(playlist(Name, NewPlaylist)),
    % Assigning the updated playlist to the UpdatedPlaylist variable
    UpdatedPlaylist = playlist(Name, NewPlaylist),
    % Using cut to prevent backtracking and ensuring that only one solution is found
    !.
% If the add_song predicate fails, it returns false
add_song(_, _, _, _) :-
    fail.

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
display_songs([[Title, Artist]|Rest]) :-
    % Displaying the title and artist of the song
    write('- '), write(Title), write(' by '), write(Artist), nl,
    % Recursively calling the display_songs predicate for the rest of the list
    display_songs(Rest).