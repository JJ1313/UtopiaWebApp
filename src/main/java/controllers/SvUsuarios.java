/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.UsuariosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author Heinz Gerhard Beckers Sandoval
 */
@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {

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
        UsuariosDAO usersDAO = new UsuariosDAO();
//----- CREAR USUARIO
        if(request.getParameter("signUp") != null){
            // DAtos de formulario
            System.out.println("ENTRO AQUI!! l68 svUsuario");
            String name = request.getParameter("name");
            String correo = request.getParameter("email");
            String pass = request.getParameter("password");
            // Verifica que usuario no exista
            if(usersDAO.getUserByName(name) == null){
                Usuario user = usersDAO.createUser(name, correo, pass);
                
                user = usersDAO.getUserByName(name);
                
                HttpSession sesionActual = request.getSession();
                sesionActual.setAttribute("id", user.getId());
                sesionActual.setAttribute("name", user.getNombre());
                response.sendRedirect("index.jsp");
            }
            else{
                System.out.println("Usuario existe");
                response.sendRedirect("index.jsp");
            } 
//            System.out.println("SIGN UP CLICK");
        }
        
//----- INICIAR SESION
        else if( request.getParameter("logIn") != null){
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            System.out.println("LOG IN CLICK");
        }
        
//----- OPCION NO VALIDA
        else{
            System.out.println("Opcion no valida.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
