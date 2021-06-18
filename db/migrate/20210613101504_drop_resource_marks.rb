class DropResourceMarks < ActiveRecord::Migration[6.1]
	def change
		drop_table :resource_marks do |t|
			t.belongs_to :mark, foreign_key: true, index: { unique: true }, null: false
			t.belongs_to :resource, foreign_key: true, index: true, null: false
			t.timestamps

			t.index [:mark_id, :resource_type, :resource_id], unique: true, name: :index_resource_translators_uniqueness
		end
	end
end
