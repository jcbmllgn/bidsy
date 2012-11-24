module PostsHelper

  def editable_area( tag, id )
    if block_given?
      "<#{tag} class='editable' id='#{id}' contenteditable>" + yield  + "</#{tag}>".html_safe
    else
      "<#{tag} class='editable' id='#{id}' contenteditable></#{tag}>".html_safe
    end
  end

end
