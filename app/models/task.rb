# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  name       :text
#  start_date :date
#  difficulty :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ApplicationRecord
    belongs_to :user, :optional => true
end
