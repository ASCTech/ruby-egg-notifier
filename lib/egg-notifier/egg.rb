class Egg
  def self.notify(*args)
    Notifier.new(*args).execute!
  end
end
