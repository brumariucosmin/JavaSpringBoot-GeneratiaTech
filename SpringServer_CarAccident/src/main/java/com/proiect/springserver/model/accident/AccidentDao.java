package com.proiect.springserver.model.accident;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.util.Streamable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AccidentDao {
    @Autowired
    private AccidentRepository repository;

    public Accident save(Accident accident) {
        return repository.save(accident);
    }

    public List<Accident> getAllAccidents() {
        List<Accident> accidents = new ArrayList<>();
        Streamable.of(repository.findAll())
                .forEach(accidents::add);
        return accidents;
    }


    public void delete(int accidentId) {
        repository.deleteById(accidentId);
    }
}
