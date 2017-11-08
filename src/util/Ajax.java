package util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webservice.WebServiceHelper;

/**
 * Servlet implementation class Ajax
 */
@WebServlet("/Ajax")
public class Ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ajax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String queryType = request.getParameter("queryType");
		String stockCode = request.getParameter("stockCode");
		WebServiceHelper wsh = new WebServiceHelper();
		if("query1".equals(queryType)){
			response.getWriter().println(wsh.getAllLatestPrice());
		}else if("query2".equals(queryType)){
			response.getWriter().println(wsh.getHighestPriceInTenDays(stockCode));
		}else if("query3".equals(queryType)){
			response.getWriter().println(wsh.getAvgPriceInOneYear(stockCode));
		}else if("query4".equals(queryType)){
			response.getWriter().println(wsh.getLowestPriceInOneYear(stockCode));
		}else if("query5".equals(queryType)){
			response.getWriter().println(wsh.getNamesHaveLowerAvgThan(stockCode));
		}
	}

}
