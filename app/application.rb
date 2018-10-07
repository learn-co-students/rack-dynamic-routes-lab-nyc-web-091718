

class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if(req.path.match(/items/))

      item_name = req.path.split("/items/").last
      index = @@items.find_index{|element| element.name == item_name}
      if(index == nil)
        resp.status = 400
        resp.write "Item not found"
      elsif
        resp.write @@items[index].price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
