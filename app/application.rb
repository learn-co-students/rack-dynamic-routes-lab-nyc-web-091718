class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path=="/testing"

        resp.write "Route not found"
        resp.status = 404

    elsif req.path.match(/items/)
        #turns items/ITEM NAME into ITEM NAME
        get_item_name = req.path.split("/items/").last


        #sets variable item to the name that the client requested
        item = @@items.find do |item_name|
          item_name.name == get_item_name
          #if item is found in array, then return price for that item
        end

        if !@@items.include?(item)
          resp.write "Item not found"
          resp.status = 400
        else
        resp.write item.price
        end
    end #end of main if/else
       resp.finish
  end #end of method

end
