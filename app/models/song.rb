class Song
  include Mongoid::Document
  field :name, type: String
  has_many :likes
  belongs_to :artist
end
