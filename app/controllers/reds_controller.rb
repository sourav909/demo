require 'nokogiri'
require 'open-uri'
class RedsController < ApplicationController
  before_action :set_red, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  #before_action :limit_count, only: [:new, :create]
  # GET /reds
  # GET /reds.json
  def index
    @reds = current_user.reds.all
    # @reds.each do |rank|
    #   url = "http://www.alexa.com/siteinfo/#{rank.email}"
    #   doc = Nokogiri::HTML(open(url))
    #   global = doc.at_css(".globleRank .align-vmiddle").text
    #   rank.update_attribute(:global, global)
    #   country = doc.at_css(".countryRank .align-vmiddle").text
    #   rank.update_attribute(:country, country)
      

 # end
  end

  # GET /reds/1
  # GET /reds/1.json
  def show
  end

  # GET /reds/new
  def new
    @red = current_user.reds.build
  end

  # GET /reds/1/edit
  def edit
  end

  # POST /reds
  # POST /reds.json
  def create
    @red = current_user.reds.build(red_params)

    respond_to do |format|
      if @red.save
        format.html { redirect_to @red, notice: 'Red was successfully created.' }
        format.json { render :show, status: :created, location: @red }
      else
        format.html { render :new }
        format.json { render json: @red.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reds/1
  # PATCH/PUT /reds/1.json
  def update
    respond_to do |format|
      if @red.update(red_params)
        format.html { redirect_to @red, notice: 'Red was successfully updated.' }
        format.json { render :show, status: :ok, location: @red }
      else
        format.html { render :edit }
        format.json { render json: @red.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reds/1
  # DELETE /reds/1.json
  def destroy
    @red.destroy
    respond_to do |format|
      format.html { redirect_to reds_url, notice: 'Red was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_red
      @red = Red.find(params[:id])
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def red_params
      params.require(:red).permit(:email, :global, :country)
    end
end
