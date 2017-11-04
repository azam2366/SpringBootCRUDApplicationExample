package com.websystique.springboot.db;

import com.websystique.springboot.domain.Organisation;

import java.util.List;

/**
 * Repository interface with operations for {@link Organisation} persistence.
 * @author habuma
 */
public interface OrganisationRepository {

  List<Organisation> findAll();

  List<Organisation> findDemo();

}
