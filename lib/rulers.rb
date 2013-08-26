require "rulers/version"
require "rulers/routing"
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
        [500, {'Content-Type' => 'text/html'},["simple error - no controller action"]]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end
    def env
      @env
    end
  end

end
