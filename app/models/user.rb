# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :text
#  email           :text
#  admin           :boolean          default(FALSE)
#  team_id         :integer
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    has_secure_password

    validates :email, :presence => true , :uniqueness => true
    has_many :comments
    has_many :tasks
    belongs_to :team, :optional => true
end
