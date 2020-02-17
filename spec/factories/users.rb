FactoryBot.define do

  factory :user do
    # id                      {1}
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    first_name             {"馬場"}
    first_name_kana        {"バンバ"}
    last_name              {"健二"}
    last_name_kana         {"ケンジ"}
    birth_year              {"1980"}
    birth_month            {"1"}
    birth_day               {"1"}
  end

end