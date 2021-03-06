require_relative 'features/support/api_helper'
require          'json'

job_name = ARGV[0]
job_number = ARGV[1]

URL = 'https://discordapp.com/api/webhooks/459005793627406359/-6FGK6la-XlTO_UZ2G62Cx-TZ0AwmMqIPd3rBkusV1nwPQo1RlmhAp3Kaxn_gHS85Aqs'
THUMBNAIL = { url: 'http://i0.kym-cdn.com/photos/images/original/000/016/217/CDOYGODMQGJQWKNBO4FAGFFUCUY3LCHS.jpeg' }

fields = []
fields.push(name: 'Author', value: 'Modris Ozols')
fields.push(name: "#{job_name}", value: "#{job_number}")

embed = []
embed.push(title: "Ženkīns", color: 1231232, thumbnail: THUMBNAIL, fields: fields)
payload = {
  embeds: embed
}.to_json
p payload
response = API.post(URL, payload: payload)