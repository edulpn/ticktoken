class Dash < ActiveRecord::Base
  attr_accessible :clock_in_out, :dash_at, :user_id
  belongs_to :user
end
