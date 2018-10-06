class Application

  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last

      fresh_item = @@items.find{|i| i.name == item}
      if fresh_item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{fresh_item.price}"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
