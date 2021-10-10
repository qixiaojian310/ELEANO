package dao;

import vo.CartProduct;
import vo.Catagory;
import vo.OrderMessage;
import vo.Product;

import java.util.List;

public interface ProductDAO {
    public List<Product> ShowList();
    public List<Product> ShowList(String catagory);
    public List<Product> searchByName(String name);
    public List<Product> searchByFilter(String s1,String s2);
    public Product showProduct(String pid);
    public List<Catagory> GetCatagory();
    public List<Product> SearchByOtime();
    public List<Product> HLPrice();
    public List<Product> LHPrice();
    public List<Product> IndexProduct();
}
