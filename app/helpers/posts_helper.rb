module PostsHelper
  def form_title
      @post.new_record? ? "Publicar POST" : "Modificar POST"
  end
end
