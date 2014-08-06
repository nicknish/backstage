class Like
  include Mongoid::Document
  field :likes, type: Integer
  belongs_to :song
end
