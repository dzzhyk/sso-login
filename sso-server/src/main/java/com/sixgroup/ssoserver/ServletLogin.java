package com.sixgroup.ssoserver;


import com.sixgroup.ssoclient.constant.Auth;
import com.sixgroup.ssoclient.entity.TokenInfo;
import com.sixgroup.ssoclient.util.JwtUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author dzzhyk
 */
@WebServlet("/login")
public class ServletLogin extends javax.servlet.http.HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        if ("".equals(username.trim())){
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        TokenInfo tokenInfo = new TokenInfo();
        tokenInfo.setUsername(username);

        String clientUrl = request.getParameter(Auth.CLIENT_URL);       // 目标地址

        String encode = JwtUtil.encode(tokenInfo);
        Cookie token = new Cookie(Auth.TOKEN, encode);
        token.setMaxAge(-1);
        response.addCookie(token);

        Cookie userCookie = new Cookie("username", username);
        userCookie.setMaxAge(-1);
        response.addCookie(userCookie);

        if (clientUrl != null && !"".equals(clientUrl.trim())) {
            response.sendRedirect(clientUrl);
            return;
        }

        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
