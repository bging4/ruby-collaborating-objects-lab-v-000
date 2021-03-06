require 'pry'
class Song

  attr_accessor :name, :artist

  def initialize(song_name)
    @name = song_name
  end

  def self.new_by_filename(some_filename)
    song = self.new(some_filename.split(" - ")[1])
    # song.artist = Artist.new(some_filename.split(" - ")[0])
    song.artist = Artist.find_or_create_by_name(some_filename.split(" - ")[0])
    song.artist.songs << song
    song
  end

  def artist_name=(name)
    Artist.find_or_create_by_name(name)
  end

end
