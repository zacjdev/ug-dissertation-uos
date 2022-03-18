class AddPrivateFlagToPost < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :private_post, :boolean, default: false
  end
end
