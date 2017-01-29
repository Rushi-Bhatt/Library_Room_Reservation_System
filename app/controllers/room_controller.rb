class RoomController < ApplicationController

  before_filter :authenticateUser!
  def index
    @rooms = Room.all
  end

  def new
    @member = Room.new
  end

  def create
    @room = Room.new(room_params)
    # Save the object
    if @room.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Room created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      flash[:error] = @room.errors.empty? ? "Error" : @room.errors.full_messages.to_sentence
      render('new')
    end
  end

  def delete
    @room_number_to_delete=Room.find_by(:id=>params[:id]).room_number
    @room_booked = Booking.where(:room_number => @room_number_to_delete)
    puts "ROOM BOOKED _ " ,@room_booked
    if(@room_booked.count>0)
      puts "The Room has reservations"
      flash[:notice]="The room has been reserved by other user. Delete each reservations first and then delete the Room"
      redirect_to(:action => 'show', :controller => 'booking',:id=>@room_number_to_delete)
    else
      Room.find_by(:id=>params[:id]).destroy
      redirect_to(:action => 'index')
    end
  end

  private
  def room_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:room).permit(:room_number,:building,:size)
  end

end
