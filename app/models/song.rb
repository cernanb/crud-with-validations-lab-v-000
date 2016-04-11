class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: 2016}, if: :released
  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Cannot release this song in the same year"}
  validates :release_year, presence: true, if: :released

  # def released?
  #   released == true
  # end

end