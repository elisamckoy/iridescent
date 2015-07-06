class Pattern < ActiveRecord::Base
	validates :name, :first, :second, :third, presence: true
end
