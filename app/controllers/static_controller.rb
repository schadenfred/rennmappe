class StaticController < ApplicationController

  skip_before_action :authenticate_user!

  def about
  end

  def contact
  end

  def help
  end

  def home
  end

  def pricing
  end

  def privacy
  end

  def terms
  end

  def sweet_thanks
  end

  def sample
  end
end
