require 'rest-client'

def signup_positive
  payload = {
    firstName: 'Modris',
    lastName: 'Ozols',
    email: 'modris.ozols@testdevlab.com',
    password: 'Parole123'
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/sign-up',
                      payload: payload)

  # Check if response 200 OK
  assert_equal(200, response.code, "Failed to sign up #{response}")
end
