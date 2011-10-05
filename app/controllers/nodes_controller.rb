class NodesController < DecisionTreeBaseController
  #layout 'templates/default'
  
  def index
    @nodes = Node.all
  end

  def new
    @node = Node.new
  end

  def show
    @node = Node.find(params[:id])
    @page_title = "Copyright Tool"
  end

  def edit
    @node = Node.find(params[:id])
  end
  
  def create
    @node = Node.new
    @node.attributes = params[:node]
    respond_to do|format|
      if @node.save
        flash[:notice] = 'Added that node'
        format.html {redirect_to nodes_path}
      else
        flash[:error] = 'Could not add that node'
        format.html {render :action => :new}
      end
    end
  end

  def destroy
    @node = Node.find(params[:id])
    node = @node.id
    if @node.destroy
      flash[:notice] = %Q|Deleted node #{node}|
      redirect_to :action => :index
    end
  end

  def update
    @node = Node.find(params[:id])
    @node.attributes = params[:node]
    respond_to do|format|
      if @node.save
        flash[:notice] = %Q|#{@node} updated|
        format.html {render :action => :index}
      else
        flash[:error] = 'Could not update that node'
        format.html {render :action => :new}
      end
    end
  end
end
