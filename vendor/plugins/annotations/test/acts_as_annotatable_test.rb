require File.dirname(__FILE__) + '/test_helper.rb'

class ActsAsAnnotatableTest < Test::Unit::TestCase
  def test_has_many_annotations_association
    assert_equal 5, books(:h).annotations.length
    assert_equal 5, books(:r).annotations.length
    assert_equal 2, chapters(:bh_c10).annotations.length
    assert_equal 4, chapters(:br_c2).annotations.length
  end
  
  def test_with_annotations_with_attribute_name_and_value_class_method
    bks = Book.with_annotations_with_attribute_name_and_value("Tag", "Amusing rhetoric")
    assert_equal 1, bks.length
    assert_kind_of Book, bks[0]
    
    crs = Chapter.with_annotations_with_attribute_name_and_value("title", "Ruby Hashes")
    assert_equal 1, crs.length
    assert_kind_of Chapter, crs[0]
    
    assert_equal 0, Book.with_annotations_with_attribute_name_and_value("xyz", "This does not exist!").length
  end
  
  def test_find_annotations_for_class_method
    assert_equal 5, Book.find_annotations_for(books(:h).id).length
    assert_equal 5, Book.find_annotations_for(books(:r).id).length
    assert_equal 2, Chapter.find_annotations_for(chapters(:bh_c10).id).length
    assert_equal 4, Chapter.find_annotations_for(chapters(:br_c2).id).length 
  end
  
  def test_find_annotations_by_class_method
    assert_equal 3, Book.find_annotations_by("User", users(:jane)).length
    assert_equal 1, Book.find_annotations_by("Group", groups(:sci_fi_geeks)).length
    assert_equal 3, Chapter.find_annotations_by("User", users(:john)).length
    assert_equal 2, Chapter.find_annotations_by("Group", groups(:classical_fans)).length
  end
  
  def test_latest_annotations_instance_method
    assert_equal 5, books(:h).latest_annotations.length
    assert_equal 2, chapters(:bh_c10).latest_annotations.length
    
    assert_equal 2, books(:h).latest_annotations(2).length
  end
  
  def test_annotations_with_attribute_instance_method
    assert_equal 2, books(:h).annotations_with_attribute("tag").length
    assert_equal 0, books(:r).annotations_with_attribute("doesnt_exist").length
    assert_equal 1, chapters(:bh_c10).annotations_with_attribute("endingType").length
    assert_equal 1, chapters(:br_c202).annotations_with_attribute("Title").length
  end
  
  def test_annotatable_name_instance_method
    assert_equal "Learning Ruby in 2 Seconds", books(:r).annotatable_name
    assert_equal "Hashing It Up", chapters(:br_c2).annotatable_name
  end
  
  def test_adding_of_annotation
    ch = chapters(:bh_c10)
    assert_equal 2, ch.annotations.length
    ann1 = ch.annotations << Annotation.new(:attribute_id => AnnotationAttribute.find_or_create_by_name("tag").id, 
                                            :value => "test", 
                                            :source_type => "User", 
                                            :source_id => 1)
                                           
    ann2 = ch.annotations << Annotation.new(:attribute_name => "description", 
                                            :value => "test2", 
                                            :source_type => "User", 
                                            :source_id => 2)
                                           
    assert_not_nil(ann1)
    assert_not_nil(ann2)
    assert_equal 4, ch.annotations(true).length
  end
end
