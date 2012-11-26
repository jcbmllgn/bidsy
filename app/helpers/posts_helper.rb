module PostsHelper

  # Creates a field with data-field="field"
  def post_field( post, field, tag, &block )
    if post.new_record?
      value = capture(&block) if block_given?
    else
      value = post.send field
    end
    d = "data-field='#{field}'"
    "<#{tag} #{d} class='post-field input'>#{value}</#{tag}>".html_safe
  end

  # Creates a detail field with data-field="details[field]"
  def post_detail( post, field )
    d = "data-field='details[#{field}]'"
    k = "<p>#{field.to_s.humanize}:</p>"

    if post.new_record?
      value = "Edit this"
    else
      value = post.details.send :[], field
    end
    v = "<p #{d} class='post-field input'>#{value}</p>"

    "<div class='detail'>#{k} #{v}</div>".html_safe
  end

end
