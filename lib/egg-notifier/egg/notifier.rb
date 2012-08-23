class Egg
  class Notifier

    def intialize(event_name, timestamp=Time.now)
      @event_name = event_name
      @timestamp  = timestamp
    end

    def execute!
      http.post(uri.path, params.to_json, headers)
    end


    private

    def uri
      Egg.uri
    end

    def http
    end

    def params
    end

    def headers
    end

  end
end
