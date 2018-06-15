League.create!(
  name: "World_Cup"
)

Team.create!(
  name: "Doi_tuyen_duc"
)

Team.create!(
  name: "Doi_tuyen_Phap"
)

Match.create!(
  league_id: 1,
  team_id_1: 1,
  team_id_2: 2,
  point_team_1: 1,
  point_team_2: 2,
  live: 1,
  name: "Duc-Phap",
  start_time: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"),
  end_time: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M"),
  information: "Ghi ban phut thu 5,  1-0 cho doi tuyen duc"
)

User.create!(
  name: "Truong Nguyen",
  email: "truognv15@gmail.com",
  address: "Truong Yen Chuong My Ha Noi",
  phone_number: 1131231231,
  password: "12345678",
  password_confirmation: "12345678",
  is_admin: true,
  confirmed_at: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M")
)

User.create!(
  name: "Ngoc Quang",
  email: "testofngoc@gmail.com",
  address: "Truong Yen Chuong My Ha Noi",
  phone_number: 1131231231,
  password: "12345678",
  password_confirmation: "12345678",
  is_admin: true,
  confirmed_at: DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M")
)

ChatRoom.create!(
  name: "aquarium",
  match_id: 1
)
