class RsvpController < ApplicationController
  before_action :set_guest

  def index
    @guest = Guest.new
  end

  def find
    @guest = Guest::find_guest( first: params['guest']['first'],
                                last: params['guest']['last'])
    i = 0
    while @guest.length != 1 || i > 1 do
      case i
      when 0
        @guest = Guest::find_guest( first: params['guest']['first'],
                                    last: params['guest']['last'],
                                    city: params['guest']['city'])
      when 1
        @guest = Guest::find_guest( first: params['guest']['first'], 
                                    city: params['guest']['city'])
      end
      i += 1
    end

    if @guest.length == 1
      @guest = @guest.first
    else
      flash[:error] = "I'm sorry, I can't seem to find your record."
      redirect_to :action => :index
    end

    redirect_to :action => 'view', :ext_id => @guest.ext_id
  end

  def view
    if params['ext_id'].length == 3
      @guest = Guest.where("ext_id LIKE :short_code", short_code: "#{params['ext_id']}%").first
    else
      @guest = Guest.find_by(ext_id: params['ext_id'])
    end

    if @guest.nil?
      flash[:error] = "I'm sorry, I can't seem to find your record."
      redirect_to :action => :index
    else
      session[:guest_id] = @guest.id
    end
  end

  def confirm
    @guest.rsvp params[:rsvp]
    redirect_to :action => 'view', :ext_id => @guest.ext_id
  end


  private
    def set_guest
      @guest = Guest.find(params[:id] || session[:guest_id])
    end
end
