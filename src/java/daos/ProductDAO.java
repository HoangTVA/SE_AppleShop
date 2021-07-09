/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import utils.DBConnect;
import dtos.CartItemDTO;
import dtos.OrderDTO;
import dtos.ProductDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.naming.NamingException;
import utils.DBSupport;

/**
 *
 * @author phath
 */
public class ProductDAO {

    public List<ProductDTO> viewProduct(String categoryID, String status) throws SQLException {
        List<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn =  DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT p.productID, p.productName, p.image, Min(s.specPrice) as price "
                        + " FROM tblProducts p, tblProductSpec s "
                        + " WHERE p.productID = s.productID AND p.categoryID LIKE ? AND s.specStatus = ? "
                        + " GROUP BY p.productID, p.productName, p.image ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + categoryID + "%");
                stm.setBoolean(2, Boolean.parseBoolean(status));
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("productName");
                    double price = rs.getDouble("price");
                    String image = rs.getString("image");
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new ProductDTO(id, name, "", price, 0, 0, Boolean.parseBoolean("status"), image, "", "", ""));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public ProductDTO getProduct(String pid) throws NamingException, SQLException {
        Connection c = null; //doi tuong ket noi
        PreparedStatement ps = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT productID, productName, productDesciption, viewCount, orderCount, categoryID, image "
                + "FROM tblProducts "
                + "WHERE productID=?";

        try {
            DBConnect db = new DBConnect();
            c = db.makeConnection(); // tao doi tuong connection qua DBConnection

            if (c != null) {
                ps = c.prepareStatement(sql); // tao truy van
                ps.setString(1, pid); //gan tham so 1 la bien truyen vao
                rs = ps.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("productName");
                    String description = rs.getString("productDesciption");
                    int viewCount = rs.getInt("viewCount");
                    int orderCount = rs.getInt("orderCount");
                    String image = rs.getString("image");

                    ProductDTO p = new ProductDTO(id, name, description,
                            0, viewCount, orderCount, true, image, "", "", "");

                    return p;
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

    public ArrayList<ProductDTO> getAllSpecWithColor(String productID, String color) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM tblProductSpec WHERE productID = ? AND color = ?";

        ArrayList<ProductDTO> lst = new ArrayList<>();

        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                ps.setString(1, productID); //gan tham so 1 la bien truyen vao
                ps.setString(2, color); //gan tham so 1 la bien truyen vao
                rs = ps.executeQuery();

                while (rs.next()) {
                    ProductDTO p = new ProductDTO();
                    p.setProductID(rs.getString("productID"));
                    p.setColor(rs.getString("color"));
                    p.setRam(rs.getString("ram"));
                    p.setStorage(rs.getString("storage"));
                    p.setPrice(rs.getDouble("specPrice"));

                    lst.add(p);
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

    public ArrayList<ProductDTO> getAllColor(String productID) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT DISTINCT color FROM tblProductSpec WHERE productID=?";

        ArrayList<ProductDTO> lst = new ArrayList<>();

        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                ps.setString(1, productID); //gan tham so 1 la bien truyen vao
                rs = ps.executeQuery();

                while (rs.next()) {
                    ProductDTO p = new ProductDTO();
                    p.setProductID(productID);
                    p.setColor(rs.getString("color"));

                    lst.add(p);
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

    public ProductDTO findSpec(String productID, String color, String ram, String storage) throws NamingException, SQLException {
        Connection c = null; //doi tuong ket noi
        PreparedStatement ps = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT p.productID, p.productName, p.image, s.color, s.ram, s.storage, s.specPrice, s.specID "
                + "FROM tblProductSpec s, tblProducts p "
                + "WHERE s.productID=? AND s.color=? AND s.ram=? AND s.storage=? AND p.productID=s.productID";

        try {
            DBConnect db = new DBConnect();
            c = db.makeConnection(); // tao doi tuong connection qua DBConnection

            if (c != null) {
                ps = c.prepareStatement(sql); // tao truy van
                ps.setString(1, productID); //gan tham so 1 la bien truyen vao
                ps.setString(2, color);
                ps.setString(3, ram);
                ps.setString(4, storage);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String name = rs.getString("name");
                    String image = rs.getString("image");
                    double price = rs.getDouble("specPrice");
                    String specID = rs.getString("specID");
                    //ProductDTO prs=new ProductDTO(productID, name, "", 0, price, 0, 0, true, image, ram, storage, color);
                    ProductDTO prs = new ProductDTO(productID, name, price, true, image, ram, storage, color, specID);
                    return prs;
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

    public ProductDTO GetSpec(String specID) throws NamingException, SQLException {
        Connection c = null; //doi tuong ket noi
        PreparedStatement ps = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT p.productID, p.productName, p.image, s.color, s.ram, s.storage, s.specPrice, s.specID "
                + "FROM tblProductSpec s, tblProducts p "
                + "WHERE s.specID=? AND p.productID=s.productID";

        try {
            DBConnect db = new DBConnect();
            c = db.makeConnection(); // tao doi tuong connection qua DBConnection

            if (c != null) {
                ps = c.prepareStatement(sql); // tao truy van
                ps.setString(1, specID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("specPrice");
                    String ram = rs.getString("ram");
                    String storage = rs.getString("storage");
                    String color = rs.getString("color");
                    //ProductDTO prs=new ProductDTO(productID, name, "", 0, price, 0, 0, true, image, ram, storage, color);
                    ProductDTO prs = new ProductDTO(productID, name, price, true, image, ram, storage, color, specID);
                    return prs;
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

    public OrderDTO completeOrder(List<CartItemDTO> cart, String address, String name, String email, String phone, String userID, String codeID, String method, double price) throws SQLException {
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String orderCreateDate = currentDateTime.format(dtf);
        DBSupport db = new DBSupport();
        OrderDTO newOrder = new OrderDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrders(orderID,cusName,orderAddress,orderCreateDate,codeID,userID,orderPrice,payMethod,orderStatus,ggUserID) "
                        + "VALUES(?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                String orderID = "ORD-"+db.getNumbRows("orderID", "tblOrders");
                stm.setString(1, orderID);
                stm.setString(2, name);
                stm.setString(3, address);
                stm.setString(4, orderCreateDate);
                stm.setString(5, codeID);
                stm.setString(6, userID);
                stm.setDouble(7, price);
                stm.setString(8, method);
                stm.setString(9, "Accepted");
                stm.setString(10, null);
                stm.executeUpdate();
                newOrder = new OrderDTO(orderID, name, address, phone, email, orderCreateDate, codeID, userID, price, method, "True");
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
        return newOrder;
    }

    public boolean addOrderDetail(List<CartItemDTO> cart,String orderID) throws SQLException {
        boolean check=false;
        Connection conn = null;
        PreparedStatement stm = null;
        DBSupport db = new DBSupport();
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                
                String detailQuery = "INSERT INTO tblOrderDetail(orderDetailID, orderID, orderQuantity, specID)"
                        + " VALUES(?,?,?,?)";
                stm = conn.prepareStatement(detailQuery);
                for (CartItemDTO items : cart) {
                    String detailID = "ORDDE-"+db.getNumbRows("orderDetailID", "tblOrderDetail");
                    stm.setString(1, detailID);
                    stm.setString(2,orderID);
                    stm.setInt(3, items.getQuantity());
                    stm.setString(4, items.getProduct().getSpecID());
                    check = stm.executeUpdate()>0;
                }
                
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<ProductDTO> viewProductManagement(String categoryID) throws SQLException {
        List<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT productID, productName, image "
                        + "FROM tblProducts "
                        + "WHERE categoryID LIKE ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + categoryID + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("productName");
                    String image = rs.getString("image");
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new ProductDTO(id, name, "", 0, 0, 0, true, image, "", "", ""));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public ArrayList<ProductDTO> getAllHardwareWithColor(String productID, String color) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT DISTINCT specID, ram, storage, specPrice FROM tblProductSpec WHERE productID=? AND color=?";

        ArrayList<ProductDTO> lst = new ArrayList<>();

        try {
            c = DBConnect.makeConnection();
            if (c != null) {
                ps = c.prepareStatement(sql);
                ps.setString(1, productID); //gan tham so 1 la bien truyen vao
                ps.setString(2, color);
                rs = ps.executeQuery();

                while (rs.next()) {
                    ProductDTO p = new ProductDTO();
                    p.setSpecID(rs.getString("specID"));
                    p.setProductID(productID);
                    p.setRam(rs.getString("ram"));
                    p.setStorage(rs.getString("storage"));
                    p.setPrice(rs.getDouble("specPrice"));

                    lst.add(p);
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

    public ProductDTO getPriceAndQuantity(String productID, String color, String specID) throws NamingException, SQLException {
        Connection c = null; //doi tuong ket noi
        PreparedStatement ps = null; //doi tuong truy van
        ResultSet rs = null;//doi tuong nhan ket qua

        String sql = "SELECT s.specQuantity, s.specPrice, s.specID "
                + "FROM tblProductSpec s, tblProducts p "
                + "WHERE s.productID=? AND s.color=? AND specID=? AND p.productID=s.productID";

        try {
            DBConnect db = new DBConnect();
            c = db.makeConnection(); // tao doi tuong connection qua DBConnection

            if (c != null) {
                ps = c.prepareStatement(sql); // tao truy van
                ps.setString(1, productID); //gan tham so 1 la bien truyen vao
                ps.setString(2, color);
                ps.setString(3, specID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    ProductDTO product = new ProductDTO();
                    product.setPrice(rs.getDouble("specPrice"));
                    product.setSpecID(rs.getString("specID"));

                    return product;
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

    public boolean UpdateProduct(String productID, String name) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        String sql = "UPDATE tblProducts SET productName=? WHERE productID=?";
        try {
            c = DBConnect.makeConnection();

            if (c != null) {
                ps = c.prepareStatement(sql);

                ps.setString(1, name);
                ps.setString(2, productID);

                ps.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return false;
    }

    public boolean UpdateProductWithImage(String productID, String name,String image) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        String sql = "UPDATE tblProducts SET productName=?, image=? WHERE productID=?";
        try {
            c = DBConnect.makeConnection();

            if (c != null) {
                ps = c.prepareStatement(sql);

                ps.setString(1, name);
                ps.setString(2, image);
                ps.setString(3, productID);

                ps.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return false;
    }

    public boolean UpdateProductSpec(String specID, double price, int quantity) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        String sql = "UPDATE tblProductSpec SET specPrice=?, specQuantity=? WHERE specID=?";
        try {
            c = DBConnect.makeConnection();

            if (c != null) {
                ps = c.prepareStatement(sql);

                ps.setDouble(1, price);
                ps.setInt(2, quantity);
                ps.setString(3, specID);

                ps.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return false;
    }

    public boolean CreateSpec(ProductDTO product) throws NamingException, SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO tblProductSpec (specID, ram, storage, color, productID, specPrice, specQuantity, specStatus) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            c = DBConnect.makeConnection();

            if (c != null) {
                ps = c.prepareStatement(sql);

                ps.setString(1, product.getSpecID());
                ps.setString(2, product.getRam());
                ps.setString(3, product.getStorage());
                ps.setString(4, product.getColor());
                ps.setString(5, product.getProductID());
                ps.setDouble(6, product.getPrice());
                ps.setInt(7, product.getSpecQuantity());
                ps.setBoolean(8, true);

                ps.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }
        return false;
    }
}
