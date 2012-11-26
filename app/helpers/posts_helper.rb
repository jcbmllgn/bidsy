module PostsHelper

  def post_field( post, value, tag, &block )
    if post.new_record?
      value = capture(&block) if block_given?
    else
      value = post.send(value)
    end
    "<#{tag} class='post-field input'>#{value}</#{tag}>".html_safe
  end

end
