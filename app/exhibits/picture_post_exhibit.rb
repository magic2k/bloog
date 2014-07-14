require 'delegate'
class PicturePostExhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    # sets underlying object for simple_delegator
    super(model)
  end

  def render_body
    @context.render(partial: "/posts/picture_body", locals: {post: self})
  end

end