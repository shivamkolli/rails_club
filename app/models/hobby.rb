class Hobby < ActiveRecord::Base
	belongs_to :User
	paginates_per 10
end
