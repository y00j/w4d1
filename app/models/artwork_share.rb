# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  artwork_id :integer
#  viewer_id  :integer
#

class ArtworkShare < ApplicationRecord

  belongs_to :artwork,
    class_name: :Artwork,
    foreign_key: :artist_id

  belongs_to :viewer,
    class_name: :User,
    foreign_key: :view_id

  has_many :shared_viewers,
    through: :artwork,
    source: :artist


end
