class AssociateTestResultsToExamples < ActiveRecord::Migration
  def change
    add_column :test_results, :example_id, :integer
    remove_column :test_results, :description
  end
end
