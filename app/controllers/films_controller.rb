class FilmsController < ApplicationController
  # GET /films
  # GET /films.json
  def index
    require 'open-uri'
    require 'json'
    @films = Film.order(:year)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @films }
    end
  end

  def my
    require 'open-uri'
    require 'json'
    @films = Film.order(:year)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @films }
    end
  end

  # GET /films/1
  # GET /films/1.json
  def show
    @film = Film.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @film }
    end
  end

  def year
    @film = Film.find(params[:year])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @film }
    end
  end


  # GET /films/new
  # GET /films/new.json
  def new
    @film = Film.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @film }
    #   format.js
    # end
  end

  # GET /films/1/edit
  def edit
    @film = Film.find(params[:id])
  end

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(params[:film])
    respond_to do |format|
      @film.save
      format.html { redirect_to  my_path, notice: 'Film was successfully created.' }
      format.json { render json: @film, status: :created, location: @film }
      format.js
    end
  end

  # PUT /films/1
  # PUT /films/1.json
  def update
    @film = Film.find(params[:id])
    @film.update_attributes(params[:film])
    respond_to do |format|
        format.html { redirect_to  my_path, notice: 'Film was successfully updated.' }
        format.json { head :no_content }
        format.js
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film = Film.find(params[:id])
    @film.destroy

    respond_to do |format|
      format.html { redirect_to films_url }
      format.json { head :no_content }
      format.js
    end
  end
end
