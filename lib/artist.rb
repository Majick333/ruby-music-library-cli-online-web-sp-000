class Artist
  require_relative '../lib/concerns/findable.rb'
  extend Concerns::Findable
  include Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []

    self.save
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist)
    self.new(artist).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    song.genre = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end



end
