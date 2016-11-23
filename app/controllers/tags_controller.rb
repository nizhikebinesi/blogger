class TagsController < ApplicationController

   def tag_params
      params.require(:tag).permit(:name)
   end

   def index
      @tags = Tag.all
   end

   def new
      @tag = Tag.new
   end

   def create
      @tag = Tag.new(tag_params)
      @tag.save
      redirect_to tag_path(@tag)
   end

   def show
      @tag = Tag.find(params[:id])
   end

   def destroy
      Tag.find(params[:id]).destroy

      @tag_root = "/tags/"
      redirect_to @tag_root
   end

end
