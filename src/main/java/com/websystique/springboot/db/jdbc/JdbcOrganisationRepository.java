package com.websystique.springboot.db.jdbc;

import com.websystique.springboot.db.OrganisationRepository;
import com.websystique.springboot.domain.OrgBases;
import com.websystique.springboot.domain.Organisation;
import com.websystique.springboot.domain.QuoteSpace;
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

	public List<OrgBases> orgBases(String distinguishedName) {
		return jdbcTemplate.query(
				"select distinct (basename) ,baseparam,user  FROM ibases where user in (SELECT sAMAccountName FROM ADusers WHERE DistinguishedName = ?) group by baseparam",
				new OrgBasesRowMapper(), distinguishedName);	}

	public List<QuoteSpace> quoteSpace(String distinguishedName) {
		return jdbcTemplate.query(
				"select user, ROUND (DiskSpaceUsed/1024/1024, 2) from QuoteSpace where user in (SELECT sAMAccountName FROM ADusers WHERE DistinguishedName = ?) order by DiskSpaceUsed",
				new QuoteSpaceRowMapper(), distinguishedName);	}

	private static final class OrganisationRowMapper implements RowMapper<Organisation> {
		public Organisation mapRow(ResultSet rs, int rowNum) throws SQLException {
			String displayName = rs.getString("displayname");
			String distinguishedName = rs.getString("distinguishedname");

			return new Organisation(displayName, distinguishedName);
		}		
	}

	private static final class OrgBasesRowMapper implements RowMapper<OrgBases> {
		public OrgBases mapRow(ResultSet rs, int rowNum) throws SQLException {
			String baseName = rs.getString("basename");
			String baseParam = rs.getString("baseparam");
			String user = rs.getString("user");

			return new OrgBases(baseName, baseParam, user);
		}
	}

	private static final class QuoteSpaceRowMapper implements RowMapper<QuoteSpace> {
		public QuoteSpace mapRow(ResultSet rs, int rowNum) throws SQLException {
			String user = rs.getString("user");
			Double diskSpaceUsed = rs.getDouble("diskspaceused");

			return new QuoteSpace(user, diskSpaceUsed);
		}
	}

}
