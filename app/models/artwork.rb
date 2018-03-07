# == Schema Information
#
# Table name: artworks
#
#  id        :integer          not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  validates :artist_id, :title, presence: true

  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id

  has_many :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
end
