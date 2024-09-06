package com.example.abcwebapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class QueryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve query parameters from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String query = request.getParameter("query");

        // Get user ID from the session and convert it to int
        HttpSession session = request.getSession(false);
        int userId = 0; // Default value for userId
        if (session != null) {
            Object userIdObj = session.getAttribute("userId");
            if (userIdObj instanceof Integer) {
                userId = (Integer) userIdObj; // Direct cast if it's already an Integer
            } else if (userIdObj instanceof String) {
                try {
                    userId = Integer.parseInt((String) userIdObj); // Convert String to int
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Invalid user ID format.");
                    request.getRequestDispatcher("confirmation.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("message", "Invalid user ID format.");
                request.getRequestDispatcher("confirmation.jsp").forward(request, response);
                return;
            }
        }

        boolean success = false;

        // Insert query into the database
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO user_queries (user_id, name, email, query) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setInt(1, userId);
                pstmt.setString(2, name);
                pstmt.setString(3, email);
                pstmt.setString(4, query);
                pstmt.executeUpdate();
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
        }

        if (success) {
            request.setAttribute("message", "Your query has been successfully submitted!");
        }

        // Forward to the confirmation page
        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }
}
