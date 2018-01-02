FactoryBot.define do
  factory :notification do
    phone "5555555555"
    body "My message"
    source_app "some_app"
  end

  factory :second_notification, class: 'Notification' do
    phone "4444444444"
    body "Another notification"
    source_app "some_app"
  end

  factory :outside_notification, class: 'Notification' do
    phone "3333333333"
    body "Third notification"
    source_app "different_app"
  end
end