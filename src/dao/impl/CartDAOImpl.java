package dao.impl;

import dao.CartDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JdbcUtils;
import vo.CartProduct;
import vo.Product;

import java.sql.SQLException;
import java.util.List;

public class CartDAOImpl implements CartDao {
    public void CartClear(String customer){
        //准备所有商品的数据 ---- List<Product>
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "delete from cart where customer_customerID = ?";

        try {
            runner.update(sql,customer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void AddToCart(Product product, String num, String customer){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "INSERT INTO cart (customer_customerID,Iid,Iname,Iprice,num) VALUES(?,?,?,?,?)";
        String sql_1 = "SELECT * from cart where customer_customerID = ? and Iid = ?";
        String sql_2 = "UPDATE cart SET num = ? WHERE customer_customerID = ? and Iid = ?";
        try {
            CartProduct product1 = runner.query(sql_1,new BeanHandler<>(CartProduct.class),customer,product.getIid());
            if (product1==null)
                runner.update(sql,customer,product.getIid(),product.getName(),product.getPrice(),num);
            else
                runner.update(sql_2,product1.getNum()+Integer.parseInt(num),customer,product.getIid());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<CartProduct> CheckCart(String customer){
        //准备所有商品的数据 ---- List<Product>
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from cart where customer_customerID = ?";
        List<CartProduct> productList = null;
        try {
            productList = runner.query(sql, new BeanListHandler<CartProduct>(CartProduct.class),customer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
    public void CartDelete(String customer,String productID){
        //准备所有商品的数据 ---- List<Product>
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "delete from cart where customer_customerID = ? and IiD = ?";

        try {
            runner.update(sql,customer,productID);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public void CartUpdate(String customer,String productID,Integer num){
        //准备所有商品的数据 ---- List<Product>
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "update cart set num=? where customer_customerID = ? and Iid = ?";

        try {
            runner.update(sql,num,customer,productID);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
