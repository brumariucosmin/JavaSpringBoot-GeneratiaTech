package com.project.springserver.caraccident.accident;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.time.LocalDate;

//Database (MySQL)
//Static List of accidents => Database (H2, MySQL)

//JPA
// Bean -> Database Table

@Entity
public class Accident {

    public Accident() {

    }

    public Accident(int id, String username, String intensity,String amplitude, LocalDate targetDate, boolean done) {
        super();
        this.id = id;
        this.username = username;
        this.intensity = intensity;
        this.amplitude = amplitude;
        this.targetDate = targetDate;
        this.done = done;
    }

    @Id
    @GeneratedValue
    private int id;

    private String username;


    private String intensity;

    private String amplitude;
    private LocalDate targetDate;
    private boolean done;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIntensity() {
        return intensity;
    }

    public void setIntensity(String intensity) {
        this.intensity = intensity;
    }

    public String getAmplitude() {
        return amplitude;
    }

    public void setAmplitude(String amplitude) {
        this.amplitude = amplitude;
    }

    public LocalDate getTargetDate() {
        return targetDate;
    }

    public void setTargetDate(LocalDate targetDate) {
        this.targetDate = targetDate;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    @Override
    public String toString() {
        return "Accident [id=" + id + ", username=" + username + ", intensity=" + intensity + ", amplitude=" + amplitude + ", targetDate="
                + targetDate + ", done=" + done + "]";
    }

}
