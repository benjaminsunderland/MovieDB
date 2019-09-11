class Movie < ApplicationRecord
	has_attached_file :image, styles: { medium: "400x600#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many   :ratings

	validates :title, presence: true 
    validates :text, presence: true 

    enum category_type: %i[action adventure comedy crime drama epics horror musicals sci_fi war westerns]
end
