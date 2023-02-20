require 'rails_helper'

RSpec.describe 'payments/edit', type: :view do
  let(:payment) do
    Payment.create!(
      author_id: 'MyString',
      name: 'MyString',
      amount: 1.5,
      user: nil,
      group: nil
    )
  end

  before(:each) do
    assign(:payment, payment)
  end

  it 'renders the edit payment form' do
    render

    assert_select 'form[action=?][method=?]', payment_path(payment), 'post' do
      assert_select 'input[name=?]', 'payment[author_id]'

      assert_select 'input[name=?]', 'payment[name]'

      assert_select 'input[name=?]', 'payment[amount]'

      assert_select 'input[name=?]', 'payment[user_id]'

      assert_select 'input[name=?]', 'payment[group_id]'
    end
  end
end
