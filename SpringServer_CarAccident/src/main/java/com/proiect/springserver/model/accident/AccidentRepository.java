package com.proiect.springserver.model.accident;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccidentRepository extends CrudRepository<Accident, Integer> {
}
