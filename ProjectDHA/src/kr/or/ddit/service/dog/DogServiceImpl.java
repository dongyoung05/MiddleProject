package kr.or.ddit.service.dog;

import java.util.List;

import kr.or.ddit.dao.dog.DogDaoImpl;
import kr.or.ddit.vo.DogVO;

public class DogServiceImpl implements IDogService {
	
	private DogDaoImpl dao;
	private static DogServiceImpl service;
	private DogServiceImpl() {
		dao = DogDaoImpl.getInstance(); 
	}
	public static DogServiceImpl getInstance() {
		if(service==null) service = new DogServiceImpl();
		return service;
	}
	
	
	@Override
	public List<DogVO> selectAllDog(String mem_id) {
		
		return dao.selectAllDog(mem_id);
	}

	@Override
	public int insertDog(DogVO dogVo) {
		
		return dao.insertDog(dogVo);
	}

	@Override
	public int deleteDog(DogVO dogVo) {
		
		return dao.deleteDog(dogVo);
	}

	@Override
	public int updateDog(DogVO dogVo) {
		
		return dao.updateDog(dogVo);
	}

	@Override
	public DogVO selectDog(DogVO dogVo) {
		
		return dao.selectDog(dogVo);
	}

	
}