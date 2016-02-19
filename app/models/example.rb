class Example < ActiveRecord::Base
  has_many :test_results
  belongs_to :project

  def failed
    @failed ||= test_results.where(passed: false).count
  end

  def total_runs
    @total_runs ||= test_results.count
  end

  def percentage
    # Need to_f to not get 0
    (failed.to_f / total_runs) * 100
  end
end
