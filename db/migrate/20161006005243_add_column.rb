class AddColumn < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :integer
  end
end
