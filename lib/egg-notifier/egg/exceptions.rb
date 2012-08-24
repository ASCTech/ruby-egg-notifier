class Egg
  class ServiceNotDefined < RuntimeError; end
  class UrlNotDefined     < RuntimeError; end

  class Notifier
    class HTTPFailure     < RuntimeError; end
  end
end
