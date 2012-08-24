class Egg
  class Notifier

    attr_accessor :event_name, :timestamp

    def initialize(event_name, timestamp=Time.now)
      @event_name = event_name

      timestamp = Time.parse(timestamp.to_s) unless timestamp.respond_to?(:utc)
      @timestamp = timestamp.utc.iso8601
    end

    def execute!
      raise ServiceNotDefined unless Egg.service
      raise UrlNotDefined     unless Egg.url

      response = self.class.http.post(url.path, params.to_json, headers)

      if Egg.raise_on_failure and !response.kind_of?(Net::HTTPSuccess)
        raise HTTPFailure.new("#{response.code}: #{response.body}")
      end

      response
    end


    private

    def self.http
      @http ||= Net::HTTP.new(url.host, url.port)
    end

    def self.url
      Egg.url
    end

    def url
      Egg.url
    end

    def params
      {:service => Egg.service, :name => @event_name, :timestamp => @timestamp}
    end

    def headers
      {'Content-type' => 'application/json'}
    end

  end
end
