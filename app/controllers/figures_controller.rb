class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all
		erb :'/figures/index'
	end

	get '/figures/new' do
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'/figures/new'
	end

	post '/figures/new' do
		if params[:figure]
			titles = params[:figure][:title_ids]
			titles = titles.collect {|title|Title.find(title.to_i)} unless titles.nil?
		end
		if !params[:new_title].empty?
			new_title = Title.create(name:params[:new_title])
			titles = [] if titles.nil?
			titles << new_title
		end
		if params[:figure]
			landmarks = params[:figure][:landmark_ids]
			landmarks = landmarks.collect {|landmark|Landmark.find(landmark.to_i)} unless landmarks.nil?
		end
		if !params[:new_landmark].empty?
			new_landmark = Landmark.create(name:params[:new_landmark])
			landmarks = [] if landmarks.nil?
			landmarks << new_landmark
		end
		param_hash = {}
		param_hash[:name] = params[:figure_name]
		param_hash[:titles] = titles unless titles.nil?
		param_hash[:landmarks] = landmarks unless landmarks.nil?
		Figure.create(param_hash)
	end

	get '/figures/:id' do
		@figure = Figure.find(params[:id].to_i)
		erb :'/figures/show'
	end

	get '/figures/:id/edit' do
		@titles = Title.all
		@landmarks = Landmark.all
		@figure = Figure.find(params[:id].to_i)
		erb :'/figures/edit'
	end

	post '/figures/:id/edit' do
		@figure = Figure.find(params[:id].to_i)
				if params[:figure]
			titles = params[:figure][:title_ids]
			titles = titles.collect {|title|Title.find(title.to_i)} unless titles.nil?
		end
		if !params[:new_title].empty?
			new_title = Title.create(name:params[:new_title])
			titles = [] if titles.nil?
			titles << new_title
		end
		if params[:figure]
			landmarks = params[:figure][:landmark_ids]
			landmarks = landmarks.collect {|landmark|Landmark.find(landmark.to_i)} unless landmarks.nil?
		end
		if !params[:new_landmark].empty?
			new_landmark = Landmark.create(name:params[:new_landmark])
			landmarks = [] if landmarks.nil?
			landmarks << new_landmark
		end
		param_hash = {}
		param_hash[:name] = params[:figure_name]
		param_hash[:titles] = titles unless titles.nil?
		param_hash[:landmarks] = landmarks unless landmarks.nil?
		@figure.update(param_hash)
		redirect "/figures/#{@figure.id}"
	end

end