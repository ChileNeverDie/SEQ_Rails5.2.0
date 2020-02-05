class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @problem = current_user.problems.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end
