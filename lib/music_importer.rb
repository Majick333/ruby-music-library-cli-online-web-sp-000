class MusicImporter

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = []
    Dir.glob("#{path}/*.mp3").collect do |file|
      files << file.gsub("#{path}/", "")
    end
    files
    end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
