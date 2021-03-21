# Add seed data here. Seed your database with `rake db:seed`
seed_song = Song.create(name: "Woohoo A Song")

seed_artist = Artist.create(name: "Woohhoo A Artist")
seed_genre = Genre.create(name: "Woohoo A Genre")

seed_song.update(:artist => seed_artist, :genre => seed_genre)
