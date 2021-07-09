/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.ProductDAO;
import dtos.ErrorDTO;
import dtos.ProductDTO;
import dtos.ViewProductErrorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class ProductController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String VIEW = "productList.jsp";
    private static final String DETAIL = "product_details.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = ERROR;
        ErrorDTO error = new ErrorDTO();
        String perform = request.getParameter("perform");
        
        try {
            switch (perform) {
                case "ViewProduct":
                    
                    ViewProductErrorDTO msg = new ViewProductErrorDTO();
                    ProductDAO dao = new ProductDAO();
                    String categoryID = request.getParameter("categoryID");                   
                    if (request.getParameter("categoryID") == null) {
                        categoryID = "";
                    }
                    String status = request.getParameter("status");
                    if (request.getParameter("status") == null) {
                        status = "True";
                    }
                    
                    List<ProductDTO> list = dao.viewProduct(categoryID, status); //qq nay null nè
                 
                   
                    //Pagination
                    String pageNum = request.getParameter("pageNum");
                    int page = 0;
                    if (pageNum != null) {
                        page = Integer.parseInt(pageNum);
                    } else {
                        page = 1;
                    }
                    int product_per_page = 20;// set product per page here
                    int pNum = list.size();
                    int pages = 0;
                    if (pNum % product_per_page == 0) {
                        pages = pNum / product_per_page;
                    } else {
                        pages = (pNum / product_per_page) + 1;
                    }
                    System.out.println(pNum);
                    System.out.println(page);
                    if (list != null) {
                        if (request.getParameter("pageNum") != null) {
                            if (pNum >= (page * product_per_page)) {
                                List<ProductDTO> subList = list.subList(((page - 1) * product_per_page), (page * product_per_page));
                                request.setAttribute("PRODUCT_LIST", subList);
                            } else {
                                List<ProductDTO> subList = list.subList(((page - 1) * product_per_page), pNum);
                                request.setAttribute("PRODUCT_LIST", subList);
                            }
                        } else {
                            if (pNum < product_per_page) {
                                request.setAttribute("PRODUCT_LIST", list);
                            } else {
                                List<ProductDTO> subList = list.subList(0, product_per_page);
                                request.setAttribute("PRODUCT_LIST", subList);
                            }
                        }
                        request.setAttribute("pages", pages);
                        request.setAttribute("curPage", page);
                        //end pagination      
                        
                        request.setAttribute("cateID", categoryID);
                    } else {
                        msg.setMsg("Sorry our shop currently doesn't have these products in stock !!");
                        request.setAttribute("EMPTY_LIST", msg);
                    }
                    url = VIEW;
                    break;
                case "ViewDetail":
                    String id = request.getParameter("productID").trim();
                    String colorChoosen = request.getParameter("color");
                    String specChosen = request.getParameter("specID");

                    ProductDAO pDAO = new ProductDAO();

                    ProductDTO product = pDAO.getProduct(id);
                    List<ProductDTO> color = pDAO.getAllColor(id);
                    if (colorChoosen != null) {
                        ProductDTO spec = pDAO.getPriceAndQuantity(id, colorChoosen, specChosen);
                        List<ProductDTO> hardware = pDAO.getAllHardwareWithColor(id, colorChoosen);
                        request.setAttribute("colorChosen", colorChoosen);
                        request.setAttribute("hardware", hardware);
                        request.setAttribute("spec", spec);
                        request.setAttribute("specID", specChosen);
                    }
                    request.setAttribute("product", product);
                    request.setAttribute("color", color);

                    url = DETAIL;
                    break;   
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
