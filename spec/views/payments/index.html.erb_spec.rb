require 'rails_helper'

RSpec.describe 'payments/index', type: :view do
  before(:each) do
    assign(:payments, [
             Payment.create!(
               author_id: 'Author',
               name: 'Name',
               amount: 2.5,
               user: nil,
               group: nil
             ),
             Payment.create!(
               author_id: 'Author',
               name: 'Name',
               amount: 2.5,
               user: nil,
               group: nil
             )
           ])
  end

  it 'renders a list of payments' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Author'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
