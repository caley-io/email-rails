class PagesController < ApplicationController
  before_action :authenticate_user!

  def inbox
  end

  def done
  end

  def team
  end

  def calendar
  end

  def vip
  end

  def sent
  end

  def later
  end

  def draft
  end

  def archive
  end

  def trash
  end
end
