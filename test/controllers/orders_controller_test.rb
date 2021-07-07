require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "shouldn't save empty order" do
    order = Order.new
    assert_not order.save, 'Saved empty order'
  end

  test "shouldn't save order with incorrect fields" do
    assert_raises(ActiveModel::UnknownAttributeError) do
      order = Order.new({ name: 'name', s_name: 'sname', patronymic: 'patronymic', phone: '+71111111111',
                          email: 'temp@temp.su', summary: '1', length: '1', width: '1', height: '1',
                          dep_address: '.', arr_address: '.' })
    end
  end

  test "shouldn't save order without all fields" do
    order = Order.new({ name: 'name', s_name: 'sname', patronymic: 'patronymic', phone: '+71111111111',
                        email: 'temp@temp.su', weight: '1', length: '1', width: '1', height: '1',
                        dep_address: '.'})
    assert_not order.save, 'Saved order without all fields'
  end
end
