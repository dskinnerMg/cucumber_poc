require 'csv'
require 'yaml'
require 'singleton'

class UrlManager
  include Singleton

  attr_reader :front_end, :admin

  def self.front_end
    params
    @front_end = "#{@protocol}://#{@url.dig(@region, 'sub')}#{@env}#{@url.dig(@region, 'domain')}"
  end

  def self.admin
    params
     @admin = "#{@protocol}://#{@url.dig('admin', 'sub')}#{@env}#{@url.dig('admin', 'admin')}"
  end

  def self.params
    @env = FrameworkConfiguration.environment
    @region = FrameworkConfiguration.region
    @protocol = FrameworkConfiguration.protocol
    @url = YAML.load_file('./config/environments/environment.yml')
  end

#Creating getter methods!!! does this need doing for Config as well?
#Tests need refactoring
#Abstract need refactor

end