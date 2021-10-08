package com.wang.web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //通知服务器不缓存
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expires","0");
        int width = 80;
        int height = 40;
        //1.创建一个对象，在内存中图片
        BufferedImage bufferedImage = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
        //2.美化图片
        //2.1填充背景色：
        Graphics g = bufferedImage.getGraphics();
        g.setColor(Color.GRAY);
        g.fillRect(0,0,width,height);
        // Font font = new Font();
        //2.2画边框
        g.setColor(Color.BLUE);
        g.drawRect(0,0,width-1,height-1);
        String checkCode = getCheckCode();
        //获得验证码
        request.getSession().setAttribute("CHECKCODE_SERVER",checkCode);
        System.out.println(request.getSession().getAttribute("CHECKCODE_SERVER"));
        g.setColor(Color.blue);
        Random random = new Random();
        int line = random.nextInt(15);
        for (int i = 0; i <line ; i++) {
            g.drawLine(random.nextInt(width),random.nextInt(height),random.nextInt(width),random.nextInt(height));
        }
        g.setColor(Color.RED);
        g.setFont(new Font("黑体",Font.BOLD,24));
        g.drawString(checkCode,15,25);
        //3.将图片展示到页面
        ImageIO.write(bufferedImage,"png",response.getOutputStream());
    }
    private String getCheckCode(){
        //生成随机角标
        String str = "QWERTYUIOPASDFGHJKLZXCVBNMzxcvbnmlkjhgfdsaqwertyuiop0987654321";
        Random random = new Random();
        String s = "";
        for (int i = 0; i <4 ; i++) {
            int index = random.nextInt(str.length());
            char ch = str.charAt(index);
            s += ch;
        }
        return s;
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doPost(request,response);
    }
}
