require 'test_helper'

class MovieTest < ActiveSupport::TestCase
    
  test 'should not save empty' do
    movie = Movie.new
    assert !movie.save
  end

  test 'should not save with unexist user' do
  movie = movies(:test_movie)
   movie.user_id = nil
    assert !movie.save
  end

  test 'should not save with unexist rating' do
      movie = movies(:test_movie)
   movie.rating = nil
    assert !movie.save
  end

  test 'should not save with unexist image' do
      movie = movies(:test_movie)
   movie.image_file_name = nil
    assert !movie.save
  end

  test 'should not save with unexist title' do
      movie = movies(:test_movie)
   movie.title = nil
    assert !movie.save
  end


  
  test 'should not save with unexist description' do
      movie = movies(:test_movie)
   movie.descroption = nil
    assert !movie.save
  end

  test 'should not save with unexist director' do
      movie = movies(:test_movie)
   movie.director = nil
    assert !movie.save
  end

    test 'should not save with unexist movie length ' do
   movie = movies(:test_movie)
   movie.movie_length = nil
    assert !movie.save
  end
  
  test 'should  save ' do
   movie = Movie.new do |movie|
      movie.title = "Cloud atlas"
      movie.descroption = 'Cloud Atlas is a 2012'
      movie.movie_length = '171'
      movie.director = "Warner Bros. Pictures "
      movie.rating = "7.7"
      movie.image_file_name = "Cloud_atlas"
      movie.trailer = "https://www.youtube.com/embed/K2VtiZSvwuo"
      movie.image_content_type = "image/jpeg"
      movie.image_file_size = 186387
      movie.image_updated_at = "2016-12-10 23:26:51"
      movie.user_id = users(:user_for_tests).id
    end
    assert movie.save
  end

end
