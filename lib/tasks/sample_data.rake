namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_posts
  end
end

def make_posts
  sean = User.find_by email: 'seankwn@live.com'
  10.times do
    header = Faker::Lorem.sentence(5)
    content = Faker::Lorem.paragraphs(3)
    user_id = sean.id
    genre_id = 1
    Post.create!(header: header.to_s,
                content: content.to_s,
                user_id: user_id,
                genre_id: genre_id)
  end
end
