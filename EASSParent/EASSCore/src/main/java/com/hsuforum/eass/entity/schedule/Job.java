package com.hsuforum.eass.entity.schedule;

import java.util.Date;

import com.hsuforum.common.entity.SystemDateOperation;
import com.hsuforum.common.entity.impl.BaseEntityImpl;
import com.hsuforum.common.entity.impl.SystemDateEntityListener;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Entity
@Table(name = "TB_JOBS")
@EntityListeners({ SystemDateEntityListener.class })
@NamedQuery(name = "job.findAll", query = "SELECT j FROM Job j")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper=false)
@NoArgsConstructor
@AllArgsConstructor
public class Job extends BaseEntityImpl<String> implements SystemDateOperation {
	private static final long serialVersionUID = 1L;
	public static Job SampleCornJob= new Job("10000010-0000-0000-0000-000000000001", "SampleCornJob", "SampleCornJob", "com.hsuforum.eas.job.SampleCornJob", "sampleCornJobDetail", new Date(), null, JobSystem.EAS);
	public static Job SampleJob= new Job("10000010-0000-0000-0000-000000000002", "SampleJob", "SampleJob", "com.hsuforum.eas.job.SampleJob", "sampleJobDetail", new Date(), null, JobSystem.EAS);
	@Id
	@Column(name = "ID", nullable = false)
	@EqualsAndHashCode.Include()
	private String id;
	@EqualsAndHashCode.Include()
	@Column(name = "CODE", nullable = false, length = 20)
	private String code;
	@Column(name = "NAME", nullable = false)
	private String name;
	@Column(name = "CLASS_NAME", nullable = false, length = 200)
	private String className;
	@Column(name = "JOB_DETAIL_BEAN_NAME", nullable = false, length = 80)
	private String jobDetailBeanName;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_DATE")
	private Date createDate;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "UPDATE_DATE")
	private Date updateDate;
	@EqualsAndHashCode.Include()
	// bi-directional many-to-one association to Function
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TB_JOB_SYSTEMS_ID")
	private JobSystem jobSystem;
	
	
	
}
