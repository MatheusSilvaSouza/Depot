require 'test_helper'

class ItensGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itens_group = itens_groups(:one)
  end

  test "should get index" do
    get itens_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_itens_group_url
    assert_response :success
  end

  test "should create itens_group" do
    assert_difference('ItensGroup.count') do
      post itens_groups_url, params: { product_id: products(:ruby).id }
    end

    follow_redirect!

    assert_select 'h2', 'Your Cart'
    assert_select 'td', "Programming Ruby 1.9"
  end

  test "should show itens_group" do
    get itens_group_url(@itens_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_itens_group_url(@itens_group)
    assert_response :success
  end

  test "should update itens_group" do
    patch itens_group_url(@itens_group), params: { itens_group: { product_id: @itens_group.product_id } }
    assert_redirected_to itens_group_url(@itens_group)
  end

  test "should destroy itens_group" do
    assert_difference('ItensGroup.count', -1) do
      delete itens_group_url(@itens_group)
    end

    assert_redirected_to itens_groups_url
  end
end
