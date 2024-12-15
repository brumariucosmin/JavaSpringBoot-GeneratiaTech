package com.project.springserver.caraccident.accident;


import jakarta.validation.Valid;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

@Service
public class AccidentService {

    private static List<Accident> accidents = new ArrayList<>();

    private static int accidentsCount = 0;

    public List<Accident> findByUsername(String username){
        Predicate<? super Accident> predicate =
                accident -> accident.getUsername().equalsIgnoreCase(username);
        return accidents.stream().filter(predicate).toList();
    }

    public void addAccident(String username, String intensity, String amplitude, LocalDate targetDate, boolean done) {
        Accident accident = new Accident(++accidentsCount,username,intensity,amplitude,targetDate,done);
        accidents.add(accident);
    }

    public void deleteById(int id) {
        //accident.getId() == id
        // accident -> accident.getId() == id
        Predicate<? super Accident> predicate = accident -> accident.getId() == id;
        accidents.removeIf(predicate);
    }

    public Accident findById(int id) {
        Predicate<? super Accident> predicate = accident -> accident.getId() == id;
        Accident accident = accidents.stream().filter(predicate).findFirst().get();
        return accident;
    }

    public void updateAccident(@Valid Accident accident) {
        deleteById(accident.getId());
        accidents.add(accident);
    }
}