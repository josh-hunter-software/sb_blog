class AddLogoToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :logo, :string
  end
end
