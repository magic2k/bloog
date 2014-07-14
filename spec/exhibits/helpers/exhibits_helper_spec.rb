require_relative '../spec_helper_lite'
require_relative '../app/helpers/exhibits_helper'

stub_class 'PicturePostExhibit'
stub_class 'TextPostExhibit'
stub_class 'Post'

describe ExhibitsHelper do
  subject { Object.new }
  before do
    subject.extend ExhibitsHelper
    @context = stub!
  end

  it "decorates picture posts with a PicturePostExhibit" do
    post = Post.new
    stub(post).picture?{true}
    subject.exhibit(post, @context).must_be_kind_of(PicturePostExhibit)
  end
end
