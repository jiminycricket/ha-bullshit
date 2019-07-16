if Rails.env.development? || Rails.env.test?
  require "factory_bot"

  namespace :dev do
    desc "Sample data for local development environment"
    task fake: "db:setup" do
      include FactoryBot::Syntax::Methods
      100.times do
      	create(:bullshit, content: Faker::Quote.yoda)
      end
      # create(:user, email: "user@example.com", password: "password")
    end
  end
end
