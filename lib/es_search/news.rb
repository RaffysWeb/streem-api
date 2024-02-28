# frozen_string_literal: true

module EsSearch
  class News < EsSearch::Base
    def initialize
      super

      @index = 'news'
    end

    def aggregate_counts_by_date_and_medium(query_term, interval, before, after)
      query = {
        query: {
          bool: {
            must: [
              { match: { text: query_term } },
              { range: { timestamp: { gte: before, lte: after } } }
            ]
          }
        },
        aggs: {
          first_agg: {
            date_histogram: {
              field: 'timestamp',
              fixed_interval: interval || '1d',
              min_doc_count: 0,
              time_zone: Time.zone.name
            },
            aggs: {
              second_agg: {
                terms: { field: 'medium' }
              }
            }
          }
        }
      }

      search(query)
    end

    private

    def search(query)
      super(body: query)
    end
  end
end
