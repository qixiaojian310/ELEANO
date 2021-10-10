package dao.impl;

import dao.OrderDAO;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.JdbcUtils;
import vo.CartProduct;
import vo.OrderMessage;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {
    public List<OrderMessage> CheckTotalOrder(String customer) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "SELECT * FROM my_order WHERE customer_customerID = ?";
        List<OrderMessage> OrderList = null;
        try {
            OrderList = runner.query(sql, new BeanListHandler<>(OrderMessage.class), customer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return OrderList;
    }
    public void OrderItem(CartProduct product, Integer num, String customer, Integer Oid){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "INSERT INTO item_order  VALUES (?, ?, ?, ?, ? ,?)";

        try {
            runner.update(sql,product.getIid(),Oid,"001",product.getIname(),product.getNum(),product.getIprice());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Integer My_Order(OrderMessage om,String customer,Integer price) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "INSERT INTO my_order (customer_customerID,address,price,Otime,Fname,Lname,phone) " +
                "VALUES (?,?,?,?,?,?,?)";
        String sql_1 = "SELECT max(Oid) FROM my_order where customer_customerID = ?";
        Date date = new Date(System.currentTimeMillis());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Integer Oid = null;
        try {
            runner.update(sql, customer, om.getAddress(), price, formatter.format(date), om.getfName(), om.getlName(), om.getPhone());
            Oid = runner.query(sql_1, new ScalarHandler<>(), customer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Oid;
    }
    public OrderMessage CheckOrder(String customer,Integer Oid) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "SELECT * FROM my_order WHERE customer_customerID = ? AND Oid = ?";

        OrderMessage Order = null;
        try {
            Order = runner.query(sql, new BeanHandler<>(OrderMessage.class), customer,Oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Order;
    }
    public List<CartProduct> CheckOrderItem(Integer Oid) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "SELECT * FROM item_order WHERE Oid = ?";

        List<CartProduct> ProductList = null;
        try {
            ProductList = runner.query(sql, new BeanListHandler<>(CartProduct.class), Oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ProductList;
    }
    public void ChangeOrder(OrderMessage om,String customer,Integer Oid){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "UPDATE my_order SET address=?,Fname=?,Lname=?,phone=? WHERE customer_customerID = ? AND Oid = ?";
        try {
            runner.update(sql,om.getAddress(),om.getfName(),om.getlName(),om.getPhone(),customer,Oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void CancelOrder(Integer Oid,String customer){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql_1 = "DELETE FROM item_order WHERE Oid = ?";
        String sql = "DELETE FROM my_order WHERE Oid = ? AND customer_customerID =?";
        try {
            runner.update(sql_1,Oid);
            runner.update(sql,Oid,customer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
