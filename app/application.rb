class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last #should turn /items/Figs into Figs

      if Item.item_names.include?(item_name)
        item = Item.find_by_name(item_name)
        resp.write "#{item.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end #end Item.item_names.include?(item_name)

    else
      resp.write "Route not found"
      resp.status = 404
    end #end if req.path.match(/items/) stmt req.path.match(/items/)
    resp.finish
  end #end call(env) method
end #end Application class
