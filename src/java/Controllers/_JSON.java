/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author Sergio
 */
public class _JSON extends HttpServlet {

    

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
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String processData = request.getParameter("processData");
        
       
        response.setContentType("application/json");
        response.setHeader("Cache-Control", "no-cache");
        Map<String, String> personMap = 
        new HashMap<String, String>();
        personMap.put("firstName", "!!!"+firstName);
        personMap.put("lastName", "!!!"+lastName);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(personMap);
        response.getWriter().write(json);
    
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
        String route = request.getParameter("route");
        String idProduct = request.getParameter("idProduct");
        
       
        response.setContentType("application/json");
        response.setHeader("Cache-Control", "no-cache");
        Map<String, String> personMap = 
        new HashMap<String, String>();
        personMap.put("route", "!"+route);
        personMap.put("idProduct", "!"+idProduct);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(personMap);
        response.getWriter().write(json);
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
