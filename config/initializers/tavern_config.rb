# if the file is not there, we will raise an exception here, that is good
path = Rails.root.join "config", "application.yml"
TAVERN_CONF =  YAML.load_file(path)

class TavernConfig

  attr_accessor :restricted, :domain

  def initialize(restricted, domain)
    if (restricted.nil?)
        restricted= true
    end
    @restricted = to_boolean(ENV['TAVERN_RESTRICTED']) || restricted
    @domain = ENV['TAVERN_DOMAIN'] || domain
  end

  def public_access?
    !restricted
  end

  private
  def to_boolean(s)
      !!(s =~ /^(true|t|yes|y|1)$/i)
  end
end

#TODO: I am making this a const to make it public to all the app, 
#in the future should be more encapsulated
TAVERN_CONFIG = TavernConfig.new(TAVERN_CONF['restricted'], TAVERN_CONF['domain'])

