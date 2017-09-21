require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
   
   test 'should not save empty' do
    review = Review.new
    assert !review.save
  end

   test 'should not save without comment  ' do
    review = Review.new do |review|
    	review.rating= 5
    	review.user_id= users(:user_for_tests).id
    	review.movie_id= movies(:test_movie).id
    end
    assert !review.save
  end

  test 'should not save without rating' do
    review = Review.new do |review|
    	review.comment= "Будучи большим"
    	review.user_id= users(:user_for_tests).id
    	review.movie_id= movies(:test_movie).id
    end
    assert !review.save
  end

  test 'should not save withaut movie id' do
    review = Review.new do |review|
    	review.rating= 5    	
    	review.comment= "Будучи большим"
    	review.user_id= users(:user_for_tests).id
    end
    assert !review.save
  end

   test 'should not save without user id' do
    review = Review.new do |review|
    	review.rating= 5    	
    	review.comment= "Будучи большим"
    	review.movie_id= movies(:test_movie).id
    end
    assert !review.save
  end

  test 'should save' do
    review = Review.new do |review|
    	review.rating= 5
    	review.comment= "Будучи большим"
    	review.user_id= users(:user_for_tests).id
    	review.movie_id= movies(:test_movie).id
    end
    assert review.save
  end
  
end
