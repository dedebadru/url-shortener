class ShortenersController < ApplicationController
  before_action :shorteners
  before_action :set_shortener, only: [:edit, :update, :destroy, :redirect, :stats]
  before_action :set_new_shortener, only: [:index, :create]

  def create
    if @shortener.save
      set_new_shortener(nil)
    end
  end

  def update
    if @shortener.update(shortener_params)
      set_new_shortener(nil)
    end
  end

  def destroy
    if @shortener.destroy
      set_new_shortener(nil)
    end
  end

  def redirect
    ShortenerDetail.recording(@shortener, request)
    redirect_to @shortener.destination_url
  end

  def stats
    respond_to do |format|
      format.html
      format.json  { render file: "/shorteners/stats.json.erb", content_type: 'application/json' }
    end
  end

  private
    def shorteners
      @shorteners = Shortener.list
    end

    def set_shortener
      @shortener = Shortener.find(params[:id]) rescue Shortener.find_by_short_url(params[:short_url])
    end

    def set_new_shortener(_shortener_params = shortener_params)
      @shortener = Shortener.new(_shortener_params)
    end

    def shortener_params
      params.require(:shortener).permit(:short_url, :destination_url, :own_ip) if params[:shortener]
    end
end
