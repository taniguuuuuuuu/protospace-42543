class AddDetailsToPrototypes < ActiveRecord::Migration[7.1]
  def change
    add_column :prototypes, :title, :string
    add_column :prototypes, :catch_copy, :text
    add_column :prototypes, :concept, :text

    add_reference :prototypes, :user, null: false, foreign_key: true
  end
end
