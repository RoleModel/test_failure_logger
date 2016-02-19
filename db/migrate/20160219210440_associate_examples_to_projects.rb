class AssociateExamplesToProjects < ActiveRecord::Migration
  def change
    add_column :examples, :project_id, :integer
  end
end
