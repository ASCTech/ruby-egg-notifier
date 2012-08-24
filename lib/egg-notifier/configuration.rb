class Egg
  class << self
    attr_accessor :service, :raise_on_failure
    attr_reader   :url

    def url=(url)
      @url = URI(url)
    end
  end
end
