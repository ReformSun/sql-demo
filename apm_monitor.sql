
-- ----------------------------
-- Table structure for "public"."alarm_filter"
-- ----------------------------
DROP TABLE IF EXISTS "public"."alarm_filter";
CREATE SEQUENCE alarm_filter_filter_rule_id_seq START 1;
CREATE TABLE "public"."alarm_filter" (
"filter_rule_id" int8 DEFAULT nextval('alarm_filter_filter_rule_id_seq'::regclass) NOT NULL,
"alarm_id" int8,
"filter_column" varchar(255),
"filter_sign" varchar(20),
"filter_condition" varchar(255),
"dataset_id" int8
)
WITH (OIDS=FALSE);
COMMENT ON TABLE "public"."alarm_filter" IS '报警设置过滤条件';
COMMENT ON COLUMN "public"."alarm_filter"."alarm_id" IS '报警唯一id';
COMMENT ON COLUMN "public"."alarm_filter"."filter_column" IS '过滤字段';
COMMENT ON COLUMN "public"."alarm_filter"."filter_sign" IS '>、>=、==、<、<=、!=、包含、不包含、IS NULL、NOT NULL';
COMMENT ON COLUMN "public"."alarm_filter"."filter_condition" IS '过滤条件值';
COMMENT ON COLUMN "public"."alarm_filter"."dataset_id" IS '数据集ID';

