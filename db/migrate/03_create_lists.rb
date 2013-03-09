class CreateLists < ActiveRecord::Migration
	def change
		create_table :lists do |t|
			t.string :type
			t.string :name

			t.timestamps
		end

		add_index :lists, :type
		add_index :lists, :name
	end
end
