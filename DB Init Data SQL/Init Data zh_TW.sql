INSERT INTO TB_JOB_SYSTEMS (ID, NAME, CODE) VALUES( '10000008-0000-0000-0000-000000000001', 'Enterprise Application Stack', 'EAS');
INSERT INTO TB_JOB_SYSTEMS (ID, NAME, CODE) VALUES( '10000008-0000-0000-0000-000000000002', 'Java JSF樣板系統', 'EASJavaJSFTemplate');

INSERT INTO TB_JOB_EXECUTE_STATUS (ID, NAME, CODE) VALUES( '10000009-0000-0000-0000-000000000001', '成功', 'S');
INSERT INTO TB_JOB_EXECUTE_STATUS (ID, NAME, CODE) VALUES( '10000009-0000-0000-0000-000000000002', '失敗', 'F');
INSERT INTO TB_JOB_EXECUTE_STATUS (ID, NAME, CODE) VALUES( '10000009-0000-0000-0000-000000000003', '部份成功', 'PS');

INSERT INTO TB_JOBS (ID, TB_JOB_SYSTEMS_ID, NAME, CODE, CLASS_NAME, JOB_DETAIL_BEAN_NAME) VALUES( '10000010-0000-0000-0000-000000000001', '10000008-0000-0000-0000-000000000001', 'SampleCornJob範例', 'SampleCornJob', 'com.hsuforum.eas.job.SampleCornJob', 'sampleCornJobDetail');
INSERT INTO TB_JOBS (ID, TB_JOB_SYSTEMS_ID, NAME, CODE, CLASS_NAME, JOB_DETAIL_BEAN_NAME) VALUES( '10000010-0000-0000-0000-000000000002', '10000008-0000-0000-0000-000000000001', 'SampleJob範例', 'SampleJob', 'com.hsuforum.eas.job.SampleJob', 'sampleJobDetail');
INSERT INTO TB_JOBS (ID, TB_JOB_SYSTEMS_ID, NAME, CODE, CLASS_NAME, JOB_DETAIL_BEAN_NAME) VALUES( '10000010-0000-0000-0000-000000000003', '10000008-0000-0000-0000-000000000002', 'SampleCornJob範例', 'SampleCornJob', 'com.hsuforum.easjavatemplate.job.SampleCornJob', 'sampleCornJobDetail');
INSERT INTO TB_JOBS (ID, TB_JOB_SYSTEMS_ID, NAME, CODE, CLASS_NAME, JOB_DETAIL_BEAN_NAME) VALUES( '10000010-0000-0000-0000-000000000004', '10000008-0000-0000-0000-000000000002', 'SampleJob範例', 'SampleJob', 'com.hsuforum.easjavatemplate.job.SampleJob', 'sampleJobDetail');
