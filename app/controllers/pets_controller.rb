class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'
  end

  post '/pets' do
    #binding.pry
    if params[:owner][:name] != ""
      @owner = Owner.create(params[:owner])
    elsif params[:pet][:owner_id]
      @owner = Owner.find(params[:pet][:owner_id])
    end
    @pet = Pet.create(name: params[:pet][:name], owner: @owner)
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  post '/pets/:id' do
    if params[:owner][:name] != ""
      @owner = Owner.create(params[:owner])
    elsif params[:pet][:owner_id]
      @owner = Owner.find(params[:pet][:owner_id])
    end
    @pet = Pet.find(params[:id])
    @pet.update(name: params[:pet][:name], owner: @owner)
    redirect to "pets/#{@pet.id}"
  end
end
