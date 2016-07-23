require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:link) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_scheme_link) }
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LinksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all links as @links" do
      link = FactoryGirl.create(:link)
      get :index, params: {}, session: valid_session
      expect(assigns(:links)).to eq([link])
    end
  end

  describe "GET #show" do
    it "assigns the requested link as @link" do
      link = FactoryGirl.create(:link)
      get :show, params: {id: link.to_param}, session: valid_session
      expect(assigns(:link)).to eq(link)
    end
  end

  describe "GET #new" do
    it "assigns a new link as @link" do
      get :new, params: {}, session: valid_session
      expect(assigns(:link)).to be_a_new(Link)
    end
  end

  describe "GET #edit" do
    it "assigns the requested link as @link" do
      link = FactoryGirl.create(:link)
      get :edit, params: {id: link.to_param}, session: valid_session
      expect(assigns(:link)).to eq(link)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, params: {link: valid_attributes}, session: valid_session
        }.to change(Link, :count).by(1)
      end

      it "assigns a newly created link as @link" do
        post :create, params: {link: valid_attributes}, session: valid_session
        expect(assigns(:link)).to be_a(Link)
        expect(assigns(:link)).to be_persisted
      end

      it "redirects to the created link" do
        post :create, params: {link: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Link.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        post :create, params: {link: invalid_attributes}, session: valid_session
        expect(assigns(:link)).to be_a_new(Link)
      end

      it "re-renders the 'new' template" do
        post :create, params: {link: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:facebook_link) }

      it "updates the requested link" do
      link = FactoryGirl.create(:link)
        put :update, params: {id: link.to_param, link: new_attributes}, session: valid_session
        link.reload
        expect(assigns(:link)).to eq({:slug=>"fb", :destination=>"https://facebook.com"})
      end

      it "assigns the requested link as @link" do
      link = FactoryGirl.create(:link)
        put :update, params: {id: link.to_param, link: valid_attributes}, session: valid_session
        expect(assigns(:link)).to eq(link)
      end

      it "redirects to the link" do
      link = FactoryGirl.create(:link)
        put :update, params: {id: link.to_param, link: valid_attributes}, session: valid_session
        expect(response).to redirect_to(link)
      end
    end

    context "with invalid params" do
      it "assigns the link as @link" do
      link = FactoryGirl.create(:link)
        put :update, params: {id: link.to_param, link: invalid_attributes}, session: valid_session
        expect(assigns(:link)).to eq(link)
      end

      it "re-renders the 'edit' template" do
      link = FactoryGirl.create(:link)
        put :update, params: {id: link.to_param, link: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested link" do
      link = FactoryGirl.create(:link)
      expect {
        delete :destroy, params: {id: link.to_param}, session: valid_session
      }.to change(Link, :count).by(-1)
    end

    it "redirects to the links list" do
      link = FactoryGirl.create(:link)
      delete :destroy, params: {id: link.to_param}, session: valid_session
      expect(response).to redirect_to(links_url)
    end
  end

end
