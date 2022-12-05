FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaaa69'}
    password_confirmation {password}
    first_name            {'羽風'}
    last_name             {'薫'}
    first_name_read       {'ハカゼ'}
    last_name_read        {'カオル'}
    birthday              {'19841103'}
  end
end