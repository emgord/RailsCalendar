require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let (:user) do
    User.create(name: "Emily", bio: "Hiya", password: "p", password_confirmation: "p")
  end

  let(:user_params) do
    {
      user:{
        name: "Fred", bio:"A guy", password:"p", password_confirmation: "p"
      }
    }
  end

    describe "User is logged out" do

      describe "GET #index" do
        it "responds successfully with an HTTP 200 status code" do
          get :index
          expect(response).to be_success
          expect(response).to have_http_status(200)
        end
        it "renders the index template" do
          get :index
          expect(response).to render_template("index")
        end
      end

      describe "GET #new" do
        it "responds successfully with an HTTP 200 status code" do
          get :new
          expect(response).to be_success
          expect(response).to have_http_status(200)
        end
        it "renders the new template" do
          get :new
          expect(subject).to render_template :new
        end
      end

      describe "POST #create" do

      end

      describe "GET #show" do

      end

      describe "GET #edit" do

      end

      describe "PATCH #update" do

      end

      describe "DELETE #destroy" do

      end

    end

    describe "User is logged in" do

    before (:each) do
      session[:user_id] = user.id
    end

    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    describe "GET #new" do
      it "is not successful and redirects" do
        get :new
        expect(response).to have_http_status(302)
      end
      it "redirects to the user show page" do
        get :new
        expect(subject).to redirect_to user_path(user)
      end
    end

    describe "POST #create" do

    end

    describe "GET #show" do

    end

    describe "GET #edit" do

    end

    describe "PATCH #update" do

    end

    describe "DELETE #destroy" do

    end
  end
end
