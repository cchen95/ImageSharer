class Images < ActiveRecord::Migration
  def change
  	create_table :images do |t|
      t.string :link
      t.string :uploaded_by

      t.timestamps null: false
  	end
  end
end
