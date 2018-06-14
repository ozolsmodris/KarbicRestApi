def create_post_positive(user:, post:)
  payload = {
    title: Time.new.to_i.to_s,
    content: Time.new.to_i.to_s
  }.to_json
  header = { 'Content-type' => 'application/json',
             authorization: user.auth_token }
  response = API.post('http://195.13.194.180:8090/api/post',
                      headers: header,
                      payload: payload)

  # Check if response 200 OK
  assert_status_code(200, response, 'Post create')
  resp = JSON.parse(response)
  post.id = resp['id']
  post.title = resp['title']
  post.content = resp['content']
  post.created_at = resp['createdAt']
  post.updated_at = resp['updated_at']
end

def change_blog_post_title(user:, post:)
  payload = {
    title: "#{post.title} + Changed + #{Time.new.to_i}}"
  }.to_json
  header = { 'Content-type' => 'application/json',
             authorization: user.auth_token }
  response = API.post('http://195.13.194.180:8090/api/post',
                      headers: header,
                      payload: payload)

  # Check if response 200 OK
  assert_status_code(200, response, 'Post updated')
  resp = JSON.parse(response)
  post.id = resp['id']
  post.title = resp['title']
  post.content = resp['content']
  post.created_at = resp['createdAt']
  post.updated_at = resp['updated_at']
end

def check_if_post_exists(user:, post:)
  header = { 'Content-type' => 'application/json',
             authorization: user.auth_token }
  response = API.get("http://195.13.194.180:8090/api/post?id=#{post.id}",
                     headers: header,
                     cookies: {})

  # Check if response 200 OK
  assert_status_code(200, response, 'Post found')
  resp = JSON.parse(response)
  assert_equal(post.id, resp['id'], "Post id doesn't match")
  assert_equal(post.title, resp['title'], "Post title doesn't match")
  assert_equal(post.content, resp['content'], "Post content doesn't match")
end
