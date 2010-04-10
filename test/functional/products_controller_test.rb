require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  context "as a user" do
    setup do
      @product = Factory.build(:product, :id => 1)
    end

    context "GET the :index" do
      setup do
        get :index
      end

      should_assign_to :products, :class => Array
      should_respond_with :success
      should_render_template :index
      should_not_set_the_flash
    end  

    context "GET to :show" do

      setup do
        get :show, :id => @product.id
      end

      should_assign_to :product, :class => Product
      should_respond_with :success
      should_render_template :show
      should_not_set_the_flash
    end 

    context "GET to :new" do
      setup do
        get :new
      end

      should_assign_to :product, :class => Product
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end   

    context "POST to :create with valid data" do  
      setup do
        post :create, :product => {:name => 'test2', 
                                   :product_type => ProductType.new, 
                                   :supplier => Supplier.new, 
                                   :certifier => Certifier.new,
                                   :units_of_measure => UnitsOfMeasure.new, 
                                   :minimum_quantity => 1, 
                                   :storage_type => StorageType.new, 
                                   :storage_location => StorageLocation.new}
      end

      should_assign_to :product, :class => Product 
      should_respond_with :redirect
      should_redirect_to("index page"){products_path}
      should_set_the_flash_to /successfully created/
    end

    context "GET to :edit" do
      setup do
        get :edit, :id => @product.id
      end

      should_assign_to(:product){@product}
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash

    end

    context "PUT to :update with valid data" do
      setup do
        put :update, :id => @product.id, :product => {}
      end

      should_assign_to(:product){@product}
      should_respond_with :redirect
      should_redirect_to("index page"){products_path}
      should_set_the_flash_to /successfully updated/
    end   
  end 
end



# 
# 
# require 'test_helper'
# 
# class ProductsControllerTest < ActionController::TestCase
#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:products)
#   end
# 
#   test "should get new" do
#     get :new
#     assert_response :success
#   end
# 
#   test "should create product" do
#     assert_difference('Product.count') do
#       post :create, :product => {:name => 'test', :product_type_id => 1, :supplier_id => 1, :product_id => 1, :units_of_measure_id => 1}
#     end
# 
#     assert_redirected_to product_path(assigns(:product))
#   end
# 
#   test "should show product" do
#     get :show, :id => products(:almonds).to_param
#     assert_response :success
#   end
# 
#   test "should get edit" do
#     get :edit, :id => products(:almonds).to_param
#     assert_response :success
#   end
# 
#   # test "should update product" do
#   #   put :update, :id => products(:almonds).to_param, :product => { }
#   #   assert_redirected_to product_path(assigns(:product))
#   # end      
# 
#   test "should destroy product" do
#     assert_difference('Product.count', -1) do
#       delete :destroy, :id => products(:almonds).to_param
#     end
# 
#     assert_redirected_to products_path
#   end
# end
