def login_positive(user:)
  payload = {
    email: user.email,
    password: user.password
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/login',
                      payload: payload)

  # Check if response 200 OK
  assert_status_code(200, response, 'Login')
  resp = JSON.parse(response)
  # Check if correct user is returned
  assert_equal(user.email, resp['email'], "Resp email #{resp['email']} doesn't match #{user.email}")
  user.firstname = resp['firstName']
  user.lastname = resp['lastName']
  user.id = resp['id']
  user.auth_token = response.headers[:authorization]
end

def login_negative(user:)
  payload = {
    email: user.email,
    password: user.password
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/login',
                      payload: payload)

  # Check if response 401 forbidden
  assert_equal(401, response.code, "Resonse code is not correct #{response}")

  resp = JSON.parse(response)
  assert_status_code(401, response, 'Login with wrong password')
  user.firstname = resp['firstName']
  user.lastname = resp['lastName']
  user.id = resp['id']
  user.auth_token = response.headers[:authorization]
end

def check_if_not_logged_in(user:)
  response = API.get('http://195.13.194.180:8090/api/profile',
                     headers: { authorization: user.auth_token })

  resp = JSON.parse(response)
  # Check if response 403 OK
  assert_status_code(403, response, 'Getting user info without valid auth')
  # Check if first name correct
  assert_equal('Access Denied', resp['message'], "Message not 'Access Denied' #{response}")
end
