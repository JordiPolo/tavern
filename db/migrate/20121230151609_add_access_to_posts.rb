class AddAccessToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :access, :string
  end
end
