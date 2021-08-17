class BirdsController < ApplicationController
  def index
    birds = Bird.all
    #render json: birds
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
    # rather than specifically listing every key we want to include, we could also exclude particular content using the except:
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # slice works fine for a single hash, as with bird, it won't work for an array of hashes like the one we have in our index action
    if bird
     render json: bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found' }
    end
    
  end
end