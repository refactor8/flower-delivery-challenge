# Feature: Order placement
#   As a customer
#   I want to place an order
#   So I can buy and send flowers
feature 'Order management' do
  # Scenario: Customer creates a new order
  #   Given I am a customer
  #   When I place an order
  #   Then I see "Order saved"
  scenario 'Customer creates a new order' do
    Capybara.ignore_hidden_elements = false
    visit root_path

    within '#new_order' do
      fill_in 'Recipient name', with: 'Alice'
      fill_in 'Delivery on', with: "07/07/2018"
      choose 'Alice (£20.00)'
      choose 'Standard Delivery'
    end

    click_button 'Order'
    expect(page).to have_content 'Order saved'
  end
end
