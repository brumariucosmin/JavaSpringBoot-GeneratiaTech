package com.project.springserver.caraccident.accident;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AccidentRepository extends JpaRepository<Accident, Integer>{
    public List<Accident> findByUsername(String username);
}
