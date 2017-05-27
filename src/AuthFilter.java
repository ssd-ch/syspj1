import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.Filter;
import javax.servlet.FilterChain;

public class AuthFilter implements Filter{

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain){

        try{

            String target = ((HttpServletRequest)request).getRequestURI();

            HttpSession session = ((HttpServletRequest)request).getSession();

            System.out.println(target);

            final String redirectURL = "/login.jsp";

//            if(target.equals(redirectURL)){
//                //リダイレクト先のページの場合は処理を終了
//                chain.doFilter(request, response);
//                return;
//            }

            if (session == null){
                /* まだ認証されていない */
                session = ((HttpServletRequest)request).getSession(true);
                session.setAttribute("target", target);

                ((HttpServletResponse)response).sendRedirect(redirectURL);
            }else{
                Object loginCheck = session.getAttribute("login");
                if (loginCheck == null){
                    /* まだ認証されていない */
                    session.setAttribute("target", target);
                    ((HttpServletResponse)response).sendRedirect(redirectURL);
                }
            }

            chain.doFilter(request, response);

        }catch (ServletException se){
        }catch (IOException e){
        }

    }

    public void init(FilterConfig filterConfig) throws ServletException{
    }

    public void destroy(){
    }
}

