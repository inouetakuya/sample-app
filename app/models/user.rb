# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  mail_address    :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name
end
