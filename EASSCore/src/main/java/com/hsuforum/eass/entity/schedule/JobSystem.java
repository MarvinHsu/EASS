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
@Table(name = "TB_JOB_SYSTEMS")
@EntityListeners({ SystemDateEntityListener.class })
@NamedQuery(name = "JobSystem.findAll", query = "SELECT j FROM JobSystem j")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper=false)
@NoArgsConstructor
@AllArgsConstructor
public class JobSystem  extends BaseEntityImpl<String> {
	public static JobSystem EAS = new JobSystem("10000008-0000-0000-0000-000000000001", "Enterprise Application Stack", "EAS");
	public static JobSystem EASJavaJSFTemplate = new JobSystem("10000008-0000-0000-0000-0000000000021", "Java JSF Template System", "EASJavaJSFTemplate");
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "ID", unique = true, nullable = false, length = 36)
	@EqualsAndHashCode.Include()
	private String id;
	@Column(name = "CODE", nullable = false, length = 20)
	private String code;
	@Column(name = "NAME", nullable = false)
	private String name;

}
