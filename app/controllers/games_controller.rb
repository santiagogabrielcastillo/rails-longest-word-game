require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    if !check_word?
      @ans = '1'
    elsif !check_api?
      @ans = '2'
    else
      @ans = '3'
      session[:score] = session[:score] + params[:word].split(//).count
    end
  end

  private

  def check_word?
    # verifico que la frecuencia de cada letra en la palabra escogida sea menor o igual que su frecuencia en el grid
    word = params[:word]
    word.upcase.split(//).all? do |letter|
      word.upcase.count(letter) <= params[:letters].count(letter)
    end
  end

  def check_api?
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    info_serialized = open(url).read
    info = JSON.parse(info_serialized)
    info['found']
  end
end
