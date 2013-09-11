# rulers/lib/rulers.rb
require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"

module Rulers
  # Your code goes here...
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      elsif env['PATH_INFO'] == '/'
        return [200, {'Content-Type' => 'text/html'}, ["Home Page"]]
      elsif env['PATH_INFO'] == '/r'
        return [302, {'Content-Type' => 'text/html', 'Location'=>'/quotes/redirected_quote'},[]]
      end
      
      begin  
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        text = controller.send(act)
        [200, {'Content-Type' => 'text/html'},[text]]
      rescue
        [500, {'Content-Type' => 'text/html'},["simple error - no controller action - klass: #{klass.inspect} action: #{act.inspect} controller: #{controller.inspect}"]]
      end
    end
  end

end
