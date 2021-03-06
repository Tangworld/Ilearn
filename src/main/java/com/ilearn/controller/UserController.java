package com.ilearn.controller;

import com.ilearn.bean.ResourcesEntity;
import com.ilearn.bean.StatusMessage;
import com.ilearn.bean.UserEntity;
import com.ilearn.dao.ResourcesDao;
import com.ilearn.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by sl on 16-4-5.
 */
@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    @Qualifier("userDao")
    private UserDao userDao;





    @RequestMapping(value = "/login" , method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/register" , method = RequestMethod.GET)
    public String register(){
        return "register";
    }





   // @ResponseBody
    @RequestMapping(value = "/register" , method = RequestMethod.POST)
    public String  register(String userName , String password,
                                  String password1 ,String email,HttpServletRequest request){

        System.out.println("111111111111111111  "+userName+" "+password+" "+password1
        +" "+email);

        StatusMessage statusMessage;
        String message = null;
        if(userDao.isUserNameExit(userName)){
            message = "该用户名已被注册";
            statusMessage = new StatusMessage(0,message);
        }else if(userDao.isEmailExit(email)){
            message = "该邮箱已被注册";
            statusMessage = new StatusMessage(0,message);
        }//else if(!captcha.equals())验证码没搞呢
        else if(!password.equals(password1)){
            message = "两次密码不一致";
            statusMessage = new StatusMessage(0,message);
        }else{
            message = "注册成功";
            userDao.save(userName,password,email);
            statusMessage = new StatusMessage(1,message);
            request.getSession().setAttribute("username",userName);
        }

        return "redirect:/index";

    }

    @RequestMapping(value = "/login" , method = RequestMethod.POST)
    public String login(HttpServletRequest request,String username , String password , HttpSession session){
        int status = 0;
        String message = "";
        StatusMessage statusMessage = new StatusMessage(status,message);


        System.out.println("1111111111111111111111"+username+"  "+password);

        if(username.isEmpty()){
            message = "请输入用户名";
        }else{
            UserEntity user = userDao.getByName(username);
            if(password.isEmpty()){
                message = "请输入密码";
            }else if(!user.getPassword().equals(password)){
                message = "密码错误";
            }else {
                status = 1;
                message = "用户登陆成功";
                session.setAttribute("loginUser",user);
                statusMessage.setStatus(status);
                statusMessage.setMessage(message);
                System.out.println("message1 : "+message);
                request.getSession().setAttribute("username",username);
                //session.setAttribute("userid",user.getId());
                // redirectAttributes.addAttribute("loginMsg",message);
                return "redirect:/index";
            }
        }

        System.out.println("message : "+message);
        statusMessage.setStatus(status);
        statusMessage.setMessage(message);
//        redirectAttributes.addAttribute("loginMsg","登录失败");
        return "redirect:/index";
    }







    @RequestMapping(value = "/person" , method = RequestMethod.GET)
    public String person(){

        return "user/user-info";
    }

    @RequestMapping(value = "/logout" , method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/index";
    }








}
