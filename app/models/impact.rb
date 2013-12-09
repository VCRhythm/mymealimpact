# == Schema Information
#
# Table name: impacts
#
#  id               :integer          not null, primary key
#  detail           :text
#  food_id          :integer
#  source_code      :string(255)
#  destination_code :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Impact < ActiveRecord::Base
	belongs_to :food

	def source_country_name
		::CountrySelect::COUNTRIES[source_code]
	end

	def destination_country_name
		::CountrySelect::COUNTRIES[destination_code]
	end
end
