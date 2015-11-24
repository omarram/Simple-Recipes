class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.references :chef, :recipe, index: true
      t.timestamps
    end
  end
end
