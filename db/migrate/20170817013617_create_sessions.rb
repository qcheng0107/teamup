class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :quarter
      t.string :course_name

      t.timestamps

    end
  end
end
