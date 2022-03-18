class AddLinkToPost < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :link, :string
  end
end
