class Egg
  class Notifier

    attr_accessor :event_name, :timestamp

    def initialize(event_name, timestamp=Time.now)
      @event_name = event_name

      timestamp = Time.parse(timestamp.to_s) unless timestamp.respond_to?(:utc)
      @timestamp = timestamp.utc.iso8601
    end

    def execute!
      raise APIKeyNotDefined unless Egg.api_key
      raise UrlNotDefined    unless Egg.url

      response = self.class.http.post(url.path, params.to_json, headers)

      if Egg.raise_on_failure and !response.kind_of?(Net::HTTPSuccess)
        if response
          raise HTTPFailure.new("#{response.code}: #{response.body}")
        else
          raise HTTPFailure.new("nil HTTP response, that's odd.")
        end
      end

      response
    end


    private

    def self.http
      return @http if @http

      @http = Net::HTTP.new(url.host, url.port)
      @http.use_ssl = true if url.scheme == 'https'
      @http
    end

    def self.url
      Egg.url
    end

    def url
      Egg.url
    end

    def params
      {:name => @event_name, :timestamp => @timestamp}
    end

    def headers
      {'Content-type' => 'application/json', 'X-API-Key' => Egg.api_key}
    end

  end
end
