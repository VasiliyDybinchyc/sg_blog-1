10.times do |n|
  Post.create(title: "a_#{n}", body: "AAAA")
end
