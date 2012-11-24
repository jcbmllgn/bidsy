module PostsHelper

  def editable(tag, *args, &block)
    if block_given?
      options      = args.first || {}
      html_options = args.second
      link_to(tag, capture(&block), options, html_options)
    else
      tag          = tag.to_s
      content      = args[0]
      html_options = args[1]

      html_options[:class] = "editable"
      html_options[:contenteditable] = "true"
      tag_options = tag_options(html_options)

      html = "<#{tag} #{tag_options}>#{ERB::Util.html_escape(content)}</#{tag}>"
      html.html_safe
    end
  end

end
