class Song
  require_relative '../lib/concerns/findable.rb'
  extend Concerns::Findable
  include Concerns::Findable

attr_accessor :name, :artist, :genre

@@all = []

def self.all
  @@all
end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

def save
  @@all << self
end

def self.destroy_all
  @@all.clear
end

def self.create(name)
  self.new(name).tap do |song|
    song.save
  end
end

def artist=(artist)
   if @artist == nil
     @artist = artist
   else
     @artist = @artist
   end
   if self.artist != nil
     @artist.add_song(self)
   end
   @artist
 end

 def genre=(genre)
     if @genre == nil
       @genre = genre
     else
       @genre= @genre
     end
     if self.genre != nil
       @genre.add_song(self)
     end
     @genre
   end

 def genre
   @genre
 end

 def self.new_from_filename(filename)
   split_file = filename.gsub(".mp3", "").split(" - ")
   artist = Artist.find_or_create_by_name(split_file[0])
   genre = Genre.find_or_create_by_name(split_file[2])
   self.new(split_file[1], artist, genre)
 end

 def self.create_from_filename(filename)
   song = self.new_from_filename(filename)
   song.save
 end



end
