class Todo < ActiveRecord::Base
	validates :title, :description, presence: true

	def self.all_todos_modified_after(date)
		self.where(updated_at: (date)..Time.now)
	end

end
