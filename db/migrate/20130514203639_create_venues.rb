class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :foursqr_id
      t.string :name
      t.string :category
      t.integer :herenow
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}

      t.timestamps
    end
  end
end
