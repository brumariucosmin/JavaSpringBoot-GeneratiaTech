package com.proiect.springserver;

import com.proiect.springserver.model.accident.Accident;
import com.proiect.springserver.model.accident.AccidentDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class SpringServerApplicationTests {

	@Autowired
	private AccidentDao accidentDao;



	@Test
	void addAccidentTest() {
		Accident accident = new Accident();
		//accident.setAmplitude("ceva1");
		//accident.setIntensity("ceva2);
		//accident.setLocation("ceva3");
		accidentDao.save(accident);
	}

	// @Test
	void getAllAccidentsAndDeleteThem(){
		List<Accident> accidents = accidentDao.getAllAccidents();
		for (Accident accident : accidents ){
			accidentDao.delete(accident.getId());
		}
	}

}
