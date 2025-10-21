class About::NewsPostsController < ApplicationController

  layout "application_front"

  def index
    @news_posts = NewsPost.where(published: true).order(created_at: :desc)
  end

  def show
    @news_post = NewsPost.find(params[:id])

    ## TODO refactor (helper in NewsPost model?)
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
      lax_spacing: true,           # <-- important for lists after paragraphs
      space_after_headers: true,
      superscript: true
    })
    #
    rawmd_html_content = markdown.render(@news_post.content)
    @safe_html_content = Sanitize.fragment(rawmd_html_content, Sanitize::Config::RELAXED).html_safe
  end

end
