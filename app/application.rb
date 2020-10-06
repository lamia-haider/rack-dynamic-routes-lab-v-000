require 'pry'

class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      resp.write " "
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
  binding.pry
end
