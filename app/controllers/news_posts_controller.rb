class NewsPostsController < ApplicationController
  before_action :set_news_post, only: %i[ show edit update destroy ]
  before_action :authorize_model

  # GET /news_posts or /news_posts.json
  def index
    @news_posts = NewsPost.all
  end

  # GET /news_posts/1 or /news_posts/1.json
  def show
    #markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer = Redcarpet::Render::HTML.new(
      filter_html: false,
      hard_wrap: true
    )

    markdown = Redcarpet::Markdown.new(renderer, {
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      lax_spacing: true,           # <-- important for lists after paragraphs
      space_after_headers: true,
      superscript: true
    })
    #
    rawmd_html_content = markdown.render(@news_post.content)
    #@safe_html_content = Sanitize.fragment(rawmd_html_content, Sanitize::Config::RELAXED).html_safe
    @html_content = rawmd_html_content.html_safe
  end

  # GET /news_posts/new
  def new
    @news_post = NewsPost.new
  end

  # GET /news_posts/1/edit
  def edit
  end

  # POST /news_posts or /news_posts.json
  def create
    @news_post = NewsPost.new(news_post_params)

    respond_to do |format|
      if @news_post.save
        format.html { redirect_to news_post_url(@news_post), notice: "News post was successfully created." }
        format.json { render :show, status: :created, location: @news_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @news_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_posts/1 or /news_posts/1.json
  def update
    respond_to do |format|
      if @news_post.update(news_post_params)
        format.html { redirect_to news_post_url(@news_post), notice: "News post was successfully updated." }
        format.json { render :show, status: :ok, location: @news_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @news_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_posts/1 or /news_posts/1.json
  def destroy
    @news_post.destroy

    respond_to do |format|
      format.html { redirect_to news_posts_url, notice: "News post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_post
      @news_post = NewsPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def news_post_params
      params.require(:news_post).permit(:title, :content, :published)
    end

    def authorize_model
      authorize! :manage, NewsPost
    end
end
