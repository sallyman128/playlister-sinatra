class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

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