class ClockController < ApplicationController
  def now
  	@now = Time.current()
  end
end
