json.people @people do |person|
  json.id person.id
  json.vs person.vs
  json.type person.legacy_type
  json.member_status person.member_status
  json.supporter_status person.supporter_status
  json.name person.name
  json.first_name person.first_name
  json.last_name person.last_name
  json.email person.email
  json.phone person.phone
  json.domestic_region do
    json.name person.domestic_region.name
  end
  json.domestic_branch do
    json.name person.domestic_branch.try(:name)
  end
end
