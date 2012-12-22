require 'spec_helper'

describe "Posts", :type => :controller do
  it "shows all the posts" do
    login
    create(:user)
    create(:post, title: 'first post')
    visit posts_path
    save_and_open_page
    page.should have_content('first post')
  end
end
