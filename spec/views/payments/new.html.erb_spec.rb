require 'rails_helper'

RSpec.describe 'payments/new', type: :view do
  before(:each) do
    assign(:payment, Payment.new(
                       author_id: 'MyString',
                       name: 'MyString',
                       amount: 1.5,
                       user: nil,
                       group: nil
                     ))
  end

  it 'renders new payment form' do
    render

    assert_select 'form[action=?][method=?]', payments_path, 'post' do
      assert_select 'input[name=?]', 'payment[author_id]'

      assert_select 'input[name=?]', 'payment[name]'

      assert_select 'input[name=?]', 'payment[amount]'

      assert_select 'input[name=?]', 'payment[user_id]'

      assert_select 'input[name=?]', 'payment[group_id]'
    end
  end
end
