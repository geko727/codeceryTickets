class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  before_filter :require_user, only: [:edit, :update, :index, :new]
  before_filter :require_same, only: [:show]
  

  # GET /tickets
  # GET /tickets.json
  def index
    @user = current_user
    @tickets = @user.tickets
    @new_ticket = Ticket.new
  end

  def code_index
    @user = current_user
    @tickets = Ticket.all
  end

  def code_ticket
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @comment = Comment.new
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end


  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.status = "Approval Pending"
    @ticket.user = current_user
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end

  def require_same
      redirect_to tickets_path unless @ticket.user == current_user || current_user.codecery
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:title, :description, :deadline, :status)
    end
end
