class Egg
  class << self
    attr_accessor :service
    attr_reader   :url

    def url=(url)
      @url = URI(url)
    end
  end
end
