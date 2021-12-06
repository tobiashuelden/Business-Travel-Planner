class PostsController < ApplicationController
  def public_index
    matching_posts = Post.all
    matching_posts = matching_posts.where({:chatroom_id=>4})
    @list_of_posts = matching_posts.order({ :created_at => :desc })
    session[:chatroom] = 'public'
    render({ :template => "posts/index.html.erb" })
  end

  def company_index
    matching_posts = Post.all

    chatroom_id = Company.where({:id=>session[:company_id]}).at(0).chatroom.id

    matching_posts = matching_posts.where({:chatroom_id=>chatroom_id})
    @list_of_posts = matching_posts.order({ :created_at => :desc })

    session[:chatroom] = 'company'

    render({ :template => "posts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_posts = Post.where({ :id => the_id })

    @the_post = matching_posts.at(0)

    render({ :template => "posts/show.html.erb" })
  end

  def create
    the_post = Post.new
    the_post.user_id = session[:user_id]
    the_post.content = params.fetch("query_content")
    if session[:chatroom] == 'company'
    the_post.chatroom_id = Company.where({:id=>session[:company_id]}).at(0).chatroom.id
    end
    if session[:chatroom] == 'public'
      the_post.chatroom_id =4
    end

    if the_post.valid?
      the_post.save
      if session[:chatroom]=="company"
      redirect_to("/posts/chatroom/#{session[:company_id]}", { :notice => "Post created successfully." })
      end
      if session[:chatroom]=="public" 
        redirect_to("/posts/chatroom/public", { :notice => "Post created successfully." })
      end

    else
      if session[:chatroom]=="company"
        redirect_to("/posts/chatroom/#{session[:company_id]}", { :notice => "Post failed to create successfully." })
      end
      if session[:chatroom]=="public" 
          redirect_to("/posts/chatroom/public", { :notice => "Post failed to create successfully." })  
      end
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.content = params.fetch("query_content")

    if the_post.valid?
      the_post.save
      if session[:chatroom]=="company"
        redirect_to("/posts/chatroom/#{session[:company_id]}", { :notice => "Update successfully." })
      end
      if session[:chatroom]=="public" 
          redirect_to("/posts/chatroom/public", { :notice => "Update successfully." })  
      end    
    else
      if session[:chatroom]=="company"
        redirect_to("/posts/chatroom/#{session[:company_id]}", { :notice => "Update failed." })
      end
      if session[:chatroom]=="public" 
          redirect_to("/posts/chatroom/public", { :notice => "Update failed." })  
      end
        end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.destroy
    if session[:chatroom]=="company"
      redirect_to("/posts/chatroom/#{session[:company_id]}", { :notice => "Deleted successfully." })
    end
    if session[:chatroom]=="public" 
        redirect_to("/posts/chatroom/public", { :notice => "Deleted failed successfully." })  
    end

  end
end
