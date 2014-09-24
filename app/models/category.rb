class Category < ActiveRecord::Base
	has_many :entries, dependent: :restrict_with_exception
	validates :name, presence: true

	def destroyable?
		# A category can only be destroyed if no expense is associated
		!Entry.exists?(category_id: id)
	end
end
