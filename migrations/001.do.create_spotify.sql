CREATE TABLE spotify_users (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    spotify_user TEXT NOT NULL
);

/* 
tracks:
    added_at - when the track was added to the playlist
    release_date - month-day-year that song was released
*/
CREATE TABLE tracks (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    playlist_id TEXT NOT NULL,
    spotify_user TEXT NOT NULL,
    track_name TEXT NOT NULL,
    track_id TEXT NOT NULL,
    track_href TEXT NOT NULL,
    track_uri TEXT NOT NULL,
    external_url TEXT NOT NULL,
    artist TEXT NOT NULL,
    album TEXT NOT NULL,
    release_date DATE
);

/* 
playlists:
    added_at - when the playlist was created
*/
CREATE TABLE playlists (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    spotify_user TEXT NOT NULL,
    playlist_name TEXT NOT NULL,
    playlist_id TEXT NOT NULL,
    playlist_href TEXT NOT NULL,
    playlist_uri TEXT NOT NULL,
    external_url TEXT NOT NULL,
    added_at DATE NOT NULL,
    total_tracks INTEGER NOT NULL
);

CREATE TABLE playlist_tracks (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    track_id TEXT,
    playlist_id TEXT,
    spotify_user TEXT,
    added_at DATE NOT NULL
);

/*
CREATE TABLE playlist_tracks (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    CONSTRAINT track_id
        FOREIGN KEY(track_id)
        REFERENCES tracks(track_id),
    CONSTRAINT playlist_id
        FOREIGN KEY(playlist_id)
        REFERENCES playlists,
    added_at DATE NOT NULL
);

*/

/* 
audio_analysis:
    NUMERIC (precision, scale)
        Precision: Total number of digits.
        Scale: Number of digits in terms of a fraction.
    popularity: not provided by audio analysis
        Numerical, the popularity of a track is a value between 0 
        and 100, with 100 being the most popular. The popularity 
        is calculated by algorithm and is based, in the most part, 
        on the total number of plays the track has had and how 
        recent those plays are.
    explicitness: not provided by audio analysis;
        Categorical, whether or not the track has explicit lyrics 
        ( true = yes it does; false = no it does not; OR unknown).
    release_year: not provided by audio analysis;
        year the song was released
*/
CREATE TABLE audio_analysis (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    spotify_user TEXT NOT NULL,
    track_id TEXT NOT NULL,
    analysis_url TEXT NOT NULL,
    acousticness NUMERIC (5,3),
    danceability NUMERIC (5,3),
    duration_ms INTEGER,
    energy NUMERIC (5,3),
    explictness TEXT,
    instrumentalness NUMERIC (8,6),
    track_key INTEGER,
    liveness NUMERIC (5,3),
    loudness NUMERIC (5,3),
    mode INTEGER,
    popularity INTEGER,
    release_year NUMERIC (4,0),
    speechiness NUMERIC (5,3),
    tempo NUMERIC (7,3),
    time_signature INTEGER,
    valence NUMERIC (5,3)
);

/* 
listening_history:
    endpoint-get-recently-played
    default: 20, minimum: 1, maximum: 50
    played_at
*/
CREATE TABLE listening_history (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    spotify_user TEXT NOT NULL,
    played_at DATE NOT NULL,
    track_name TEXT NOT NULL,
    track_id TEXT NOT NULL,
    track_href TEXT NOT NULL,
    track_uri TEXT NOT NULL,
    track_url TEXT NOT NULL,
    artist TEXT NOT NULL,
    album TEXT NOT NULL
)



