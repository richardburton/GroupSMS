class CreateMemberships < ActiveRecord::Migration
  def self.up
    drop_table :groups_users
    create_table :memberships do |t|
      t.references :user
      t.references :group
      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end
