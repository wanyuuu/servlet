package com.wanyu.control;

import com.wanyu.service.IUserService;
import com.wanyu.service.UserServiceImpl;
import com.wanyu.vo.User;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by samsung on 2017/10/11.
 */
@WebServlet(name="usercontrol",urlPatterns = "/user")
public class userControl extends HttpServlet{
    private IUserService service=new UserServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user=null;
        RequestDispatcher dispatcher=null;
        String action=req.getParameter("action");
        if(action.equals("add")){
            dispatcher=req.getRequestDispatcher("user?action=queryall");
            user=new User();
//            String username=new String(req.getParameter("username").toString().getBytes("ISO8859-1"),"utf-8");
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            user.setUsername(username);
            user.setPassword(password);
            add(user,req);
        }else if(action.equals("del")){
            dispatcher=req.getRequestDispatcher("user?action=queryall");
            String id=req.getParameter("id");
            del(Integer.parseInt(id),req);
        }else if(action.equals("queryid")){
            dispatcher=req.getRequestDispatcher("user?action=queryall");
            String id=req.getParameter("id");
            user=service.queryById(Integer.parseInt(id));
            req.setAttribute("user",user);
        }else if(action.equals("edit")){
            dispatcher=req.getRequestDispatcher("user?action=queryall");
            user=new User();
            String id=req.getParameter("id");
//            String username=new String(req.getParameter("username").getBytes("ISO8859-1"),"utf-8");
            String username=req.getParameter("username");
            String password=req.getParameter("password");
            user.setId(Integer.parseInt(id));
            user.setUsername(username);
            user.setPassword(password);
            if(service.update(user)){
                req.setAttribute("msg","编辑成功");
            }else {
                req.setAttribute("msg","编辑失败");
            }
        }else if(action.equals("queryall")){
            dispatcher=req.getRequestDispatcher("show.jsp");
            List<User> list=new ArrayList<User>();
            list=service.queryAll();
            req.setAttribute("list",list);
        }
        dispatcher.forward(req,resp);
    }
    public void add(User user,HttpServletRequest req){
        if(service.add(user)){
            req.setAttribute("msg","注册成功");
        }else {
            req.setAttribute("msg","注册失败");
        }
    }
    public void del(int id,HttpServletRequest req){
        if(service.del(id)){
            req.setAttribute("msg","删除成功");
        }else {
            req.setAttribute("msg","删除失败");
        }
    }

}
