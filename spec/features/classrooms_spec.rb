require 'rails_helper'

feature "Classroom", type: :feature do
  
  describe '#create' do
    context 'when visiting :new' do
      before { visit new_classroom_path }

      it 'creates a course', js: true do
        within 'form#new_classroom' do
          find('#classroom_student_id option:nth-child(2)').select_option
          find('#classroom_course_id option:nth-child(2)').select_option
        end

        expect{
          click_button("Cadastrar")
        }.to change(Classroom,:count).by(1)

        expect(page).to have_content("Matrícula realizada com sucesso.")
      end
    end
  end

end