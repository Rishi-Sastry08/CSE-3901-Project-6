=begin

File Description: Contains controller code for the posts (user tasks).

# Default functions generated by Emily Zeaman on 11/10/2019
# Edited by Emily Zeaman on 11/21/2019 - "Added category to post_params"
# Edited by Bhagwat Sapkota on 11/22/2019 - "helped correct params to obtain category parameters"
# Ediited by Abilash Bodapati on 11/22/2019 - "added user_id constraint to filter feature"

=end


class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  # Filter Created by Emily Zeaman on 11/21/2019 
  def index

    if current_user.admin?
      @posts = Post.order(:due_date).where(completed: false)
    else
      @posts = Post.order(:due_date).where(user_id: current_user.email).where(completed: false)
    end

    #for filter feature
      if params[:category]
        @post = Post.order(:due_date).where(user_id: current_user.email).where(completed: false).where(category: params[:category])
      else
        @post = Post.order(:due_date).where(user_id: current_user.email).where(completed: false)
       
      end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def set_sessions
    session[:selected] = params[:category]
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def complete
    
    param1 = params[:param1]
    if param1
      @post = Post.find(param1.to_i)
      @post.update_attribute(:completed, true)
    end
    if current_user.admin?
      @posts = Post.order(:due_date).where(completed: true)
    else
      @posts = Post.order(:due_date).where(user_id: current_user.email).where(completed: true)
    end
 
  end

  # GET /posts/1/edit
  def edit
  end

  def hashUser curr 
    res = 0
    trav = curr.email.split('')
    for char in trav do 
      res += char.ord
    end
    res
  end 
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.email
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :priority, :due_date, :completed, :category)
    end
end