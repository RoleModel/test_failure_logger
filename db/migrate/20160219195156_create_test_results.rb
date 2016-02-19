class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.string :description
      t.boolean :passed
      t.timestamps null: false
    end
  end
end
