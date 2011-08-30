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
  
 # accepts_nested_attributes_for :user
 
 #todo - understand how to build Users as group submits....
 
 #def users
  # @users = User.all #why is this causing the view to render three new user submits
 #end
  
  def user_attributes=(user_attributes)
    user_attributes.each do |attributes|
      users.build(attributes)
    end
  end
  
  
  
end
