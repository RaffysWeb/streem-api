# frozen_string_literal: true

module EsSearch
  class Base
    private

    def client
      @client ||= Elasticsearch::Client.new(url: "https://#{ENV['ES_USER']}:#{ENV['ES_PASSWORD']}@#{ENV['ES_URL']}")
    end

    def search(options)
      client.search(options)
    end
  end
end
