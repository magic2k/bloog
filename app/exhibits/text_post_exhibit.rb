require 'delegate'
class TextPostExhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    # sets underlying object for simple_delegator
    super(model)
  end

  def render_body
    @context.render(partial: "/posts/text_body", locals: {post: self})
  end

end