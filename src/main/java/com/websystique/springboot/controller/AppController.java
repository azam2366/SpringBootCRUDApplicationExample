package com.websystique.springboot.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

@Controller
public class AppController {

	@Autowired
	@Qualifier("dsJdbc")
	private DataSource dataSource;

	public static final Logger logger = LoggerFactory.getLogger(RestApiController.class);

	@RequestMapping("/")
	String home(ModelMap modal) {
		modal.addAttribute("title","CRUD Example");

		//...
		String SQL_SELECT =
				"select distinct(ad.DistinguishedName) from ibases as ib, ADusers as ad where ad.sAMAccountName in (SELECT ib.user FROM ibases WHERE ib.baseparam  like '%DEMO%')";

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SQL_SELECT);
			rs = stmt.executeQuery();
			while (rs.next()) {
				logger.info(rs.toString());
					}
					} catch (SQLException e) {
			logger.error(e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		//...


		return "index";
	}

	@RequestMapping("/partials/{page}")
	String partialHandler(@PathVariable("page") final String page) {
		return page;
	}

}
