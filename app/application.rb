require 'pry'

class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      item_detail = @@items.find do |i| i.name == item
        resp.write item_detail.price
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
