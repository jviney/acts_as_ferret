require File.dirname(__FILE__) + '/../test_helper'

class SpecialContentTest < Test::Unit::TestCase
  include Ferret::Index
  include Ferret::Search
  fixtures :contents, :comments

  def setup
    ContentBase.rebuild_index
    Comment.rebuild_index
  end
  
  def test_class_index_dir
    assert_equal "#{RAILS_ROOT}/index/test/content_base", SpecialContent.class_index_dir
  end

  def test_find_by_contents
    contents_from_ferret = SpecialContent.find_by_contents('single table')
    assert_equal 1, contents_from_ferret.size
    assert_equal ContentBase.find(3), contents_from_ferret.first
    contents_from_ferret = SpecialContent.find_by_contents('title')
    assert contents_from_ferret.empty?
    
  end
end