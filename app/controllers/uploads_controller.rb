class UploadsController < ApplicationController
  require 'faker'

  def index
    @uploads = Upload.all
  end

  def create
    Upload.create(name: create_name)
    redirect_to uploads_path
  end

  private

  def create_name
    name = Faker::Superhero.name

    loop do
      break if !Upload.all.pluck(:name).include?(name)
      name = Faker::Superhero.name
    end

    name
  end
end
