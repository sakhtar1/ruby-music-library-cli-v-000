class Artist
  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end


  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    #self.songs << song
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
 end


  def genres
    self.songs.collect {|song|
      song.genre}.uniq
  end


end