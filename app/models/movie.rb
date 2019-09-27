class Movie < ApplicationRecord
	SEARCH_FIELDS = %i[search title category_type].freeze

	has_attached_file :image, styles: { medium: "400x600#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many :ratings, dependent: :destroy
    has_many :reviews, dependent: :destroy
    
	validates :title, presence: true 
    validates :text, presence: true
    validates :category_type, presence: true 

    enum category_type: %i[action adventure animation comedy crime drama epics horror musicals sci_fi war westerns]

    def self.filtered(params)
    	result = current_scope || self
    	params = params.slice(*SEARCH_FIELDS) if params.present?
    	return result if params.blank?

    	if params[:search].present?
    		result = result.where('movies.title LIKE :search', search: "%#{params[:search].strip}%")
    	end

        if params[:category_type].present?  
            result = result.where(category_type: params[:category_type].downcase)
        end

    	result
    end

    def self.find_category_amount(type)
        Movie.where(category_type: type).size
    end

    def find_average_rating
        (ratings.sum(&:score) / ratings.count) if ratings.exists?
    end
end
