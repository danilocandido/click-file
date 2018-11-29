FactoryBot.define do
  factory :file_system do
    file  { true }

    factory :file do
      name { nil }
      attached_file { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-image.png'), 'image/png') }
    end

    factory :folder, aliases: [:directory] do
      name { "music_folder" }
      file  { false }
    end
  end
end
