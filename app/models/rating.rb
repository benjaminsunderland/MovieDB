class Rating < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many   :ratings

	valides :title, presence: true 
    valides :text, presence: true 
end
