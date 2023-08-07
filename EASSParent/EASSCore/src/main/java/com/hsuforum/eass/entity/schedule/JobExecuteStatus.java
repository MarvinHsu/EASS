package com.hsuforum.eass.entity.schedule;

import com.hsuforum.common.entity.impl.BaseEntityImpl;
import com.hsuforum.common.entity.impl.SystemDateEntityListener;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
@Entity
@Table(name = "TB_JOB_EXECUTE_STATUS")
@EntityListeners({ SystemDateEntityListener.class })
@NamedQuery(name = "JobExecuteStatus.findAll", query = "SELECT j FROM JobExecuteStatus j")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper=false)
@NoArgsConstructor
@AllArgsConstructor
public class JobExecuteStatus  extends BaseEntityImpl<String> {
	private static final long serialVersionUID = 1L;
	public static JobExecuteStatus Success= new JobExecuteStatus("10000009-0000-0000-0000-000000000001", "Success", "S");
	public static JobExecuteStatus Fail= new JobExecuteStatus("10000009-0000-0000-0000-000000000002", "Fail", "F");
	public static JobExecuteStatus Partial_Success= new JobExecuteStatus("10000009-0000-0000-0000-000000000003", "Partial Success", "PS");
	@Id
	@Column(name = "ID", unique = true, nullable = false, length = 36)
	@EqualsAndHashCode.Include()
	private String id;
	@Column(name = "CODE", nullable = false, length = 20)
	private String code;
	@Column(name = "NAME", nullable = false)
	private String name;
}
