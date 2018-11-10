require 'erb'
load 'pet.rb'

class RackRequest
  attr_accessor :method, :path, :pet

  def call(env)
    self.method = env['REQUEST_METHOD'].downcase
    self.path = env['REQUEST_PATH']
    self.pet ||= Pet.new

    public_send(processed_method_name)

    Rack::Response.new(render('index.html.erb'))
  rescue NoMethodError
    Rack::Response.new('Not Found', 404)
  end

  def get
  end

  def get_feed
    pet.feed
  end

  private

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    File.read(path)
  end

  def processed_method_name
    method_name = "#{method}#{path_to_method_name}"
    method_name.gsub(/_+$/, '')
  end

  def path_to_method_name
    path.gsub('/', '_')
  end
end