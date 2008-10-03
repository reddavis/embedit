require "active_support"

module Embedit
  class Provider
    attr_reader :title, :url, :format, :html
    
    # require all providers and collect the names
    @@list = Dir["#{File.dirname(__FILE__)}/providers/*.rb"].collect {|file| require(file); "Embedit::#{File.basename(file,'.rb').classify}".constantize }
    
    class << self
      def all
        @@list
      end
    
      def each
        all.each do |provider|
          yield provider
        end
      end
      
      def find(url)
        each do |provider|
          return provider.new(url) if provider.match(url)
        end
        nil # if no provider found
      end
      
    end
    
  end
end

