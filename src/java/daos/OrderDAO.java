/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import utils.DBConnect;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import dtos.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {
    public ArrayList<OrderDTO> getAllOrder() throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT orderID, orderCreateDate,orderExpectDate,completedDate, cusName, orderPrice, orderAddress, payMethod, orderStatus FROM tblOrders ";

        ArrayList<OrderDTO> lst = new ArrayList<>();

        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                rs = ps.executeQuery();
                
                if(rs != null) System.out.println("rs <> null");
                else System.out.println("rs null");
                
                while (rs.next()) {
                    OrderDTO o = new OrderDTO();
                    o.setOrderID(rs.getString("orderID"));
                    o.setOrderCreateDate(rs.getString("orderCreateDate"));
                    o.setOrderExpectDate(rs.getString("orderExpectDate"));
                    o.setCompletedDate(rs.getString("completedDate"));
                    o.setCusName(rs.getString("cusName"));
                    o.setPrice(rs.getDouble("orderPrice"));
                    o.setAddress(rs.getString("orderAddress"));
                    o.setPayMethod(rs.getString("payMethod"));
                    o.setStatus(rs.getString("orderStatus"));
                    
                    lst.add(o);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return lst;
    }
    public boolean ChangeStatus(String oid,String status)throws NamingException, SQLException{
        boolean check=false; 
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql="UPDATE tblOrders " +
        " SET orderStatus = ?" +
        " WHERE orderID = ?";
         try {
            c = DBConnect.makeConnection();
                if (c != null) {
                    ps = c.prepareStatement(sql);
                    ps.setString(1, status);
                    ps.setString(2, oid);
                    check = ps.executeUpdate()>0;
                }
            } catch (Exception e) {
            e.printStackTrace();
             } 
            finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
         return check;
    }
    public ArrayList<OrderDTO> getAllUserOrder(String userID) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT orderID, orderCreateDate,orderExpectDate,completedDate, cusName, orderPrice, orderAddress, payMethod, orderStatus FROM tblOrders WHERE userID=?";

        ArrayList<OrderDTO> lst = new ArrayList<>();

        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                
                
                
                
                while (rs.next()) {
                    OrderDTO o = new OrderDTO();
                    o.setOrderID(rs.getString("orderID"));
                    o.setOrderCreateDate(rs.getString("orderCreateDate"));
                    o.setOrderExpectDate(rs.getString("orderExpectDate"));
                    o.setCompletedDate(rs.getString("completedDate"));
                    o.setCusName(rs.getString("cusName"));
                    o.setPrice(rs.getDouble("orderPrice"));
                    o.setAddress(rs.getString("orderAddress"));
                    o.setPayMethod(rs.getString("payMethod"));
                    o.setStatus(rs.getString("orderStatus"));                
                    lst.add(o);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return lst;
    }
    
    public OrderDTO getOrder(String oid) throws NamingException, SQLException {
        Connection c = null; //doi tuong ket noi
        PreparedStatement ps = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT orderID, userID,cusName, orderCreateDate,orderExpectDate,completedDate, orderPrice , orderAddress, payMethod, orderStatus "
                + " FROM tblOrders "
                + " WHERE orderID=?";

        try {
            DBConnect db = new DBConnect();
            c = db.makeConnection(); // tao doi tuong connection qua DBConnection

            if (c != null) {
                ps = c.prepareStatement(sql); // tao truy van
                ps.setString(1, oid); //gan tham so 1 la bien truyen vao
                rs = ps.executeQuery();

                while (rs.next()) {
                    OrderDTO o = new OrderDTO();
                    o.setOrderID(oid);
                    o.setUserID(rs.getString("userID"));
                    o.setCusName(rs.getString("cusName"));
                    o.setOrderCreateDate(rs.getString("orderCreateDate"));
                    o.setOrderExpectDate(rs.getString("orderExpectDate"));
                    o.setCompletedDate(rs.getString("completedDate"));
                    o.setPayMethod(rs.getString("payMethod"));
                    o.setPrice(rs.getDouble("orderPrice"));
                    o.setAddress(rs.getString("orderAddress"));
                    o.setPayMethod(rs.getString("payMethod"));
                    o.setStatus(rs.getString("orderStatus"));

                    return o;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (ps != null) {
                ps.close();
            }

            if (c != null) {
                c.close();
            }
        }
        return null;
    }
    
    public ArrayList<OrderDetailDTO> getAllOrderDetail(String oid) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT p.productName, s.color, s.ram, s.storage, o.orderQuantity, s.specPrice "
                + " FROM tblProducts p, tblProductSpec s, tblOrderDetail o "
                + " WHERE o.orderID = ? AND o.specID = s.specID AND p.productID = s.productID ";

        ArrayList<OrderDetailDTO> lst = new ArrayList<>();

        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                ps.setString(1, oid);
                rs = ps.executeQuery();

                while (rs.next()) {
                    ProductDTO p = new ProductDTO();
                    p.setName(rs.getString("productName"));
                    p.setColor(rs.getString("color"));
                    p.setRam(rs.getString("ram"));
                    p.setStorage(rs.getString("storage"));
                    p.setPrice(rs.getDouble("specPrice"));
                    
                    OrderDetailDTO od = new OrderDetailDTO();
                    od.setOrderID(oid);
                    od.setQuantity(rs.getInt("orderQuantity"));
                    od.setProduct(p);
                    
                    lst.add(od);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return lst;
    }
}
