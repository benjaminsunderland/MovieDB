class Movie < ApplicationRecord
	SEARCH_FIELDS = %i[search title].freeze

	has_attached_file :image, styles: { medium: "400x600#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many   :ratings

	validates :title, presence: true 
    validates :text, presence: true

    enum category_type: %i[action adventure comedy crime drama epics horror musicals sci_fi war westerns]

    def self.filtered(params)
    	result = current_scope || self
    	params = params.slice(*SEARCH_FIELDS) if params.present?
    	return result if params.blank?

    	if params[:search].present?
    		result = result.where('movies.title LIKE :search', search: "%#{params[:search].strip}%")
    	end

    	result
    end
end
