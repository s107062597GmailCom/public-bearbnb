package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.AccountIdentity;
import team.lazybear.bearbnb.repository.AccountIdentityRepository;

@Service
public class AccountIdentityService {

    @Autowired
    private AccountIdentityRepository accountIdentityRepository;

    private List< AccountIdentity > accountIdentityList;

    public List< AccountIdentity > findAll() {
        return accountIdentityRepository.findAll();
    }

    public String findTitleById( Integer id ) {
        if ( accountIdentityList == null )
            accountIdentityList = findAll();

        for ( AccountIdentity accountIdentity : accountIdentityList )
            if ( accountIdentity.getId().equals(id) )
                return accountIdentity.getTitle();
        return null;
    }

    public Integer findIdByTitle( String title ) {
        if ( accountIdentityList == null )
            accountIdentityList = findAll();

        for ( AccountIdentity accountIdentity : accountIdentityList )
            if ( accountIdentity.getTitle().equals(title) )
                return accountIdentity.getId();
        return null;
    }
    
//    public AccountIdentity findById(Integer id) {
//    	AccountIdentity accid = new AccountIdentity();
//    	Optional<AccountIdentity> op =  accountIdentityRepository.findById(id);
//    	if(op.isPresent()) {
//    		accid = op.get();
//    		return accid;
//    	}
//    	return null;
//    }

    public AccountIdentity findById(Integer id) {
    	 Optional<AccountIdentity> opt = accountIdentityRepository.findById(id);
    	 if(opt.isPresent()) {
    		 return opt.get();
    	 }
    	 return null;
    }
}
