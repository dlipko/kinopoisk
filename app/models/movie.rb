class Movie < ApplicationRecord
	#Movie belong to user with id
	belongs_to :user

	#Avatar for movie
	has_attached_file :image, styles: { medium: "400x600>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	validates_presence_of :title, :descroption, :movie_length, :director, :rating, :image

  	has_many :reviews
end
