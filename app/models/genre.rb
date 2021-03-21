class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    dont_capitalize = ["with", "the", "a"]

    unslugged = slug.split("-").map do |word|
      word = word.capitalize unless dont_capitalize.include?(word)
      word
    end.join(" ")

    self.find_by(:name => unslugged)
  end
end