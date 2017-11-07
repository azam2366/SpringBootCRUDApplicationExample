package com.websystique.springboot.controller;

import com.websystique.springboot.db.jdbc.JdbcOrganisationRepository;
import com.websystique.springboot.domain.Organisation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import javax.sql.DataSource;

@Controller
public class AppController {

	@Autowired
	JdbcOrganisationRepository organisationRepository;

	@Autowired
	@Qualifier("dsJdbc")
	private DataSource dataSource;

	public static final Logger logger = LoggerFactory.getLogger(RestApiController.class);

	@RequestMapping("/")
	String home(ModelMap modal) {
		modal.addAttribute("title","CRUD Example");
		return "index";
	}

	@RequestMapping("/partials/{page}")
	String partialHandler(@PathVariable("page") final String page) {
		return page;
	}

}
