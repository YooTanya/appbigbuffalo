class ProxyController < ApplicationController
  def index
    render :layout => false, :content_type => 'application/liquid'
  end
end