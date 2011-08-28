# == Schema Information
# Schema version: 20110826221216
#
# Table name: groups
#
#  id         :integer         not null, primary key
#  group_name :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  has_many :memberships#, :foreign_key => "group_id"
                        #dependent => :destroy
  has_many :users, :through => :memberships #, :source => :joined
  
  
  attr_accessible :group_name
end
