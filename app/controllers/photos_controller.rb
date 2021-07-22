class PhotosController < ApplicationController
    def index
        photo = Photo.all
        render json: photo
    end
    def create
        puts params
        result = Cloudinary::Uploader.upload(params[:image])
        puts result["url"]
  photo = Photo.create(image:   result['url'])
     if photo.save
        render json: result
     else
        render json: photo.errors
     end
    end

end
