class Gallery

  @@all = []

  attr_reader :name, :city

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select{|painting| painting.gallery == self}
  end

  def artists
    self.paintings.map{|painting| painting.artist}
  end

  def artist_names
    self.artists.map{|artist| artist.name}
  end

  def most_expensive_painting
    cost_array = self.paintings.map{|painting| painting.price}
    self.paintings.find{|painting| painting.price == cost_array.max}
  end
end
