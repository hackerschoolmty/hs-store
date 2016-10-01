require 'rails_helper' 

describe ProductsController do

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      expect(response).to be_success
    end

    context "With a current user" do
    
      it "displays all products" do
        products = create_list(:product, rand(2..10), :archive)
        sign_in_as_user
        get :index
        expect(assigns(:products)).to eq(products)
      end
    end

    context "With a guest user" do
      it "displays active products" do
        create_list(:product, 10, :archive)
        active_products = create_list(:product, rand(2..10))
        get :index
        expect(assigns(:products)).to eq(active_products)
      end
    end 
    
    it "render index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET 'new'" do
    before(:each) do
      sign_in_as_user
      get :new
    end

    it "should be success" do
      expect(response).to be_success
    end

    it "should render_template :new" do 
      expect(response).to render_template(:new)
    end

    it "should build a new product" do
      expect(assigns(:product)).to be_a_new Product
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @product = create(:product)
      sign_in_as_user
      get :edit, id: @product
    end

    it "should be success" do
      expect(response).to be_success
    end 

    it "should render template :edit" do
      expect(response).to render_template :edit
    end 

    it "should find the requested product" do
      expect(assigns(:product)).to eq(@product)
    end
  end


  describe "POSt 'create'" do
    before(:each) do
      sign_in_as_user
    end
    
    context "With valid attributes" do
      it "should save a new producto in database" do
        expect {
          post :create, product: attributes_for(:product)
        }.to change(Product, :count).by(1)
      end

      it "redirect to product_path" do
        post :create, product: attributes_for(:product)
        expect(response).to redirect_to product_path(assigns(:product))
      end
    end

    context "With invalid attributes" do
      it "should not save a new product in database" do
         expect {
           post :create, product: attributes_for(:product, name: nil)
        }.to_not change(Product, :count)
      end

      it "should render :new view" do
        post :create, product: attributes_for(:product, name: nil)
        expect(response).to render_template :new
      end
    end
  end


  describe "PUT 'update'" do
    before(:each) do
      sign_in_as_user
      @product = create(:product)
    end

    context "With valid attributes" do
      before(:each) do
        put :update, id: @product, product: { name: "new name" }
        @product.reload
      end

      it "shoul update product attributes"  do
        expect(@product.name).to eq("new name")
      end

      it "should redirect to product path" do
        expect(response).to redirect_to product_path(@product)
      end
    end

    context "With invalid attributes" do
      before(:each) do
        put :update, id: @product, product: { name: nil}
        @product.reload
      end

      it "should not update product attributes" do
        expect(@product.name).to_not be_nil
      end

      it "should render :edit view" do
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      sign_in_as_user
      @product = create(:product)
    end

    it "should delete a product from database" do
      expect{
        delete :destroy, id: @product
      }.to change(Product, :count).by(-1)
    end

    it "should redirect to product list" do
      delete :destroy, id: @product
      expect(response).to redirect_to products_path
    end
  end
  
end
