class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, "application/json"

  get "/bakeries" do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get "/bakeries/:id" do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do
    bakeries = BakedGood.order(price: :desc)
    bakeries.to_json(only: [:name, :price])
  end

  get "/baked_goods/most_expensive" do
    bakeries = BakedGood.order(price: :desc).first
    bakeries.to_json(only: [:name, :price])
  end

end
