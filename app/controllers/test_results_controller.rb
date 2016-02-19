class TestResultsController < ApplicationController
  def index
    @examples = project.examples.joins(:test_results)
      .where(test_results: { passed: false })
      .distinct
      .sort_by(&:percentage)
      .reverse
  end

  def create
    test_result_params.each do |result_json|
      example = project.examples.where(description: result_json[:description]).first_or_initialize
      example.test_results.build(passed: result_json[:passed])
      example.save!
    end
    head :ok
  end

  def test_result_params
    params.require(:results)
  end

  private

  def project
    @project ||= Project.find(params[:project_id])
  end
end
