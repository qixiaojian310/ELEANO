package dao.impl;

import vo.CartProduct;
import vo.Catagory;
import vo.OrderMessage;
import vo.Product;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import dao.ProductDAO;
import utils.JdbcUtils;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {
    public List<Product> ShowList(){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from item";
        List<Product> productList = null;
        try {
            productList = runner.query(sql, new BeanListHandler<Product>(Product.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }
    public List<Product> ShowList(String catagory){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from item where superclass = ?";
        List<Product> productList = null;
        try {
            productList = runner.query(sql, new BeanListHandler<Product>(Product.class),catagory);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }
    public List<Product> searchByName(String name){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from item where name like \"%\"?\"%\"";

        List<Product> productList = null;
        try {
            productList = runner.query(sql, new BeanListHandler<Product>(Product.class),name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
    public List<Product> searchByFilter(String s1,String s2){
        //准备所有商品的数据 ---- List<Product>
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from item where price between ? and ?";
        Integer i1 = Integer.parseInt(s1);
        Integer i2 = Integer.parseInt(s2);
        List<Product> productList = null;
        try {
            productList = runner.query(sql, new BeanListHandler<Product>(Product.class),i1,i2);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
    public Product showProduct(String pid){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from item where Iid = ?";
        Product product = null;
        try {
             product = (Product) runner.query(sql, new BeanHandler<>(Product.class),pid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(product);
        return product;
    }


    public List<Catagory> GetCatagory(){
        //准备所有商品的数据 ---- List<Product>
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "SELECT superclass AS name, COUNT(*) AS num FROM mydb.item group by superclass";
        List<Catagory> CatagoryList = null;
        try {
            CatagoryList = runner.query(sql, new BeanListHandler<Catagory>(Catagory.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return CatagoryList;
    }
    public List<Product> SearchByOtime(){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "SELECT * FROM item ORDER BY Ltime DESC;";
        List<Product> ProductList = null;
        try {
            ProductList = runner.query(sql, new BeanListHandler<Product>(Product.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ProductList;
    }
    public List<Product> HLPrice(){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "SELECT * FROM item ORDER BY price DESC;";
        List<Product> ProductList = null;
        try {
            ProductList = runner.query(sql, new BeanListHandler<Product>(Product.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ProductList;
    }
    public List<Product> LHPrice(){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "SELECT * FROM item ORDER BY price;";
        List<Product> ProductList = null;
        try {
            ProductList = runner.query(sql, new BeanListHandler<Product>(Product.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ProductList;
    }
    public List<Product> IndexProduct(){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from item LIMIT 5;";
        List<Product> ProductList = null;
        try {
            ProductList = runner.query(sql, new BeanListHandler<Product>(Product.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ProductList;
    }
}
