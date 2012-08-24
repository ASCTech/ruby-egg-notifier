class Egg
  class << self
    attr_accessor :api_key, :raise_on_failure
    attr_reader   :url

    def url=(url)
      @url = URI(url)
    end
  end
end
