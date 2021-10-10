package dao;

import vo.CartProduct;
import vo.Product;

import java.util.List;

public interface CartDao {
    public void CartClear(String customer);
    public void AddToCart(Product product, String num, String customer);
    public List<CartProduct> CheckCart(String customer);
    public void CartDelete(String customer,String productID);
    public void CartUpdate(String customer,String productID,Integer num);
}
