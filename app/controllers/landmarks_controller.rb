class LandmarksController < ApplicationController

	get '/landmarks/new' do
		@figures = Figure.all
		erb :'/landmarks/new'
	end

	post '/landmarks/new' do
		new_landmark = Landmark.create(name: params[:landmark_name], year_completed: params[:landmark_year_completed])
		redirect "/landmarks/#{new_landmark.id}"
	end

	get '/landmarks' do
		@landmarks = Landmark.all
		erb :'/landmarks/index'
	end

	get '/landmarks/:id/edit' do
		@landmark = Landmark.find(params[:id])
		erb :'/landmarks/edit'
	end

	post '/landmarks/:id/edit' do
		updated_landmark = Landmark.find(params[:id])
		updated_landmark.update(name: params[:name], year_completed: params[:year_completed])
		redirect "/landmarks/#{updated_landmark.id}"
	end

	get '/landmarks/:id' do
		@landmark = Landmark.find(params[:id])
		erb :'/landmarks/show'
	end

end
