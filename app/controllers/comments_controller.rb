class CommentsController < ApplicationController
  def index
    matching_comments = Comment.all
    matching_comments = matching_comments.where({:post_id=>params.fetch('path_id').to_i})
    @list_of_comments = matching_comments.order({ :updated_at => :asc })

    render({ :template => "comments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comments = Comment.where({ :id => the_id })

    @the_comment = matching_comments.at(0)

    render({ :template => "comments/show.html.erb" })
  end

  def create
    the_comment = Comment.new
    the_comment.content = params.fetch("query_content")
    the_comment.post_id = session[:post_id]

    if the_comment.valid?
      the_comment.save
      redirect_to("/comments/post/#{the_comment.post_id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/comments/post/#{the_comment.post_id}", { :alert => "Failed to create Comment." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.content = params.fetch("query_content")
    
    if the_comment.valid?
      the_comment.save
      redirect_to("/comments/post/#{the_comment.post_id}", { :notice => "Comment updated successfully."} )
    else
      redirect_to("/comments/post/#{the_comment.post_id}", { :alert => "Failed to update Comment." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)
    post_id = the_comment.post_id
    the_comment.destroy

    redirect_to("/comments/post/#{post_id}", { :notice => "Comment deleted successfully."} )
  end
end
