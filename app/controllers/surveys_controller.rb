class SurveysController < ApplicationController
  def new
  end

  def create
    @name = params[:name]
    @feedback = params[:feedback]
    @email = params[:email]

    # Тут можна зберегти дані в базу даних або відправити електронний лист, або будь-яка інша логіка

    render plain: "Thank you for your feedback, #{@name}! Your email: #{@email}, Feedback: #{@feedback}"
  end
end
