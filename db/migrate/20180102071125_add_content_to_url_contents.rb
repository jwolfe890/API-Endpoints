class AddContentToUrlContents < ActiveRecord::Migration[5.0]
  def change
    add_column :url_contents, :content, :string
  end
end
