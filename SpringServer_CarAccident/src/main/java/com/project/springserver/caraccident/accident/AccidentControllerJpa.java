package com.project.springserver.caraccident.accident;

import jakarta.validation.Valid;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.time.LocalDate;
import java.util.List;

@Controller
@SessionAttributes("name")
public class AccidentControllerJpa {

    public AccidentControllerJpa(AccidentRepository accidentRepository) {
        super();
        this.accidentRepository = accidentRepository;
    }

    private AccidentRepository accidentRepository;

    @RequestMapping("list-accidents")
    public String listAllAccidents(ModelMap model) {
        String username = getLoggedInUsername(model);

        List<Accident> accidents = accidentRepository.findByUsername(username);
        model.addAttribute("accidents", accidents);

        return "listAccidents";
    }

    //GET, POST
    @RequestMapping(value="add-accident", method = RequestMethod.GET)
    public String showNewAccidentPage(ModelMap model) {
        String username = getLoggedInUsername(model);
        Accident accident = new Accident(0, username, "","", LocalDate.now().plusYears(1), false);
        model.put("accident", accident);
        return "accident";
    }

    @RequestMapping(value="add-accident", method = RequestMethod.POST)
    public String addNewAccident(ModelMap model, @Valid Accident accident, BindingResult result) {

        if(result.hasErrors()) {
            return "accident";
        }

        String username = getLoggedInUsername(model);
        accident.setUsername(username);
        accidentRepository.save(accident);
        return "redirect:list-accidents";
    }

    @RequestMapping("delete-accident")
    public String deleteAccident(@RequestParam int id) {
        //Delete accident
        accidentRepository.deleteById(id);
        return "redirect:list-accidents";

    }

    @RequestMapping(value="update-accident", method = RequestMethod.GET)
    public String showUpdateAccidentPage(@RequestParam int id, ModelMap model) {
        Accident accident = accidentRepository.findById(id).get();
        model.addAttribute("accident", accident);
        return "accident";
    }

    @RequestMapping(value="update-accident", method = RequestMethod.POST)
    public String updateAccident(ModelMap model, @Valid Accident accident, BindingResult result) {

        if(result.hasErrors()) {
            return "accident";
        }

        String username = getLoggedInUsername(model);
        accident.setUsername(username);
        accidentRepository.save(accident);
        return "redirect:list-accidents";
    }

    private String getLoggedInUsername(ModelMap model) {
        Authentication authentication =
                SecurityContextHolder.getContext().getAuthentication();
        return authentication.getName();
    }

    @RequestMapping("delete-all-accident")
    public String deleteAllAccident() {
        accidentRepository.deleteAll();
        return "redirect:list-accidents";
    }
    
}