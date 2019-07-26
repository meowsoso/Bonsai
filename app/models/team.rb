# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
    has_many :users
end
