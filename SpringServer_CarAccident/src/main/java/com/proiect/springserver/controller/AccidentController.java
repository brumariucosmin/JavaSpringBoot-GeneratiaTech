package com.proiect.springserver.controller;

import com.proiect.springserver.model.accident.Accident;
import com.proiect.springserver.model.accident.AccidentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class AccidentController {

    @Autowired
    private AccidentDao accidentDao;

    @GetMapping("/accident/get-all")
    public List<Accident> getAllAccidents() {
        return accidentDao.getAllAccidents();
    }

    @PostMapping("/accident/save")
    public Accident save(@RequestBody Accident accident)  {
         return accidentDao.save(accident);
    }
}
