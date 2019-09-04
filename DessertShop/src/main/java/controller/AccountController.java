package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.apache.log4j.Logger;

import entity.User;
import service.AccountService;
import service.DessertService;
import servlet.CodeCaptchaServlet;
import vo.IndexDessert;

@Controller
@RequestMapping("/Account")
public class AccountController {
	
	public Logger log = Logger.getLogger(AccountController.class);

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private DessertService dessertService;
	

	@RequestMapping("/")
	public String account() {

		return "login";
	}

	@RequestMapping("/Register")
	public String register() {

		return "register";
	}
	
	@RequestMapping("/Test")
	public String test() {

		return "user";
	}

	@RequestMapping("/CheckCode") // ��ά����
	@ResponseBody
	public Map<String, Object> checkCode(Model model, @RequestParam(value = "code", required = false) String code) {
		Map map = new HashMap<String, Object>();
		String vcode = (String) request.getSession().getAttribute(CodeCaptchaServlet.VERCODE_KEY);
		if (code.equals(vcode)) {
			// ��֤����ȷ
			map.put("message", "success");
		} else {
			// ��֤�����
			map.put("message", "fail");
		}

		return map;
	}

	@RequestMapping("/AddUser")
	public ModelAndView AddUser(String username, String password) {

		log.info("#####ע�Ὺʼ");
		ModelAndView mv = new ModelAndView();
		log.info("#####username=" + username);
		if ("".equals(username) || "".equals(password)) { // ���ַ��ж�

			mv.setViewName("register");
			mv.addObject("errMsg", "�û��������벻��Ϊ��");
			return mv;
		}

		boolean isUser = accountService.isUser(username); // ͬ���ж�
		log.info("#####isUser=" + isUser);
		if (isUser) {
			mv.setViewName("register");
			mv.addObject("errMsg", "�û����Ѵ���");
			return mv;
		}

		accountService.addUser(username, password);
		mv.setViewName("login");
		mv.addObject("username", username);
		return mv;
	}

	@RequestMapping("/Login")
	public String Login() {

		return "login";
	}

	@RequestMapping("/UserLogin")
	public ModelAndView UserLogin(String username, String password) {

		log.info("#####��¼��ʼ");
		ModelAndView mv = new ModelAndView();
		log.info("#####username=" + username);
		if ("".equals(username) || "".equals(password)) { // ���ַ��ж�

			log.info("#####�û���������Ϊ��");
			mv.setViewName("login");
			mv.addObject("errMsg", "�û��������벻��Ϊ��");
			return mv;
		}

		User u = new User();
		u = accountService.loginUser(username,password);
		log.info("#####");
		if (u != null) {
			log.info("#####��¼�û���Ϊ" + u.getUsername());
			HttpSession session=request.getSession();
			session.setAttribute("user", u);
//			mv.addObject("user", u);
			IndexDessert indexDessert=dessertService.indexDessert();
//			log.info("#####Desserts="+indexDessert.getBigDessert());
			mv.addObject("bigDessert", indexDessert.getBigDessert());
			mv.addObject("hotDessert", indexDessert.getHotDessert());
			mv.addObject("newDessert", indexDessert.getNewDessert());
			mv.addObject("cheapDessert", indexDessert.getCheapDessert());
			mv.addObject("expensiveDessert", indexDessert.getExpensiveDessert());
			
			mv.addObject("clicksDessert", indexDessert.getClicksDessert());
			
			mv.setViewName("index");
			return mv;

		} else {
			log.info("#####�û������������");
			mv.setViewName("login");
			mv.addObject("user", u);
			return mv;

		}

	}
	
	@RequestMapping("toIndex")
	public ModelAndView toIndex() {
		ModelAndView mv = new ModelAndView();
		IndexDessert indexDessert=dessertService.indexDessert();
		List<entity.Dessert> bigDessert=indexDessert.getBigDessert();
		mv.addObject("bigDessert", bigDessert);
		mv.setViewName("index");
		return mv;
	}
	

	@RequestMapping("/Contact")
	public String Contact() {

		return "contact";
	}

}
