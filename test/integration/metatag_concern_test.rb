require "test_helper"

array_of_hashes = [

  {
    factory: nil,
    controller: "static",
    url: "home_url",
    slug: nil,
    title: "Bacchan.al"
  }, {

    factory: "winery",
    controller: "wineries",
    url: "wineries_url",
    name: "Fathers & Daughters Cellars",
    title: "Fathers & Daughters Cellars"
  }
]

array_of_hashes.each do |hash|

  # describe eval(hash[:controller].to_s.capitalize + "metatag Integration") do
  describe "MetaTagConcern Integration Test" do

    Given { create(:org, name: "Bacchan.al") }

    describe "meta tags" do

      if hash[:factory]
        Given { create(hash[:factory].singularize, name: hash[:name]) }
        Given { get eval("#{hash[:url]}"), params: { id: hash[:name].parameterize } }
      else
        Given { get eval("#{hash[:url]}") }
      end

      Then { assert_response 200 }
    end
  end
end

#   describe StaticController do

#     Given(:winery) { create(:winery_with_wines) }


#     describe "title" do

#       describe "home page" do

#         When { get :home }
#         Then { assert_response :success }
#       end

#       describe "winery page" do

#         When { get '/wineries/#{winery.slug}', controller: "wineries" }
#         Then { assert_response :success }
#       end
#     end
#   end
# end

#   Given(:user)      { FactoryGirl.create(:user) }
#   Given(:article)   { FactoryGirl.create(:article) }
#   Given(:winery_1)  { FactoryGirl.create(:winery) }
#   Given(:winery_2)  { FactoryGirl.create(:winery) }
#   Given(:comment)   { FactoryGirl.create(:comment) }
#   Given(:referer)   { "http://localhost:3000/wineries/#{winery_1.slug}" }
#   Given(:article_referer)   { "http://localhost:3000/wineries/#{winery_1.slug}/articles/#{article.slug}" }

#   Given { sign_in user }

#   Given(:make_request) {
#     post :create, comment: {
#       commentable_id: winery_1.id,
#       commentable_type: winery_1.class,
#       content: comment.content } }

#   describe "must identify" do

#     describe "parent resource" do

#       Given { @request.env['HTTP_REFERER'] = referer }
#       When  { make_request }
#       # Then  { assert_not_nil assigns :commentable }
#     end

#     describe "child resource" do

#       Given { @request.env['HTTP_REFERER'] = article_referer }
#       When  { make_request }

#       # Then  { assert_not_nil assigns :commentable }
#     end
#   end
# end

