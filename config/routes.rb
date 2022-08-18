Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :restaurants, only: [:index, :new, :show, :create]

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

end

#TESTING CODE in Rails Console - rails c
# > bristol = Restaurant.new(name: "Epicure", category: "french")
# > bristol.valid?              # Should return false
# > bristol.address = "75008 Paris"
# > bristol.valid?              # Should return true
# > bristol.save                # Insert into DB and set id
# > yummy = Review.new(content: "yummy yummy", rating: 4)
# > yummy.restaurant = bristol  # Set foreign key restaurant_id
# > yummy.save
# > bristol.reviews             # Should contain the yummy review
# > yummy.restaurant
