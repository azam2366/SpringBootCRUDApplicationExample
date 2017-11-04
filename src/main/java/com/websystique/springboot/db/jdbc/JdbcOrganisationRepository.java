package com.websystique.springboot.db.jdbc;

import com.websystique.springboot.db.OrganisationRepository;
import com.websystique.springboot.domain.Organisation;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class JdbcOrganisationRepository implements OrganisationRepository {
	
	private JdbcTemplate jdbcTemplate;

	public JdbcOrganisationRepository(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;		
	}

	public List<Organisation> findAll() {
		return jdbcTemplate.query(
		        "select distinct(ad.DisplayName), ad.DistinguishedName from ADusers as ad",
                new OrganisationRowMapper());
	}

	public List<Organisation> findDemo() {
        return jdbcTemplate.query(
                "select distinct(ad.DistinguishedName), ad.DisplayName from ibases as ib, ADusers as ad where ad.sAMAccountName in (SELECT ib.user FROM ibases WHERE ib.baseparam  like '%DEMO%')",
                new OrganisationRowMapper());	}

	private static final class OrganisationRowMapper implements RowMapper<Organisation> {
		public Organisation mapRow(ResultSet rs, int rowNum) throws SQLException {
			String displayName = rs.getString("displayname");
			String distinguishedName = rs.getString("distinguishedname");

			return new Organisation(displayName, distinguishedName);
		}		
	}

}
