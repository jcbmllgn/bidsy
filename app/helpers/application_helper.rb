module ApplicationHelper

  def login_path( service )
    "/auth/singly?service=#{service}"
  end

end
