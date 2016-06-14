class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      if song.name == name
        song
      end
    end 
  
  end
  def self.find_or_create_by_name(name)
    if self.all.include?(name) == true
      return name
    else
      self.create_by_name(name)
    end
  end
  def self.alphabetical
    @@all.sort_by{|song| song.name[0]}


  end
  def self.new_from_filename(filename)
    song = Song.new
    @name = filename.split(".").first.split(" - ").last
    @artist_name = filename.split(".").first.split(" - ").first
    song.name = @name
    song.artist_name = @artist_name
    song
  end
  def self.create_from_filename(filename)
    song = Song.new
    @name = filename.split(".").first.split(" - ").last
    @artist_name = filename.split(".").first.split(" - ").first
    song.name = @name
    song.artist_name = @artist_name
    song.save
    song
  end
  def self.destroy_all
    @@all = []
  end

end
