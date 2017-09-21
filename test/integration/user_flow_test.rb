require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user_for_tests = users(:user_for_tests)
    @test_movie = movies(:test_movie)
  end

  test 'sign up' do
    post user_registration_path, params:
      { 'user[email]' => 'email@example.com',
        'user[password]' => 'password',
        'user[password_confirmation]' => 'password' }

    assert_redirected_to root_path


    assert User.find_by_email('email@example.com')
  end

    test 'fail sign up' do
    post user_registration_path, params:
      { 'user[email]' => 'email@example.com',
        'user[password]' => 'password',
        'user[password_confirmation]' => 'password1' }

    assert_response :success # Controller didn't redirect to root_path
  end


  test 'sign in and write an article' do
    post user_session_path, params:
      { 'user[email]' => @user_for_tests.email,
        'user[password]' => 'password' }

    assert_redirected_to root_path

    post '/movies', params: { 'movie[title]' => "Cloud atlas", 'movie[descroption]' => 'Cloud Atlas is a 2012', 'movie[movie_length]' => '171', 'movie[director]' => "Warner Bros. Pictures ", 'movie[rating]' => "7.7", 'movie[image_file_name]' => "Cloud_atlas", 'movie[trailer]' => "https://www.youtube.com/embed/K2VtiZSvwuo"}
    

    assert Movie.where(author_id: @user_for_tests.id, title: "Cloud atlas")
  
  end

  test 'sign in, create movie and write a review' do
    post user_registration_path, params:
      { 'user[email]' => 'email@example.com',
        'user[password]' => 'password',
        'user[password_confirmation]' => 'password1' }

    post '/movies', params: { 'movie[title]' => "Cloud atlas", 
    	'movie[descroption]' => 'Cloud Atlas is a 2012', 
    	'movie[movie_length]' => '171', 
    	'movie[director]' => "Warner Bros. Pictures ", 
    	'movie[rating]' => "7.7", 'movie[image_file_name]' => "Cloud_atlas", 
    	'movie[trailer]' => "https://www.youtube.com/embed/K2VtiZSvwuo"}

    assert Movie.where(author_id: @user_for_tests.id, title: "Cloud atlas")
  
    

    post '/movies/'+ @test_movie.id.to_s+'/reviews', params:
      { 'review[comment]' => "Awesome!!",
        'review[rating]' => 4 ,
    	'review[user_id]' => @user_for_tests.id,
    	'review[movie_id]' => @test_movie.id}

    assert Review.where(comment: "Awesome!!", rating: 4, user_id: @user_for_tests.id, movie_id: @test_movie.id)
  end

end
