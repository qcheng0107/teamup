class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :skill_id
      t.integer :user_id

      t.timestamps

    end
  end
end
