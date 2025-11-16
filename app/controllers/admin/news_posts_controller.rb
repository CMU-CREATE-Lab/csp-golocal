class Admin::NewsPostsController < ApplicationController

  layout "application_back"
  before_action :set_news_post, only: %i[ show edit update destroy ]
  before_action :authorize_news_posts

  def index
    @news_posts = NewsPost.all
  end

  def show
    #markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer = Redcarpet::Render::HTML.new(
      filter_html: true,
      hard_wrap: true
    )

    markdown = Redcarpet::Markdown.new(renderer, {
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      lax_spacing: true,
      space_after_headers: true,
      superscript: true
    })
    #
    rawmd_html_content = markdown.render(@news_post.content)
    @safe_html_content = Sanitize.fragment(rawmd_html_content, Sanitize::Config::RELAXED).html_safe
  end

  def new
    @news_post = NewsPost.new
  end

  def edit
  end

  def create
    @news_post = NewsPost.new(news_post_params)

    respond_to do |format|
      if @news_post.save
        format.html { redirect_to admin_news_index_path, notice: "News post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @news_post.update(news_post_params)
        format.html { redirect_to admin_news_index_path, notice: "News post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @news_post.destroy

    respond_to do |format|
      format.html { redirect_to admin_news_index_path, notice: "News post was successfully destroyed." }
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

    def authorize_news_posts
      authorize! :manage, NewsPost
    end
end
