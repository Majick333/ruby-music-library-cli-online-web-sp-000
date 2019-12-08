class Genre
#require_relative "../lib/concerns/findable.rb"
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

def self.create(genre)
  self.new(genre).tap do |genre|
    genre.save
  end
end

def add_song(song)
   song.genre = self unless song.genre == self
   @songs << song unless @songs.include?(song)
 end

def artists
  artists = @songs.collect do |song|
    song.artist
  end
  artists.uniq
end



end
