module Embedit
  class Providers
    
    attr_accessor :sites
    
    def initialize
      @sites = {}
      add_default_providers
    end
    
    private
    def add_default_providers
      load_providers
    end
    
    def load_providers
      providers = YAML.load_file("#{File.dirname(__FILE__)}/../providers.yaml")
      providers.each {|d| @sites.merge!(d[0] => d[1])}
    end
  end
end
