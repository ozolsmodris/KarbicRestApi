require 'rest-client'

def check_profile_information(user:)
  response = API.get('http://195.13.194.180:8090/api/profile',
                     headers: { authorization: user.auth_token })

  resp = JSON.parse(response)
  # Check if response 200 OK
  assert_status_code(200, response, 'Get profile info')
  # Check if first name correct
  assert_equal(user.firstname, resp['firstName'], "Failed to create new account #{response}")
  # Check if first name correct
  assert_equal(user.email, resp['email'], "Failed to create new account #{response}")
  # Check if id correct
  assert_equal(user.id, resp['id'], "Failed to create new account #{response}")
end
