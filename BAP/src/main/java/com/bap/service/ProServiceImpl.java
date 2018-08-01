package com.bap.service;

import java.text.SimpleDateFormat;
import java.util.List;

import com.bap.domain.ProVO;
import com.bap.domain.TeamVO;
import com.bap.dto.CreateProDTO;
import com.bap.dto.GroupInfoDTO;
import com.bap.persistence.ProDAO;
import com.bap.persistence.TeamDAO;

public class ProServiceImpl implements ProService {

	private ProDAO proDAO;
	private TeamDAO teamDAO;
	
	public void setProDAO(ProDAO proDAO) {
		this.proDAO = proDAO;
	}
	
	public void setTeamDAO(TeamDAO teamDAO) {
		this.teamDAO = teamDAO;
	}
	
	@Override
	public int createPro(CreateProDTO createProDTO) throws Exception {
		ProVO proVO = new ProVO();
		
		proVO.setPro_name(createProDTO.getPro_name());
		proVO.setMem_id(createProDTO.getMem_id());
		proVO.setPro_contents(createProDTO.getPro_contents());
		
		String pro_start = createProDTO.getPro_start();
		proVO.setPro_start(new SimpleDateFormat("yyyy-MM-dd").parse(pro_start));
		
		String pro_end = createProDTO.getPro_end();
		proVO.setPro_end(new SimpleDateFormat("yyyy-MM-dd").parse(pro_end));
		
		// 방금 생성된 프로젝트 번호 가져오기
		int pro_num = proDAO.create(proVO);
		TeamVO teamVO = new TeamVO();
		teamVO.setPro_num(pro_num);
		teamVO.setMem_id(createProDTO.getMem_id());
		teamDAO.addTeamCreator(teamVO);
		
		return pro_num;
	}

	@Override
	public ProVO readProjectOne(int pro_num) throws Exception {
		return proDAO.readProjectOne(pro_num);
	}

	@Override
	public int searchPro_numById(String mem_id) throws Exception {
		return proDAO.searchPro_numById(mem_id);
	}

	@Override
	public String searchMem_nameById(String mem_id) throws Exception {
		return proDAO.searchMem_nameById(mem_id);
	}

	@Override
	public List<GroupInfoDTO> searchGroupInfoByPro_num(int pro_num) throws Exception {
		return proDAO.searchGroupInfoByPro_num(pro_num);
	}

	@Override
	public List<ProVO> searchProInfoByStatus(ProVO proVO) throws Exception {
		return proDAO.searchProInfoByStatus(proVO);
	}
	
}
