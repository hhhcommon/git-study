package servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="BaseServlet",urlPatterns="/captchaServlet")
public class CodeCaptchaServlet extends HttpServlet{
	
    public static final String VERCODE_KEY = "VERCODE_KEY";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       // request.getSession().removeAttribute(LOGIN_VERCODE_KEY);
        request.getSession().removeAttribute(VERCODE_KEY);
        // ��������ҳ�治����
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        
      //���ڴ��д���ͼ��
        int iWidth = 55, iHeight = 18;
        BufferedImage image = new BufferedImage(iWidth, iHeight,
                BufferedImage.TYPE_INT_RGB);
        //��ȡͼ��������
        Graphics g = image.getGraphics();
        //�趨����ɫ
        g.setColor(Color.white);
        g.fillRect(0, 0, iWidth, iHeight);
        //���߿�
        g.setColor(Color.black);
        g.drawRect(0, 0, iWidth - 1, iHeight - 1);
        //ȡ�����������֤��(4λ����)
        //String rand = Utils.getCharacterAndNumber(4);
        int intCount=0; 
        intCount=(new Random()).nextInt(9999);// 

        if(intCount <1000)intCount+=1000; 
        String rand=intCount+"";
        //����֤����ʾ��ͼ����
        g.setColor(Color.black);
        g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
        g.drawString(rand, 5, 15);
        //�������88�����ŵ�,ʹͼ���е���֤�벻�ױ���������̽�⵽
        Random random = new Random();
        for (int iIndex = 0; iIndex < 100; iIndex++) {
            int x = random.nextInt(iWidth);
            int y = random.nextInt(iHeight);
            g.drawLine(x, y, x, y);
        }
        
        // �����ɵ�����ַ���д��session
       // request.getSession().setAttribute(LOGIN_VERCODE_KEY, rand);
        request.getSession().setAttribute(VERCODE_KEY, rand);
        //ͼ����Ч
        g.dispose();
        //���ͼ��ҳ��
        ImageIO.write(image, "JPEG", response.getOutputStream());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void init()
            throws ServletException {
        super.init();
    }

    private static final long serialVersionUID = 5413310437308046316L;


}
