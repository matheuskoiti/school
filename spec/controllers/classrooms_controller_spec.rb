require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  let!(:student) { FactoryGirl.create(:student) }
  let!(:course) { FactoryGirl.create(:course) }
  let!(:classroom) { FactoryGirl.create(:classroom, student_id: student.id, course_id: course.id) }
  
  describe '#new' do
    before { get :new }

    context 'renders' do
      render_views
      it { expect(response).to render_template(:new) }
    end
  end

  describe '#create' do
    it "creates a new classroom" do
      expect{
        post :create, classroom: FactoryGirl.attributes_for(:classroom)
      }.to change(Classroom,:count).by(1)
    end
  end

  describe '#show' do
    before { get :show, id: classroom.id }

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
    let!(:classroom_delete) { FactoryGirl.create(:classroom) }
    subject(:do_destroy) { delete :destroy, id: classroom_delete  }

    it { is_expected.to redirect_to action: :index }

    it "deletes the classroom" do
      expect{
        delete :destroy, id: classroom_delete        
      }.to change(Classroom,:count).by(-1)
      
    end
  end
end
