# if the file is not there, we will raise an exception here, that is good
path = Rails.root.join "config", "application.yml"

TAVERN_CONF =  YAML.load_file(path)

require 'ostruct'
class TavernConfig
  attr_accessor :restricted, :domain
  def initialize(restricted, domain)
    if (restricted.nil?)
        restricted= true
    end
    @restricted = ENV['TAVERN_RESTRICTED'] || restricted
    @domain = ENV['TAVERN_DOMAIN'] || domain
  end
  def public_access?
    !restricted
  end
end

#TODO: I am making this a const to make it public to all the app, 
#in the future should be more encapsulated
TAVERN_CONFIG = TavernConfig.new(TAVERN_CONF['restricted'], TAVERN_CONF['domain'])

