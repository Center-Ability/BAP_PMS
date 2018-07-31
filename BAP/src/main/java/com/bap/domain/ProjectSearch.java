package com.bap.domain;

import java.util.List;

public class ProjectSearch {
	
	private List<ProVO> proVO;

	public List<ProVO> getProVO() {
		return proVO;
	}

	public void setProVO(List<ProVO> proVO) {
		this.proVO = proVO;
	}

	@Override
	public String toString() {
		return "ProjectSearch [proVO=" + proVO + "]";
	}
	
}
