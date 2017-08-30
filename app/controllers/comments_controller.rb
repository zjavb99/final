class CommentsController < ApplicationController
    skip_before_filter :verify_authenticity_token, :only => :create
    def create
        @comment = Comment.new
        @comment.content = params[:input_comment]
        @comment.post_id = params[:post_id]
        @comment.save
        redirect_to "/posts/#{params[:post_id]}"
    end
    
    def destroy
        @comment = Comment.find(params[:comment_id])
        @comment.destroy
        redirect_to "/posts/#{params[:post_id]}"
    end
end
