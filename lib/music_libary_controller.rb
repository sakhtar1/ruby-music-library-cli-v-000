
class MusicLibraryController
  attr_accessor :new_import

  def initialize(path= "./db/mp3s")
    @new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
    puts "Welcome to your music library!"
    answer = ""
    until answer == "exit"

      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets.strip.downcase
      case answer
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  #def exit_out
  #  puts "Until next time!"
  #end

  def list_songs

    Song.all.sort{ |k, v| k.name <=> v.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
  end

  def list_artists
     Artist.all.sort{ |k, v| k.name <=> v.name }.each.with_index(1) do |artist, index|
       puts "#{index}. #{artist.name}"
      end
  end

  def list_genres
     Genre.all.sort{ |k, v| k.name <=> v.name }.each.with_index(1) do |genre, index|
       puts "#{index}. #{genre.name}"
     end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets.strip
    if artist = Artist.find_by_name(answer)
     artist.songs.sort{ |k, v| k.name <=> v.name }.each.with_index(1) do |song, index|
       puts "#{index}. #{song.name} - #{song.genre.name}"
     end
   end
 end

 def list_songs_by_genre
   puts "Please enter the name of a genre:"
   answer = gets.strip
   if genre = Genre.find_by_name(answer)
    genre.songs.sort{ |k, v| k.name <=> v.name }.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.artist.name} - #{genre.name}"
    end
  end
end

def play_song
    puts "Which song number would you like to play?"
    answer = gets.strip.to_i
    if (1..Song.all.length).include?(answer)
      song = Song.all.sort{ |k, v| k.name <=> v.name }[answer - 1]
    end
      puts "Playing #{song.name} by #{song.artist.name}" if song

  end
end