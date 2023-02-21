require 'rails_helper'

RSpec.describe 'payments/show', type: :view do
  before(:each) do
    assign(:payment, Payment.create!(
                       name: 'Name',
                       amount: 2.5,
                       user: nil,
                       category: nil
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
