class ChatroomsController < ApplicationController
  def index
    matching_chatrooms = Chatroom.all

    @list_of_chatrooms = matching_chatrooms.order({ :created_at => :desc })

    render({ :template => "chatrooms/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_chatrooms = Chatroom.where({ :id => the_id })

    @the_chatroom = matching_chatrooms.at(0)

    render({ :template => "chatrooms/show.html.erb" })
  end

  def create
    the_chatroom = Chatroom.new
    the_chatroom.company_id = params.fetch("query_company_id")

    if the_chatroom.valid?
      the_chatroom.save
      redirect_to("/chatrooms", { :notice => "Chatroom created successfully." })
    else
      redirect_to("/chatrooms", { :notice => "Chatroom failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_chatroom = Chatroom.where({ :id => the_id }).at(0)

    the_chatroom.company_id = params.fetch("query_company_id")

    if the_chatroom.valid?
      the_chatroom.save
      redirect_to("/chatrooms/#{the_chatroom.id}", { :notice => "Chatroom updated successfully."} )
    else
      redirect_to("/chatrooms/#{the_chatroom.id}", { :alert => "Chatroom failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_chatroom = Chatroom.where({ :id => the_id }).at(0)

    the_chatroom.destroy

    redirect_to("/chatrooms", { :notice => "Chatroom deleted successfully."} )
  end
end
