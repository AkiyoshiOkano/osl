class MicropostsController < ApplicationController
before_action :authenticate_user! ,only: [:create, :destroy]
before_action :correct_user,   only: :destroy

  def paper
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @tags = Micropost.tag_counts_on(:tags)
        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @micropost }
        end
    end
  end

  def index
    @memos = Micropost.all
    @tags = Micropost.tag_counts_on(:tags)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memos }
    end
  end


  def tag
    @micropost = Micropost.tagged_with(params[:name])
    @tags = Micropost.tag_counts_on(:tags)
    
    render 'index'
  end

  def create
  	@micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

  	def micropost_params
  		params.require(:micropost).permit(:content)
  	end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end