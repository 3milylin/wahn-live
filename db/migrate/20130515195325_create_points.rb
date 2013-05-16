class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
