# frozen_string_literal: true

class ResultsController < ApplicationController
  def index
    results = EsSearch::News.new.aggregate_counts_by_date_and_medium(*index_params)
    # NOTE: Returning the result following the requirements but ideally we should serialize the result
    # in the backend instead of grouping the results client side.
    render json: { aggregations: results['aggregations'] }
  end

  private

  def index_params
    params.require(%i[query_term interval after before])
  end
end
