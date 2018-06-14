When(/^I Create blog post$/) do
  @post = Post.new
  create_post_positive(user: @user, post: @post)
end

Then(/^I Check if blog post is created$/) do
  check_if_post_exists(user: @user, post: @post)
end

When(/^I Change blog post title$/) do
  change_blog_post_title(user: @user, post: @post)
end

Then(/^I Check if blog post title is changed/) do
  check_if_post_exists(user: @user, post: @post)
end
