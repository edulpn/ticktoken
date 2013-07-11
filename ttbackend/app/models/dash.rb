# == Schema Information
#
# Table name: dashes
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  clock_in_out :integer
#  dash_at      :datetime
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Dash < ActiveRecord::Base
  attr_accessible :clock_in_out, :dash_at, :user_id
  belongs_to :user
end
