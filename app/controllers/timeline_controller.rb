class TimelineController < ApplicationController
    before_action :authenticate_user!, except: :index
    
    
    
    def index
        @blogs = Blog.all.reverse
        @users = User.all
    end
    def write
        Blog.create(user_id:current_user.id, content:params[:naeyong])
        
        redirect_to :root
    end
    def comment
        Comment.create(user_id:current_user.id, blog_id: params[:blog_id], msg: params[:comment])
        redirect_to :root
    end
    def deletecomment
        temp = Comment.find(params[:deleteid])
        temp.destroy
        redirect_to :root
    end
    def deleteblog
        temp = Blog.find(params[:blog_id])
        temp.comments.destroy
        temp.destroy
        redirect_to :root
    end

    def show
        @user = User.find(params[:selectid])
        @name = @user.email
    end

end
