require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:course) { FactoryGirl.create(:course) }
  
  describe '#new' do
    before { get :new }

    context 'renders' do
      render_views
      it { expect(response).to render_template(:new) }
    end
  end

  describe '#create' do
    it "creates a new course" do
      expect{
        post :create, course: FactoryGirl.attributes_for(:course)
      }.to change(Course,:count).by(1)
    end
  end

  describe '#edit' do
    before { get :edit, id: course.id }

    context 'render_views' do
      render_views
      it { expect(response).to render_template(:edit) }
    end
  end

  describe '#update' do
    before :each do
      @course = FactoryGirl.create(:course)
    end
  
    context "valid attributes" do
      it "changes @course's attributes" do
        put :update, id: @course, 
          course: FactoryGirl.attributes_for(:course, name: "Curso1")
        @course.reload
        @course.name.should eq("Curso1")
      end
    end
  end
  
  
  describe '#show' do
    before { get :show, id: course.id }

    describe 'renders' do
      render_views
      it { expect(response).to render_template(:show) }
    end
  end

  describe '#index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe '#destroy' do
    let!(:course_delete) { FactoryGirl.create(:course) }
    subject(:do_destroy) { delete :destroy, id: course_delete  }

    it { is_expected.to redirect_to action: :index }

    it "deletes the course" do
      expect{
        delete :destroy, id: course_delete        
      }.to change(Course,:count).by(-1)
      
    end
  end

end
