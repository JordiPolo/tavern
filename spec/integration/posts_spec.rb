require 'spec_helper'

describe "Posts", :type => :integration do
  it "shows all the posts" do
    login
    user = create(:user)
    create(:post, title: 'first post')
    AuthenticationHelper.stub!(:current_user).and_return(create(:user))
    visit posts_path
    #save_and_open_page
    page.should have_content('first post')
  end
end
