package com.hsuforum.eass.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsuforum.common.service.impl.BaseJpaServiceImpl;
import com.hsuforum.eass.dao.schedule.JobExecuteLogJpaRepository;
import com.hsuforum.eass.entity.schedule.JobExecuteLog;
import com.hsuforum.eass.service.JobExecuteLogJpaService;

import lombok.extern.slf4j.Slf4j;
@Service("jobRunningLogJpaService")
@Slf4j
public class JobExecuteLogJpaServiceImpl extends BaseJpaServiceImpl<JobExecuteLog, String, JobExecuteLogJpaRepository>
		implements JobExecuteLogJpaService {

	private static final long serialVersionUID = 7390409841076847717L;
	@Autowired
	private JobExecuteLogJpaRepository repo;

	@Override
	public JobExecuteLogJpaRepository getRepo() {

		return this.repo;
	}

	@Override
	public void setRepo(JobExecuteLogJpaRepository repo) {
		this.repo = repo;

	}

}
