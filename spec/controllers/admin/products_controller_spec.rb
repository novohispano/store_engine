require 'spec_helper'

describe Admin::ProductsController do
  def valid_attributes
    { name:        "Awesome Product", 
      description: "This is my product description.",
      price:       124.99,
      quantity:    3,
      featured:    true,
      active:      true }
  end

  let!(:customer) { Fabricate(:customer) }

  before(:each) do
   Category.new(name: "Some category", description: "Cat desc").save
   @category = Category.find_by_name("Some category")
   login_customer_post("admin", "admin")
  end
  
  def valid_session
    { user_id: 1 }
  end

  describe "GET index" do
    it "assigns all products as @products" do
      product = Product.create! valid_attributes
      get :index, {}, valid_session
      assigns(:products).should eq([product])
    end
  end

  describe "GET new" do
    it "assigns a new product as @product" do
      get :new, {}, valid_session
      assigns(:product).should be_a_new(Product)
    end
  end

  describe "GET edit" do
    it "assigns the requested product as @product" do
      product = Product.create! valid_attributes
      get :edit, {:id => product.to_param}, valid_session
      assigns(:product).should eq(product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, {:product => valid_attributes}, valid_session
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, {:product => valid_attributes}, valid_session
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "redirects to the created product" do
        post :create, {:product => valid_attributes}, valid_session
        response.should redirect_to(admin_products_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        Product.any_instance.stub(:save).and_return(false)
        post :create, {:product => {  }}, valid_session
        assigns(:product).should be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        Product.any_instance.stub(:save).and_return(false)
        post :create, {:product => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product" do
        product = Product.create! valid_attributes
        Product.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => product.to_param, :product => { "these" => "params" }}, valid_session
      end

      it "assigns the requested product as @product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => valid_attributes}, valid_session
        assigns(:product).should eq(product)
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => valid_attributes}, valid_session
        response.should redirect_to(admin_products_path)
      end
    end

    describe "with invalid params" do
      it "assigns the product as @product" do
        product = Product.create! valid_attributes
        Product.any_instance.stub(:save).and_return(false)
        put :update, {:id => product.to_param, :product => {  }}, valid_session
        assigns(:product).should eq(product)
      end

      it "re-renders the 'edit' template" do
        product = Product.create! valid_attributes
        Product.any_instance.stub(:save).and_return(false)
        put :update, {:id => product.to_param, :product => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  # describe "DELETE destroy" do
  #   it "destroys the requested product" do
  #     product = Product.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => product.to_param}, valid_session
  #     }.to change(Product, :count).by(-1)
  #   end

  #   it "redirects to the products list" do
  #     product = Product.create! valid_attributes
  #     delete :destroy, {:id => product.to_param}, valid_session
  #     expect(response).to redirect_to(products_path)
  #   end
  # end
end