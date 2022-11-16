package team.lazybear.bearbnb.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Hello;
import team.lazybear.bearbnb.repository.HelloRepositrory;

@Service
public class HelloService {

    @Autowired
    private HelloRepositrory helloRepository;

    public List< Hello > findAll() {
        return helloRepository.findAll();
    }
    
    public String insertHello() {
    	Hello hello = new Hello();
    	hello.setGreeting("Hi");
    	helloRepository.save(hello);
    	
    	return hello.getGreeting();
    }

}
