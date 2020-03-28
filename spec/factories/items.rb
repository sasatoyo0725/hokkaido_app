FactoryBot.define do
  factory :item do
    sequence(:description) { |n| "this place is one of my favarite place#{n}"}
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'spec/factories/test.jpg') ] }  #json型で画像を保存するときは[]でデータを囲む・配列にしていないと入力エラーが発生する
    association :user
  end
end
