package dao;

import vo.CartProduct;
import vo.OrderMessage;

import java.util.List;

public interface OrderDAO {
    public OrderMessage CheckOrder(String customer,Integer Oid);
    public void OrderItem(CartProduct product, Integer num, String customer, Integer Oid);
    public Integer My_Order(OrderMessage om,String customer,Integer price);
    public List<OrderMessage> CheckTotalOrder(String customer);
    public List<CartProduct> CheckOrderItem(Integer Oid);
    public void ChangeOrder(OrderMessage om,String customer,Integer Oid);
    public void CancelOrder(Integer Oid,String customer);
}
