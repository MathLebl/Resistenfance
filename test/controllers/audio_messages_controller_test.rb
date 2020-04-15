require 'test_helper'

class AudioMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get audio_messages_index_url
    assert_response :success
  end

  test "should get show" do
    get audio_messages_show_url
    assert_response :success
  end

  test "should get new" do
    get audio_messages_new_url
    assert_response :success
  end

  test "should get create" do
    get audio_messages_create_url
    assert_response :success
  end

  test "should get destroy" do
    get audio_messages_destroy_url
    assert_response :success
  end

end
