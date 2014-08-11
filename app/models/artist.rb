class Artist
  include Mongoid::Document
  field :name, type: String
  has_many :songs
  has_many :follows
end
