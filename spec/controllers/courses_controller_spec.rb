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

  describe '#edit' do
    before { get :edit, id: course.id }

    context 'render_views' do
      render_views
      it { expect(response).to render_template(:edit) }
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
    let!(:course) { FactoryGirl.create(:course) }
    subject(:do_destroy) { delete :destroy, id: course  }

    it { is_expected.to redirect_to action: :index }
  end

end