-- ----------------------------
-- Table structure for "public"."alarm_group"
-- ----------------------------
DROP TABLE IF EXISTS "public"."alarm_group";
CREATE SEQUENCE alarm_group_alarm_group_id_seq START 1;
CREATE TABLE "public"."alarm_group" (
"alarm_group_id" int8 DEFAULT nextval('alarm_group_alarm_group_id_seq'::regclass) NOT NULL,
"group_name" varchar(64),
"org_id" varchar(64)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."alarm_group" IS '联系人组';
COMMENT ON COLUMN "public"."alarm_group"."group_name" IS '联系人组名';
COMMENT ON COLUMN "public"."alarm_group"."org_id" IS '所属组织ID';

-- ----------------------------
-- Table structure for "public"."alarm_record"
-- ----------------------------
DROP TABLE IF EXISTS "public"."alarm_record";
CREATE SEQUENCE alarm_record_record_id_seq START 1;
CREATE TABLE "public"."alarm_record" (
"record_id" int8 DEFAULT nextval('alarm_record_record_id_seq'::regclass) NOT NULL,
"alarm_content" varchar(255),
"create_time" timestamp NOT NULL,
"alarm_level" varchar(10),
"org_id" varchar(64),
"alarm_id" int8,
"alarm_rule" varchar(255),
"alarm_name" varchar(255)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."alarm_record" IS '报警日志表';
COMMENT ON COLUMN "public"."alarm_record"."alarm_content" IS '报警内容';
COMMENT ON COLUMN "public"."alarm_record"."create_time" IS '发生时间';
COMMENT ON COLUMN "public"."alarm_record"."alarm_level" IS '报警级别 警告\致命\错误';
COMMENT ON COLUMN "public"."alarm_record"."org_id" IS '所属组织ID';
COMMENT ON COLUMN "public"."alarm_record"."alarm_id" IS '报警ID';
COMMENT ON COLUMN "public"."alarm_record"."alarm_rule" IS '报警规则';
COMMENT ON COLUMN "public"."alarm_record"."alarm_name" IS '报警名称';
-- ----------------------------
-- Table structure for "public"."alarm_rule"
-- ----------------------------
DROP TABLE IF EXISTS "public"."alarm_rule";
CREATE SEQUENCE alarm_rule_alarm_rule_id_seq START 1;
CREATE TABLE "public"."alarm_rule" (
"alarm_rule_id" int8 DEFAULT nextval('alarm_rule_alarm_rule_id_seq'::regclass) NOT NULL,
"alarm_id" int8,
"recent_minutes" int4,
"alarm_column" varchar(255),
"alarm_count_method" varchar(255),
"alarm_sign" varchar(255),
"alarm_threshold" varchar(255),
"alarm_aggregation_sql" varchar(255),
"alarm_judge_sql" varchar(255)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."alarm_rule" IS '报警规则';
COMMENT ON COLUMN "public"."alarm_rule"."alarm_id" IS '报警的唯一id';
COMMENT ON COLUMN "public"."alarm_rule"."recent_minutes" IS '最近N分钟';
COMMENT ON COLUMN "public"."alarm_rule"."alarm_column" IS '报警字段';
COMMENT ON COLUMN "public"."alarm_rule"."alarm_count_method" IS '总和/平均值/最大值/最小值';
COMMENT ON COLUMN "public"."alarm_rule"."alarm_sign" IS '大于等于/小于等于/环比上升%/环比下降%/与上小时同比上升%/与上小时同比下降%/与昨日同比上升%/与昨日同比下降%';
COMMENT ON COLUMN "public"."alarm_rule"."alarm_threshold" IS '报警阀值';
COMMENT ON COLUMN "public"."alarm_rule"."alarm_aggregation_sql" IS 'flink job 预聚合sql语句';
COMMENT ON COLUMN "public"."alarm_rule"."alarm_judge_sql" IS 'flink job条件比对sql语句';

-- ----------------------------
-- Table structure for "public"."alarm_user"
-- ----------------------------
DROP TABLE IF EXISTS "public"."alarm_user";
CREATE SEQUENCE alarm_user_alarm_user_id_seq START 1;
CREATE TABLE "public"."alarm_user" (
"alarm_user_id" int8 DEFAULT nextval('alarm_user_alarm_user_id_seq'::regclass) NOT NULL,
"phone" varchar(16),
"email" varchar(64),
"name" varchar(64),
"org_id" varchar(64)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."alarm_user" IS '联系人';
COMMENT ON COLUMN "public"."alarm_user"."phone" IS '手机号';
COMMENT ON COLUMN "public"."alarm_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."alarm_user"."name" IS '姓名';
COMMENT ON COLUMN "public"."alarm_user"."org_id" IS '所属组织ID';



-- ----------------------------
-- Table structure for "public"."alarm_user_group"
-- ----------------------------
DROP TABLE IF EXISTS "public"."alarm_user_group";
CREATE TABLE "public"."alarm_user_group" (
"alarm_user_id" int8,
"alarm_group_id" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."alarm_user_group" IS '联系人与联系人组之间的关联表';
COMMENT ON COLUMN "public"."alarm_user_group"."alarm_user_id" IS '联系人ID';
COMMENT ON COLUMN "public"."alarm_user_group"."alarm_group_id" IS '联系人组ID';


-- ----------------------------
-- Table structure for "public"."chart_index"
-- ----------------------------
DROP TABLE IF EXISTS "public"."chart_index";
CREATE SEQUENCE chart_index_chart_index_id_seq START 1;
CREATE TABLE "public"."chart_index" (
"chart_index_id" int8 DEFAULT nextval('chart_index_chart_index_id_seq'::regclass) NOT NULL,
"interaction_chart_id" int8,
"chart_index" varchar(255),
"index_alias" varchar(255)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."chart_index" IS '交互图表指标';
COMMENT ON COLUMN "public"."chart_index"."interaction_chart_id" IS '交互图表的唯一索引';
COMMENT ON COLUMN "public"."chart_index"."chart_index" IS '交互图表指标';
COMMENT ON COLUMN "public"."chart_index"."index_alias" IS '指标别名';

-- ----------------------------
-- Records of chart_index
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."dataset_complex"
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset_complex";
CREATE SEQUENCE dataset_complex_data_complex_id_seq START 1;
CREATE TABLE "public"."dataset_complex" (
"data_complex_id" int8 DEFAULT nextval('dataset_complex_data_complex_id_seq'::regclass) NOT NULL,
"dataset_id" int8,
"complex_index" varchar(255),
"complex_index_name" varchar(255),
"complex_index_column_type" varchar(20)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."dataset_complex" IS '数据集复合指标';
COMMENT ON COLUMN "public"."dataset_complex"."data_complex_id" IS '复合指标唯一索引';
COMMENT ON COLUMN "public"."dataset_complex"."dataset_id" IS 'dataset的唯一id';
COMMENT ON COLUMN "public"."dataset_complex"."complex_index" IS '复合指标技术公式';
COMMENT ON COLUMN "public"."dataset_complex"."complex_index_name" IS '复合指标别名';
COMMENT ON COLUMN "public"."dataset_complex"."complex_index_column_type" IS '复合指标字段类型';
-- ----------------------------
-- Table structure for "public"."dataset_dimension"
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset_dimension";
CREATE SEQUENCE dataset_dimension_dataset_dimension_id_seq START 1;
CREATE TABLE "public"."dataset_dimension" (
"dataset_dimension_id" int8 DEFAULT nextval('dataset_dimension_dataset_dimension_id_seq'::regclass) NOT NULL,
"dataset_id" int8,
"dimension" varchar(255),
"dimension_type" varchar(255) DEFAULT 0 NOT NULL,
"dimension_column_type" varchar(20)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."dataset_dimension" IS '数据集下钻维度';
COMMENT ON COLUMN "public"."dataset_dimension"."dataset_id" IS 'dataset的唯一id';
COMMENT ON COLUMN "public"."dataset_dimension"."dimension" IS 'dataset下钻维度';
COMMENT ON COLUMN "public"."dataset_dimension"."dimension_type" IS '维度类型0、下钻维度,1、通用维度,2、ID类维度';
COMMENT ON COLUMN "public"."dataset_dimension"."dimension_column_type" IS '维度字段类型';


-- ----------------------------
-- Table structure for "public"."dataset_filter"
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset_filter";
CREATE SEQUENCE dataset_filter_filter_rule_id_seq START 1;
CREATE TABLE "public"."dataset_filter" (
"filter_rule_id" int8 DEFAULT nextval('dataset_filter_filter_rule_id_seq'::regclass) NOT NULL,
"dataset_id" int8,
"filter_column" varchar(255),
"filter_sign" varchar(20),
"filter_condition" varchar(255),
"filter_column_type" varchar(255)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."dataset_filter" IS '数据集筛选条件';
COMMENT ON COLUMN "public"."dataset_filter"."dataset_id" IS 'dataset的唯一id';
COMMENT ON COLUMN "public"."dataset_filter"."filter_column" IS '过滤字段';
COMMENT ON COLUMN "public"."dataset_filter"."filter_sign" IS '==/!=/包含/不包含/IS NULL/NOT NULL';
COMMENT ON COLUMN "public"."dataset_filter"."filter_condition" IS '过滤条件';
COMMENT ON COLUMN "public"."dataset_filter"."filter_column_type" IS '过滤字段数据类型';


-- ----------------------------
-- Table structure for "public"."dataset_index"
-- ----------------------------
DROP TABLE IF EXISTS "public"."dataset_index";
CREATE SEQUENCE dataset_index_dataset_index_id_seq START 1;
CREATE TABLE "public"."dataset_index" (
"dataset_index_id" int8 DEFAULT nextval('dataset_index_dataset_index_id_seq'::regclass) NOT NULL,
"dataset_id" int8 NOT NULL,
"index_function" varchar(255),
"index_column" varchar(255),
"index_name" varchar(255),
"index_column_type" varchar(20)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."dataset_index" IS '数据集指标';
COMMENT ON COLUMN "public"."dataset_index"."dataset_id" IS 'dataset的唯一id';
COMMENT ON COLUMN "public"."dataset_index"."index_function" IS '指标计算函数 count/sum/max/min/count_distinct/quantitle/rate';
COMMENT ON COLUMN "public"."dataset_index"."index_column" IS '指标字段';
COMMENT ON COLUMN "public"."dataset_index"."index_name" IS '指标名称';
COMMENT ON COLUMN "public"."dataset_index"."index_column_type" IS '指标字段类型';


-- ----------------------------
-- Table structure for "public"."datasetquery"
-- ----------------------------
DROP TABLE IF EXISTS "public"."datasetquery";
CREATE SEQUENCE datasetquery_datasetquery_id_seq START 1;
CREATE TABLE "public"."datasetquery" (
"datasetquery_id" int8 DEFAULT nextval('datasetquery_datasetquery_id_seq'::regclass) NOT NULL,
"tabsql" varchar(1000) NOT NULL,
"datasetdatasql" varchar(1000),
"fieldname" varchar(1000),
"fieldnametype" varchar(1000),
"datasetid" varchar(64),
"supplementstrategy" varchar(10),
"querystrategy" varchar(10)
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."datasetquery"."datasetquery_id" IS '数据集查询的唯一id';
COMMENT ON COLUMN "public"."datasetquery"."tabsql" IS '查询DataSet表的SQL';
COMMENT ON COLUMN "public"."datasetquery"."datasetdatasql" IS 'flink执行的数据集查询语句';
COMMENT ON COLUMN "public"."datasetquery"."fieldname" IS '字段名称';
COMMENT ON COLUMN "public"."datasetquery"."fieldnametype" IS '字段类型';
COMMENT ON COLUMN "public"."datasetquery"."datasetid" IS 'dataset表名';
COMMENT ON COLUMN "public"."datasetquery"."supplementstrategy" IS '补零策略  1 否、 2 是';
COMMENT ON COLUMN "public"."datasetquery"."querystrategy" IS '查询策略  1 实时性优先、 2 齐全度优先';

-- ----------------------------
-- Table structure for "public"."flinkjob"
-- ----------------------------
DROP TABLE IF EXISTS "public"."flinkjob";
CREATE SEQUENCE flinkjob_flinkjarid_seq START 1;
CREATE TABLE "public"."flinkjob" (
"flinkjarname" varchar(255),
"entry_class" varchar(200),
"jarversion" varchar(20),
"jobtype" varchar(1),
"flinkjarid" int4 DEFAULT nextval('flinkjob_flinkjarid_seq'::regclass) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."flinkjob"."flinkjarname" IS '上传的flink运行jar包的路径';
COMMENT ON COLUMN "public"."flinkjob"."entry_class" IS 'flink运行包的入口类';
COMMENT ON COLUMN "public"."flinkjob"."jarversion" IS 'jar包版本';
COMMENT ON COLUMN "public"."flinkjob"."jobtype" IS 'job类型 0、切分，1、dataset，2、报警，3、查询';
-- ----------------------------
-- Table structure for "public"."interaction_chart"
-- ----------------------------
DROP TABLE IF EXISTS "public"."interaction_chart";
CREATE SEQUENCE interaction_chart_interaction_chart_id_seq START 1;
CREATE TABLE "public"."interaction_chart" (
"interaction_chart_id" int8 DEFAULT nextval('interaction_chart_interaction_chart_id_seq'::regclass) NOT NULL,
"chart_name" varchar(255),
"chart_type" int8,
"time_graininess" varchar(255),
"global_control" varchar(1),
"chart_paramter" varchar(1000),
"interaction_tab_id" int8,
"dataset_ids" varchar(255),
"id_dimension" varchar(255),
"dimension" varchar(1000),
"top_n" varchar(128)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."interaction_chart" IS '交互图表主表';
COMMENT ON COLUMN "public"."interaction_chart"."interaction_chart_id" IS '交互图表的唯一索引';
COMMENT ON COLUMN "public"."interaction_chart"."chart_name" IS '图表名称';
COMMENT ON COLUMN "public"."interaction_chart"."chart_type" IS '图表类型';
COMMENT ON COLUMN "public"."interaction_chart"."time_graininess" IS '时间粒度 自动判断\1分钟\5分钟\10分钟\半小时\1小时\1天';
COMMENT ON COLUMN "public"."interaction_chart"."global_control" IS '时间受全局控制 0、运行,1、禁止';
COMMENT ON COLUMN "public"."interaction_chart"."chart_paramter" IS '图表参数
翻牌器
表格
饼图
柱状图
条形图
折线图
柱状图
面积图
热点图
具体参数见文档';
COMMENT ON COLUMN "public"."interaction_chart"."interaction_tab_id" IS '关联tab的id';
COMMENT ON COLUMN "public"."interaction_chart"."dataset_ids" IS '数据集ID，多个数据集ID用,隔开';
COMMENT ON COLUMN "public"."interaction_chart"."id_dimension" IS 'ID类维度(key,value 若没有ID类维度只，则只有key)';
COMMENT ON COLUMN "public"."interaction_chart"."dimension" IS '维度([{"维度名":{"0(全部)":"all"}},{"维度名":{"1(固定值)":"值"}},{"维度名":{"2(导航树)":"值"}},{"维度名":{"3(不可用)":"no"}}])';
COMMENT ON COLUMN "public"."interaction_chart"."top_n" IS '字段名,N  禁用为null或者空';

-- ----------------------------
-- Table structure for "public"."interaction_chart_index"
-- ----------------------------
DROP TABLE IF EXISTS "public"."interaction_chart_index";
CREATE SEQUENCE interaction_chart_index_interaction_chart_index_id_seq START 1;
CREATE TABLE "public"."interaction_chart_index" (
"interaction_chart_index_id" int8 DEFAULT nextval('interaction_chart_index_interaction_chart_index_id_seq'::regclass) NOT NULL,
"index_column" varchar(255),
"index_column_type" varchar(20),
"index_name" varchar(255),
"interaction_chart_id" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."interaction_chart_index" IS '大盘图表指标';
COMMENT ON COLUMN "public"."interaction_chart_index"."interaction_chart_index_id" IS '大盘图表指标ID';
COMMENT ON COLUMN "public"."interaction_chart_index"."index_column" IS '指标字段';
COMMENT ON COLUMN "public"."interaction_chart_index"."index_column_type" IS '指标字段类型';
COMMENT ON COLUMN "public"."interaction_chart_index"."index_name" IS '别名';
COMMENT ON COLUMN "public"."interaction_chart_index"."interaction_chart_id" IS '大盘交互图表ID';



-- ----------------------------
-- Table structure for "public"."interaction_grail"
-- ----------------------------
DROP TABLE IF EXISTS "public"."interaction_grail";
CREATE SEQUENCE interaction_grail_interaction_id_seq START 1;
CREATE TABLE "public"."interaction_grail" (
"interaction_id" int8 DEFAULT nextval('interaction_grail_interaction_id_seq'::regclass) NOT NULL,
"interaction_name" varchar(255),
"create_time" timestamp,
"update_time" timestamp,
"org_id" varchar(64) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."interaction_grail" IS '交互大盘';
COMMENT ON COLUMN "public"."interaction_grail"."interaction_id" IS '交互大盘唯一id';
COMMENT ON COLUMN "public"."interaction_grail"."interaction_name" IS '大盘名称';
COMMENT ON COLUMN "public"."interaction_grail"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."interaction_grail"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."interaction_grail"."org_id" IS '所属组织ID';

-- ----------------------------
-- Table structure for "public"."interaction_tab"
-- ----------------------------
DROP TABLE IF EXISTS "public"."interaction_tab";
CREATE SEQUENCE interaction_tab_interaction_tab_id_seq START 1;
CREATE TABLE "public"."interaction_tab" (
"interaction_tab_id" int8 DEFAULT nextval('interaction_tab_interaction_tab_id_seq'::regclass) NOT NULL,
"interaction_id" int8,
"tab_name" varchar(255)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."interaction_tab" IS '交互大盘中包含的tab';
COMMENT ON COLUMN "public"."interaction_tab"."interaction_id" IS '交互大盘唯一id';
COMMENT ON COLUMN "public"."interaction_tab"."tab_name" IS 'tab名称';

-- ----------------------------
-- Table structure for "public"."map_table"
-- ----------------------------
DROP TABLE IF EXISTS "public"."map_table";
CREATE SEQUENCE map_table_model_map_id_seq START 1;
CREATE TABLE "public"."map_table" (
"map_id" int8 DEFAULT nextval('map_table_model_map_id_seq'::regclass) NOT NULL,
"map_name" varchar(255),
"text_content" text,
"map_type" varchar(10),
"describe" varchar(255),
"source_column" varchar(255),
"target_column" varchar(255),
"org_id" varchar(64) NOT NULL,
"update_time" timestamp
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."map_table" IS '映射表';
COMMENT ON COLUMN "public"."map_table"."map_name" IS '资源名称';
COMMENT ON COLUMN "public"."map_table"."text_content" IS '文本内容';
COMMENT ON COLUMN "public"."map_table"."map_type" IS '资源类型';
COMMENT ON COLUMN "public"."map_table"."describe" IS '描述';
COMMENT ON COLUMN "public"."map_table"."source_column" IS '源字段 JSON Array字符串 key=字段名 value=字段类型';
COMMENT ON COLUMN "public"."map_table"."target_column" IS '目标字段 JSON Array字符串 key=字段名 value=字段类型';
COMMENT ON COLUMN "public"."map_table"."org_id" IS '所属组织ID';
COMMENT ON COLUMN "public"."map_table"."update_time" IS '修改时间';

-- ----------------------------
-- Table structure for "public"."model_monitor"
-- ----------------------------
DROP TABLE IF EXISTS "public"."model_monitor";
CREATE SEQUENCE model_monitor_model_monitor_id_seq START 1;
CREATE TABLE "public"."model_monitor" (
"model_monitor_id" int8 DEFAULT nextval('model_monitor_model_monitor_id_seq'::regclass) NOT NULL,
"model_monitor_name" varchar(255),
"time_column" varchar,
"task_id" int8,
"org_id" varchar(64) NOT NULL,
"create_time" timestamp
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."model_monitor" IS '模式检测';
COMMENT ON COLUMN "public"."model_monitor"."model_monitor_name" IS '规则名称';
COMMENT ON COLUMN "public"."model_monitor"."time_column" IS '时间字段';
COMMENT ON COLUMN "public"."model_monitor"."task_id" IS '任务id';
COMMENT ON COLUMN "public"."model_monitor"."org_id" IS '所属组织ID';
COMMENT ON COLUMN "public"."model_monitor"."create_time" IS '创建时间';
-- ----------------------------
-- Table structure for "public"."monitor_alarm"
-- ----------------------------
DROP TABLE IF EXISTS "public"."monitor_alarm";
CREATE SEQUENCE monitor_alarm_alarm_id_seq START 1;
CREATE TABLE "public"."monitor_alarm" (
"alarm_id" int8 DEFAULT nextval('monitor_alarm_alarm_id_seq'::regclass) NOT NULL,
"alarm_name" varchar(255),
"alarm_rule" varchar(255),
"notice_method" varchar(10),
"notifer_group_id" varchar(255),
"alarm_level" varchar(10),
"availability_start" timestamp,
"availability_end" timestamp,
"notice_time_start" timestamp,
"notice_title" varchar(255),
"notice_content" text,
"org_id" varchar(64),
"update_time" timestamp,
"status" varchar(2),
"notice_time_end" timestamp,
"alarm_type" varchar(2),
"jobid" varchar(32),
"dataset_id" int8,
"alarm_integrity_rule" varchar(1000)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."monitor_alarm" IS '监控任务报警主表';
COMMENT ON COLUMN "public"."monitor_alarm"."alarm_name" IS '报警名称';
COMMENT ON COLUMN "public"."monitor_alarm"."alarm_rule" IS '报警规则  t:同时满足规则,f:满足一条规则';
COMMENT ON COLUMN "public"."monitor_alarm"."notice_method" IS '通知方式 1短信,2邮件 多种用逗号隔开';
COMMENT ON COLUMN "public"."monitor_alarm"."notifer_group_id" IS '通知对象组ID，多个组用,隔开';
COMMENT ON COLUMN "public"."monitor_alarm"."alarm_level" IS '报警级别 警告\致命\错误';
COMMENT ON COLUMN "public"."monitor_alarm"."availability_start" IS '生效开始时间';
COMMENT ON COLUMN "public"."monitor_alarm"."availability_end" IS '生效结束时间';
COMMENT ON COLUMN "public"."monitor_alarm"."notice_time_start" IS '通知开始时间';
COMMENT ON COLUMN "public"."monitor_alarm"."notice_title" IS '通知标题';
COMMENT ON COLUMN "public"."monitor_alarm"."notice_content" IS '通知内容';
COMMENT ON COLUMN "public"."monitor_alarm"."org_id" IS '所属组织ID';
COMMENT ON COLUMN "public"."monitor_alarm"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."monitor_alarm"."status" IS '状态 1、新建，2、运行中，3、已停止';
COMMENT ON COLUMN "public"."monitor_alarm"."notice_time_end" IS '通知结束时间';
COMMENT ON COLUMN "public"."monitor_alarm"."alarm_type" IS '类型  1 基于已有下钻数据集创建报警 2 基于已有通用数据集创建报警';
COMMENT ON COLUMN "public"."monitor_alarm"."jobid" IS '提交flink后返回的jobid';
COMMENT ON COLUMN "public"."monitor_alarm"."dataset_id" IS '数据集ID';
COMMENT ON COLUMN "public"."monitor_alarm"."alarm_integrity_rule" IS '报警规则，设定完报警内容拼出来的';
-- ----------------------------
-- Table structure for "public"."monitor_dataset"
-- ----------------------------
DROP TABLE IF EXISTS "public"."monitor_dataset";
CREATE SEQUENCE monitor_dataset_dataset_id_seq START 1;
CREATE TABLE "public"."monitor_dataset" (
"dataset_id" int8 DEFAULT nextval('monitor_dataset_dataset_id_seq'::regclass) NOT NULL,
"dataset_name" varchar(255),
"task_id" int8,
"time_column" varchar(255),
"sample_column" varchar(255),
"dimension_type" varchar(10),
"filter_rule" bool,
"org_id" varchar(64),
"create_time" timestamp,
"update_time" timestamp,
"jobid" varchar(32),
"dataset_sql" varchar(1000),
"dataset_table" varchar(255),
"dataset_column" varchar(1000),
"sample_column_type" varchar(20),
"kafkainputtopic" varchar(255),
"kafkaoutputtopic" varchar(255),
"status" varchar(2)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."monitor_dataset" IS '监控数据集';
COMMENT ON COLUMN "public"."monitor_dataset"."dataset_id" IS '数据集唯一标识';
COMMENT ON COLUMN "public"."monitor_dataset"."dataset_name" IS '数据集名称';
COMMENT ON COLUMN "public"."monitor_dataset"."task_id" IS '任务id';
COMMENT ON COLUMN "public"."monitor_dataset"."time_column" IS '时间字段';
COMMENT ON COLUMN "public"."monitor_dataset"."sample_column" IS '采样字段';
COMMENT ON COLUMN "public"."monitor_dataset"."dimension_type" IS '维度类型 0下钻\1通用';
COMMENT ON COLUMN "public"."monitor_dataset"."filter_rule" IS 'true同时满足规则/false满足一条规则';
COMMENT ON COLUMN "public"."monitor_dataset"."org_id" IS '所属组织ID';
COMMENT ON COLUMN "public"."monitor_dataset"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."monitor_dataset"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."monitor_dataset"."jobid" IS '提交flink后返回的jobid';
COMMENT ON COLUMN "public"."monitor_dataset"."dataset_sql" IS 'flink执行Dataset的SELECT';
COMMENT ON COLUMN "public"."monitor_dataset"."dataset_table" IS 'dataset表';
COMMENT ON COLUMN "public"."monitor_dataset"."dataset_column" IS 'Dataset的column及其类型';
COMMENT ON COLUMN "public"."monitor_dataset"."sample_column_type" IS '采样字段类型';
COMMENT ON COLUMN "public"."monitor_dataset"."kafkainputtopic" IS 'kafaka的输入topic';
COMMENT ON COLUMN "public"."monitor_dataset"."kafkaoutputtopic" IS 'kafka输出topic';
COMMENT ON COLUMN "public"."monitor_dataset"."status" IS '状态  2、运行中，3、已停止，5、正在启动，6、正在暂停';



-- ----------------------------
-- Table structure for "public"."monitor_task"
-- ----------------------------
DROP TABLE IF EXISTS "public"."monitor_task";
CREATE SEQUENCE monitor_task_task_id_seq START 1;
CREATE TABLE "public"."monitor_task" (
"task_id" int8 DEFAULT nextval('monitor_task_task_id_seq'::regclass) NOT NULL,
"task_name" varchar(255),
"task_type" int8,
"update_date" timestamp,
"status" varchar(2),
"monitor_status" varchar(2),
"source_type" varchar(50),
"source_path" varchar(255),
"coded_format" varchar(20),
"split_rule" text,
"org_id" varchar(64) NOT NULL,
"jobid" varchar(32),
"log_capture_results" text,
"kafkainputtopic" varchar(255),
"kafkaoutputtopic" varchar(255)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."monitor_task" IS '监控任务';
COMMENT ON COLUMN "public"."monitor_task"."task_name" IS '任务名称';
COMMENT ON COLUMN "public"."monitor_task"."task_type" IS '1、自定义监控，2、标准模板监控';
COMMENT ON COLUMN "public"."monitor_task"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."monitor_task"."status" IS '状态  1、新建，2、运行中，3、已停止，4、暂停，5、正在启动，6、正在暂停';
COMMENT ON COLUMN "public"."monitor_task"."monitor_status" IS '监控状态 1、正常，2、故障';
COMMENT ON COLUMN "public"."monitor_task"."source_type" IS 'loghub数据源\sdk数据源\http数据源\startagent\MQ数据源\kafka数据源';
COMMENT ON COLUMN "public"."monitor_task"."source_path" IS '数据源路径';
COMMENT ON COLUMN "public"."monitor_task"."coded_format" IS '编码设置';
COMMENT ON COLUMN "public"."monitor_task"."split_rule" IS '切分规则';
COMMENT ON COLUMN "public"."monitor_task"."org_id" IS '所属组织ID';
COMMENT ON COLUMN "public"."monitor_task"."jobid" IS '提交flink后返回的jobid';
COMMENT ON COLUMN "public"."monitor_task"."log_capture_results" IS '日志抓取结果';
COMMENT ON COLUMN "public"."monitor_task"."kafkainputtopic" IS 'kafaka的输入topic';
COMMENT ON COLUMN "public"."monitor_task"."kafkaoutputtopic" IS 'kafaka的输出topic';
-- ----------------------------
-- Table structure for "public"."navigate_tree"
-- ----------------------------
DROP TABLE IF EXISTS "public"."navigate_tree";
CREATE SEQUENCE navigate_tree_navigate_tree_id_seq START 1;
CREATE TABLE "public"."navigate_tree" (
"navigate_tree_id" int8 DEFAULT nextval('navigate_tree_navigate_tree_id_seq'::regclass),
"tree_name" varchar(255),
"dataset_type" varchar(1),
"topn" varchar(1),
"data" varchar(255),
"interaction_tab_ids" varchar(255),
"time_range" varchar(255),
"dataset_id" int8,
"interaction_id" int8
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."navigate_tree" IS '交互控件-导航树控件';
COMMENT ON COLUMN "public"."navigate_tree"."navigate_tree_id" IS '导航数唯一id';
COMMENT ON COLUMN "public"."navigate_tree"."tree_name" IS '名称';
COMMENT ON COLUMN "public"."navigate_tree"."dataset_type" IS '数据集类型 0:下钻数据集,1:平铺数据集';
COMMENT ON COLUMN "public"."navigate_tree"."topn" IS '0代表不显示topN，1代表显示topN';
COMMENT ON COLUMN "public"."navigate_tree"."data" IS '数据';
COMMENT ON COLUMN "public"."navigate_tree"."interaction_tab_ids" IS '关联tab的id,多个id用,隔开';
COMMENT ON COLUMN "public"."navigate_tree"."time_range" IS '时间范围 最近1小时\最近6小时\最近24小时\最近3天\最近7天\最近15天\最近30天';
COMMENT ON COLUMN "public"."navigate_tree"."dataset_id" IS '数据集ID';
COMMENT ON COLUMN "public"."navigate_tree"."interaction_id" IS '交互大盘ID';
-- ----------------------------
-- Table structure for "public"."task_wash_schema"
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_wash_schema";
CREATE SEQUENCE task_wash_schema_column_id_seq START 1;
CREATE TABLE "public"."task_wash_schema" (
"column_id" int8 DEFAULT nextval('task_wash_schema_column_id_seq'::regclass) NOT NULL,
"column_name" varchar(255),
"column_type" varchar(255),
"task_id" int8,
"sample_data" text
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."task_wash_schema" IS '监控任务根据清洗规则切分后保存数据表schema';
COMMENT ON COLUMN "public"."task_wash_schema"."column_name" IS '字段名称';
COMMENT ON COLUMN "public"."task_wash_schema"."column_type" IS '字段类型';
COMMENT ON COLUMN "public"."task_wash_schema"."task_id" IS '任务唯一id';
COMMENT ON COLUMN "public"."task_wash_schema"."sample_data" IS '样例数据';

-- ----------------------------
-- Records of task_wash_schema
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."users"
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE SEQUENCE users_user_id_seq START 1;
CREATE TABLE "public"."users" (
"user_id" int8 DEFAULT nextval('users_user_id_seq'::regclass) NOT NULL,
"user_name" varchar(255),
"password" varchar(255),
"info" varchar(1000),
"country" varchar(10),
"province" varchar(10),
"city" varchar(10),
"area" varchar(10),
"address" varchar(1000),
"phone" varchar(20),
"head_portrait" varchar(1000),
"state" varchar(2) DEFAULT 0,
"org_id" varchar(16),
"nick_name" varchar(255),
"create_time" timestamp
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."users" IS '用户表';
COMMENT ON COLUMN "public"."users"."user_name" IS '用户名';
COMMENT ON COLUMN "public"."users"."password" IS '密码';
COMMENT ON COLUMN "public"."users"."info" IS '简介';
COMMENT ON COLUMN "public"."users"."country" IS '国家';
COMMENT ON COLUMN "public"."users"."province" IS '省份';
COMMENT ON COLUMN "public"."users"."city" IS '城市';
COMMENT ON COLUMN "public"."users"."area" IS '地区';
COMMENT ON COLUMN "public"."users"."address" IS '详细地址';
COMMENT ON COLUMN "public"."users"."phone" IS '手机号';
COMMENT ON COLUMN "public"."users"."head_portrait" IS '头像';
COMMENT ON COLUMN "public"."users"."state" IS '状态（0，可使用  1，已删除）';
COMMENT ON COLUMN "public"."users"."org_id" IS '组织ID';
COMMENT ON COLUMN "public"."users"."nick_name" IS '昵称';
COMMENT ON COLUMN "public"."users"."create_time" IS '创建时间';

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table "public"."alarm_filter"
-- ----------------------------
ALTER TABLE "public"."alarm_filter" ADD PRIMARY KEY ("filter_rule_id");

-- ----------------------------
-- Primary Key structure for table "public"."alarm_group"
-- ----------------------------
ALTER TABLE "public"."alarm_group" ADD PRIMARY KEY ("alarm_group_id");

-- ----------------------------
-- Primary Key structure for table "public"."alarm_record"
-- ----------------------------
ALTER TABLE "public"."alarm_record" ADD PRIMARY KEY ("record_id");

-- ----------------------------
-- Primary Key structure for table "public"."alarm_rule"
-- ----------------------------
ALTER TABLE "public"."alarm_rule" ADD PRIMARY KEY ("alarm_rule_id");

-- ----------------------------
-- Primary Key structure for table "public"."alarm_user"
-- ----------------------------
ALTER TABLE "public"."alarm_user" ADD PRIMARY KEY ("alarm_user_id");

-- ----------------------------
-- Primary Key structure for table "public"."chart_index"
-- ----------------------------
ALTER TABLE "public"."chart_index" ADD PRIMARY KEY ("chart_index_id");

-- ----------------------------
-- Primary Key structure for table "public"."dataset_complex"
-- ----------------------------
ALTER TABLE "public"."dataset_complex" ADD PRIMARY KEY ("data_complex_id");

-- ----------------------------
-- Primary Key structure for table "public"."dataset_dimension"
-- ----------------------------
ALTER TABLE "public"."dataset_dimension" ADD PRIMARY KEY ("dataset_dimension_id");

-- ----------------------------
-- Primary Key structure for table "public"."dataset_filter"
-- ----------------------------
ALTER TABLE "public"."dataset_filter" ADD PRIMARY KEY ("filter_rule_id");

-- ----------------------------
-- Primary Key structure for table "public"."dataset_index"
-- ----------------------------
ALTER TABLE "public"."dataset_index" ADD PRIMARY KEY ("dataset_index_id");

-- ----------------------------
-- Primary Key structure for table "public"."datasetquery"
-- ----------------------------
ALTER TABLE "public"."datasetquery" ADD PRIMARY KEY ("datasetquery_id");

-- ----------------------------
-- Primary Key structure for table "public"."flinkjob"
-- ----------------------------
ALTER TABLE "public"."flinkjob" ADD PRIMARY KEY ("flinkjarid");

-- ----------------------------
-- Primary Key structure for table "public"."interaction_chart"
-- ----------------------------
ALTER TABLE "public"."interaction_chart" ADD PRIMARY KEY ("interaction_chart_id");

-- ----------------------------
-- Primary Key structure for table "public"."interaction_chart_index"
-- ----------------------------
ALTER TABLE "public"."interaction_chart_index" ADD PRIMARY KEY ("interaction_chart_index_id");

-- ----------------------------
-- Primary Key structure for table "public"."interaction_grail"
-- ----------------------------
ALTER TABLE "public"."interaction_grail" ADD PRIMARY KEY ("interaction_id");

-- ----------------------------
-- Primary Key structure for table "public"."interaction_tab"
-- ----------------------------
ALTER TABLE "public"."interaction_tab" ADD PRIMARY KEY ("interaction_tab_id");

-- ----------------------------
-- Primary Key structure for table "public"."map_table"
-- ----------------------------
ALTER TABLE "public"."map_table" ADD PRIMARY KEY ("map_id");

-- ----------------------------
-- Primary Key structure for table "public"."model_monitor"
-- ----------------------------
ALTER TABLE "public"."model_monitor" ADD PRIMARY KEY ("model_monitor_id");

-- ----------------------------
-- Primary Key structure for table "public"."monitor_alarm"
-- ----------------------------
ALTER TABLE "public"."monitor_alarm" ADD PRIMARY KEY ("alarm_id");

-- ----------------------------
-- Primary Key structure for table "public"."monitor_dataset"
-- ----------------------------
ALTER TABLE "public"."monitor_dataset" ADD PRIMARY KEY ("dataset_id");

-- ----------------------------
-- Primary Key structure for table "public"."monitor_task"
-- ----------------------------
ALTER TABLE "public"."monitor_task" ADD PRIMARY KEY ("task_id");

-- ----------------------------
-- Primary Key structure for table "public"."task_wash_schema"
-- ----------------------------
ALTER TABLE "public"."task_wash_schema" ADD PRIMARY KEY ("column_id");

-- ----------------------------
-- Primary Key structure for table "public"."users"
-- ----------------------------
ALTER TABLE "public"."users" ADD PRIMARY KEY ("user_id");
