-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: studentboot
-- ------------------------------------------------------
-- Server version	5.7.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'d:/upload//processDefiniton/2020/01/12/a933937eab428d5c21c7f14bb6ce0ef6.bpmn','1',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1578711271300\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"allowance\" isClosed=\"false\" isExecutable=\"true\" name=\"补贴申请\" processType=\"None\">\r\n    <startEvent id=\"begin\" name=\"开始\"></startEvent>\r\n    <userTask activiti:assignee=\"#{username}\" activiti:exclusive=\"true\" id=\"selfVerify\" name=\"申请人办理\">\r\n    </userTask>\r\n    <endEvent id=\"end\" name=\"结束\"/>\r\n    <sequenceFlow id=\"_5\" name=\"发起申请\" sourceRef=\"begin\" targetRef=\"selfVerify\"/>\r\n    <userTask activiti:exclusive=\"true\" id=\"leaderVerify\" name=\"主管审核\">\r\n      <extensionElements>\r\n        <activiti:taskListener event=\"create\" class=\"com.ruoyi.process.allowance.listener.MyTaskListener\">\r\n		</activiti:taskListener>\r\n      </extensionElements>\r\n    </userTask>\r\n    <sequenceFlow id=\"_8\" name=\"提交\" sourceRef=\"selfVerify\" targetRef=\"leaderVerify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'提交\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_9\" name=\"同意\" sourceRef=\"leaderVerify\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_6\" name=\"放弃\" sourceRef=\"selfVerify\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'撤回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_10\" name=\"不同意\" sourceRef=\"leaderVerify\" targetRef=\"selfVerify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"allowance\">\r\n      <bpmndi:BPMNShape bpmnElement=\"begin\" id=\"Shape-begin\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"215.0\" y=\"30.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"selfVerify\" id=\"Shape-selfVerify\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"155.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"215.0\" y=\"415.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"leaderVerify\" id=\"Shape-leaderVerify\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"290.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"_2\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"231.0\" y=\"62.0\"/>\r\n        <omgdi:waypoint x=\"231.0\" y=\"155.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_3\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"190.0\" y=\"182.5\"/>\r\n        <omgdi:waypoint x=\"125.0\" y=\"305.0\"/>\r\n        <omgdi:waypoint x=\"215.0\" y=\"431.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_3\" targetElement=\"_7\">\r\n        <omgdi:waypoint x=\"232.5\" y=\"210.0\"/>\r\n        <omgdi:waypoint x=\"232.5\" y=\"290.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_7\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"231.0\" y=\"345.0\"/>\r\n        <omgdi:waypoint x=\"231.0\" y=\"415.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_7\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"317.5\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"250.0\"/>\r\n        <omgdi:waypoint x=\"275.0\" y=\"182.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2502',1,'d:/upload//processDefiniton/2020/01/12/f889091233f599a141f845b41642e9fc.bpmn','2501',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1578711271300\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"allowance\" isClosed=\"false\" isExecutable=\"true\" name=\"补贴申请\" processType=\"None\">\r\n    <startEvent id=\"begin\" name=\"开始\"></startEvent>\r\n    <userTask activiti:assignee=\"#{username}\" activiti:exclusive=\"true\" id=\"selfVerify\" name=\"申请人办理\">\r\n    </userTask>\r\n    <endEvent id=\"end\" name=\"结束\"/>\r\n    <sequenceFlow id=\"_5\" name=\"发起申请\" sourceRef=\"begin\" targetRef=\"selfVerify\"/>\r\n    <userTask activiti:exclusive=\"true\" id=\"leaderVerify\" name=\"主管审核\">\r\n      <extensionElements>\r\n        <activiti:taskListener event=\"create\" class=\"com.yangzc.studentboot.workflow.allowance.listener.MyTaskListener\">\r\n		</activiti:taskListener>\r\n      </extensionElements>\r\n    </userTask>\r\n    <sequenceFlow id=\"_8\" name=\"提交\" sourceRef=\"selfVerify\" targetRef=\"leaderVerify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'提交\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_9\" name=\"同意\" sourceRef=\"leaderVerify\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_6\" name=\"放弃\" sourceRef=\"selfVerify\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'撤回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_10\" name=\"不同意\" sourceRef=\"leaderVerify\" targetRef=\"selfVerify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"allowance\">\r\n      <bpmndi:BPMNShape bpmnElement=\"begin\" id=\"Shape-begin\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"215.0\" y=\"30.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"selfVerify\" id=\"Shape-selfVerify\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"155.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"215.0\" y=\"415.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"leaderVerify\" id=\"Shape-leaderVerify\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"290.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"_2\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"231.0\" y=\"62.0\"/>\r\n        <omgdi:waypoint x=\"231.0\" y=\"155.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_3\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"190.0\" y=\"182.5\"/>\r\n        <omgdi:waypoint x=\"125.0\" y=\"305.0\"/>\r\n        <omgdi:waypoint x=\"215.0\" y=\"431.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_3\" targetElement=\"_7\">\r\n        <omgdi:waypoint x=\"232.5\" y=\"210.0\"/>\r\n        <omgdi:waypoint x=\"232.5\" y=\"290.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_7\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"231.0\" y=\"345.0\"/>\r\n        <omgdi:waypoint x=\"231.0\" y=\"415.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_7\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"317.5\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"250.0\"/>\r\n        <omgdi:waypoint x=\"275.0\" y=\"182.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2503',1,'d:/upload//processDefiniton/2020/01/12/f889091233f599a141f845b41642e9fc.allowance.png','2501',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0c\0\0\�\0\0\0PEXi\0\0\�IDATx\�\�\�lTם\�qTUUT�V��\ZUQ\�J��������VQ�**jڢF؞��\�`b\�%Q\�X摆ȋ�ZR�RmH�\�nLl��&�dy9�@y�\�#`�{\���d��=�g\�\�\��#�x�3�3?�\�\�{ƌ\0\0\0W��\�4�u;\0 ��}-ӷ\0c\0 �\0�1\0\�T\0�#�)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��1f\�\r\�]�bťe˖\�\�Νk\nM~~�)((0�\��)++\�Z�`A\�9s�b\0�F\'O����\�+\�\�>3s\�L�f\�\Z�m\�6s\�\�)\�\�\�nTWW�inn6;v\�0�����1c��5kV���t�\�87PE\0�L�����3�g\�626�w\�\Z��jhh02�6ӦM32�^@E`�\�g�}6VRRbv\�\�iFc���fΜ9\�{\�9]XX8�\�@\nZ[[甕��\�˗��/�t\�v�~�{\��K\�\0�X�xɒ%���ۤ[EE�ΐύ7\�:�\r\0\���&t�� \��\�3ϘI�&�\�\00\0��N{\�\�jMֲ�1cF\�q��\0�\��jBWLd�~��F{\�@]G�\�ײ\�\�G\�\�\�\�_O�`\�Wg\�\�	ٚ�ڷo����>\�\0QUU�7=�.�\�%SXX\���q\0�^kBOq�\�駟n\�\�ϯ\�(\0<�\�^k�[�vK\�(\0<���^�ǆ3g\�\�$�;9\n\0O/\�{��l\�\�%89\n\0O\�\�&\�\0Ĕ)SlΌc�1\0�x�Zϸ�����1\0����N[�)6l\�\�\�j\n\0�-:jk�qYYY\�@̙3\�.ݳ\�\�xz:4g\���rO��MQ__�-\n�M\0�y\�MK�.\�j7q\�6\0H��\�}�\�1\�\�9>�\�3:+\�z\�\0\�ϬY�\���\�飭��\'�t�\�\0$1cƌSO?�t&?̋\�}4�\�\�CT\0�\�\�d�|fŊ�\�Xii\�1]W�m�\r\0Crqqq�O>i._���\�Ľ�ޫ\��O\0\�䂂�CӧO�\�ڵk\�\�i�X[̈`�C�I�&u���_\�PN\�\�\�?n\�t|\�\��h\�lVf�\�\�\�\�ɓc˖-k�\������z�zĽW_Ӌ�����g�g=�NCX\�Ӗ\0�4�p-�Q-\��\�_gF���e\�\�)ΜY\0\�\rh3��oR	\0�\�\�\�\�ߦ\0`9�Y%\0.\�	&\\O%\0�n\�&N��=*\0�\�\�XQQ\�MT\0,�qaa\��\0X\�8NONN\��\0\�\�[�\0X���ߝ��w+�\0\0�a�;<��J\0�\�0v\�6*\0vø+\n��J\0�\�0\��\�\�\0\�\r\���\0`�̊;\"�\�\�\0؝�\�ȥ\0`7�\�A%\0�n_\�혨\0Xc�\�E%\0��p8|Q�n*\0vg\�df<�J\0�ݙ�y	\�9T\0,�Y�P(t?�\0\0�dV|V\��A*\0�\�\�H$RJ%\0�n7K�S	\0�(??�Iy�\0\0�a|J\�cT\0\�q�̌�P	\0�\�q�\�P\�)*\0vg\�G%���\0`7�\�XA%\0�n�#��\0`7�\�XM%\0�n\�8Ο�\0\�\r\�}2^�\0`Q8n�0~�J\0�\�0\�-a�&�\0\0�a�\�q��R	\0�ƟJ�C%\0�n\�0^G%\0�no�0�;�\0\0����\�%�+�\0\�\r\�%���\0X\�8\�\�5T\0,\� \�@�\0`Q~~~��:*\0v\�x���T\0,\�em���J\0�\�0^�\'~P	\0�(??�]�P	\0�\�ke\�\0`7�\�\�\�hR	\0�Ư\�\�\0\�\r\�Wd|F%\0�n����R	\0�ƫe�\0`Q8^)a�*\0v\��y\�qS	\0�\�\�ef|�J\0�E�P\�)��\0`wf�DfƍT\0,�Y�b	\�T\0,�D\"�dv\�D%\0�n�K7S	\0�ƥ\�-T\0,\�\�\�H\�*\09�3W\���\0\0�3\�9\�p�<�\0\0�3\�\��\0\�\r\�\�2.R	\0�Hf\�Se�R	\0�\�2.Q	\0�\�\�mT\0,\n�\�y�1\0X\n�\�0n�\0`��odtP	\0�(��0\�\0`Qnn\�\�\�tQ	\0�(\n�\\f\�W�\0X�F@�\�\�	f���\0�I�=\�\rc]\�F�\0�\�\��(�,�\�˒�q4\Z\rS!\0\�\�\�u�0f�h\0\�r?\�?��B�T\0�\�\��,\0d&\\�0+.�\"\0`yvL%\0��P(�0a�׌1\�:t\�x}}�ٸq����b�`TWW�͛7\�dT�0l\Z\�uuu���\�tvv2F1ZZZLmmmL�y�,\0â3b�8��,3e��`x�5A��whۂW�a\�\� @	c\0	\�K_�2�v�1\r\���o�\Z\�K\�R��o4{7��]�\�g\�\��6�0��0>ް\� \�\'\Z\���1�l��MO$\rc��\0&�d!��V\�O\Z\�zL �	c\0�c]=�,��6�0��0>�eE\�0\�\�`\�@\��l\�n����k[�5��\0&�d!�u��\�k\�X�F�\�\0�\�\��֊k[�5��\0&�d8���/�<��g��qa Sa,3\�Sj̞\�ҤA\�;�\�\�\�e�LHc5f�L\�B�2l�L\�\0\�\�#\r\�\�A\�\0\�\�\�\0aL ��1\00@3c\0�1a�0f\�\0c\�\0a�\�p��p�\�v\�@`\�x��پ�0@\�\0@\�\0c\�\0c\�\0aL@�\�xK\�\0�ns\�\0Ƅ1\00\00@\�\0@\�\0c\�\0c\�\0aL\�\0c\�\0a\� �Ƅ1\0A �	c\0�1�00\n7n$@\�<\�{\�=\���\�\�\��477�i\Z<�FM8�\�h\�\�\�?+「z��\�X\�8NInn\�\�\�ƍ��W!�1555�\�\�\�\�N�>=�:{�lƃ���\�\�A|\�ĉ�\�\�\�WV�X�^�פ0\�\�\0�&����\��:S���\��\�_7����� 7�\Z.\�֭3�~�\�\�۷�\�˗�w\�y\'c���\�)�\\�5�z�*�C�Н��\0����p�G��Z�\�]wݵ\�\�g�\�ܴi�9��\�u�\�Q\r��L=���\�Ν�\�}��J\�f\�	\��\0�L�\��cϾ}���W�Ȭ�J8n\�\�c8v\�ء\��ںuk��\�b/\�.��:IǢ\�\�OyuHIQQ\�M3gΌ�!lذ�C-\�\�chmm\�\�\�\�\�s�\����y\�\�@�\���&M�^e\0R�\�=�\�W�\n\�+V\��\�f\�1455]s�_~�e�\�N/\�P?��\�mO\�\�Ǐ���&Q���\�q\��̫\r@R��j\�ڵ]C�qIII,��?�1\�}���\�:�,�B�\�h�7�h\�\�Xg\�2�d<\�+@��qŶm\�:bm!L�2\�L�\�[��-\�\�\�I\�7��x�\�+K\��;��\��H<�i]\0���\n]\�\�\�\�=X���\��6\��\�\�\�\�:Ԍ��\�\��a\�;^���J�ϭ�\nZ\0���mmm�~��gϞX(z0\���e˖��\�ttt\\]:�A痚Ӻ\0p�3f4j;` \�\�\�z\�owyy�\�\�\���oJ\�\Zƿ��\�yef<���\0_y\�\'\�ï��3�=䧞z\�D�\�z��L��}\�7���\�A�U��O\'�u\�U�V\�>�쳫+JJJ�7|Ag�999�d\���B:�}x\��D:����\����\�[���X��������m6ǒ%Kv�o���\�_h?;hǄ\�@v\�\�M\���cچ���\�I8\�\��`\��\�x�.\0�f��\��$�\��\�3{�\�\�Ν3���ʵ)h]\0M�\�+\n�\�M�kժU-z	Myl\'9J}���o��诿\�\��ش-�=l�P�#\���G\�M�3y3w\�x\�ų@������\�~_¸#\n�\��\�I�V\'Z�\�\�\�\���\�8缰T�0N��{��\�j���\�$���\�\�� �\�S�ev��<^\�x䵣u��\����<!�\�\�\�\�L���e\"�H�.a��K��\0!�Ӏ\�\�2#\�ә��t\�\�	\��֓\�`�^\�R\�\�\�x�GÃ0N3Z@�M�<�Fݥ8\n���gr�q�к\0����X/�yVf>;��<\�Ԙ\���7\�A�����0��\���\0�\�\�O�0\�z<\�8�h]\0\��\��F�F�?�\��!�\�ԝ\�0�7\�C�_3\��\�9Ɩк\0FZ��\�3}��c\�h]\0)\�\�˻U\�K?\�\�2��{�� ��\'~O\�\�X\�\�\0 �]�\�0\0\�EYf\�g\�M�\�ǳ1\�؅h]\0}�\�s	⦼��oưt|h] �o��~YKL{���\�W\�����\�\0�\�!�=�\��6#�/��D\"�_\��\�\�;f_�.d\�p�\�B�;\�\n\�\��0��\����7\�\���?�8�+��B\�\'�\�\�\�\��=o\�؃3c\�\�Kg\��篨|C^\�7H�ɋ��\�&�=\"\�3>I\���k�\�\�\"a\�\�Ya\�r�zB�S5�)\�k�\�\�//�\�~^KL{��|ݒ`�1�\�U2.|7�ov\�؅hI HA���%\�\�ɹ%\�3/\�\�EhI P\�׾}��B�	�\ZL�\�XВ@ph\0ǯK\\B5c7�%���D\"�?\��y�A\�FK��k�\�EY\��T�0vA\�iI xtٚ\�<�兿�j\�6ђ@�\�	�\�o\�<�al-	\�\�p��ڴMA5cK5�%���	�Ӌ�\�wT�0\�6Z�W3\�\��\���j\�\�DK�\�\�\�\�ϥ\Z�q�\�IK�ψ_K��j\�\�BKH��\�MDu3Q�Ag-	�]K,o�&�S\r\�8K��%�\�\�+o�3�%&�3���D(���%�8q\���a�)�$�A\�l���.//\�V�Ag�N�$�A�xf|-�D�Ag-	`2�U��R\r\�8\�hI\0)�F�?ҙ�̌�D5\�Ԅ�0�	&\\_K��j\�\�DKH\����)o�S2P\r\�8]hI\0\��]2\��j\�iz��$�\�7\�:yôO�<�F�A�-	`\�W\�e�\�F�?�\Z�\n^=]\�1.ђ\00Ќxz���G5F\�C��\�y-	\0����2t-�\�T#m�\�2H���\��$�Q\�\�\��a|-�Fvf\�R\�\�^xڮZ�l�����z,_�\�,\\��Ϙ7o�>�m�$�\�\�\���\�\�dl�\Z	\�zǗ�2+~��\��������\\�\�В\0F(���Qfi�F�f\�^\�\�.ߛ7o2��;f�L��G��\�%α�8\�|ҋ�\�_|qG*�⊊�.�20� ~G\�\��>\�\�,�	OKc\�|�\�\�\�0d766꬘\�\0#�%��XƿS��͎����2+^�fͻ�̊�.]\Zc\�`��4]\��F\�T#�a\\\�3��\�\�3d:t(&��J�.0L����k�i��d\�u\n\�\�\�\�\�ƍMUUc���\�l޼9&�B\��̊-Zd���n\�oF|s|!�\�~z^\Z\�uuu���\�tvv2F1ZZZLmmm\��\�ñ���\���\��j\��Caa\�Xy\�\\� \�\�\�3b�8}c߾}ל�2u\�T3{�\�>C���i�\�R�k�%�O8�sX��~{~ښ D\�;\�{\�=.���\�l>� >����O~|~\�\�$@\�;���s�4����q��?dI5�/}y\�ڱ\�4T/�:���k�/ad:�\�Zb�_+ �0n=\�h�n(3��>�\�Я\�m0ad�515��-\��\�JoXwM��\r\�	`\�\�Ȍ�?�2��H�<\�7�0޷鉤a����1�V���?� \�@~5(\�9�0\�[5?i\�m0a�3�\�J_�0�\��&�	c�M�!A|\\��\��%m\�\�da����1�\�\�e|ĭnR	\�[V$\rc��\0&��t�\�\'.((�� >�T\��l\�n����k[�5��\0&��Q	�\�O\�Zb\�qnj\rR=\�\��\�/_\��50FE����<\�:�\�\��֊k[�5��\0&��\�Ό�\�w\��	a��\�/�<��g��qa�#�+e\\�0a\���q\�\��5fOei\� \��w�\�2K&��Q���A�L昀-kK\�C͆�%\�@F\�\�1ui�/?�0Ne6<\�,�0&��Ѵ+�n�$�z�4�{aL�mW�F/\n�\�	r3c�:	\�\��sAE\"�7t��ɓ\'\�H3c�n\�b������o\�\��DCX\�XC�0fƀEڦ\�v��-caX�\�\�?\�{�0fƀ\�@�GY��\�\��HO��r3a<�!w;\�\�\�\�1\�qz���6��Oƣ\����\�\�	c����\�Ƅ1aX��\�\�Kn\�7	c0\�+~�(�\�1aLv9\�8����Ƅ1a\�\r\�ǽ�maL�\��m�X\�F~�!{v\�&N� �\���M�1a��]\�\�m�c\��c�\�s\�6Ƅ1\�K^۶�0&�\��ҶM�1a��e\�m�c\��5�l\�Dƀ\�ya\�&0�\�\�6Ƅ1�@v\�M�1a�[�m\"�	c pܸmaLA\�m�c\�$�m\�D\�@�\��ٶi\�ƍ(a:�]�mS]]]Oss3!��q\�ĉ�Ɲ�\�o��m�jjj�����>}\�\�!\�\�\�\� ����\"c�n�cܰm��\��\�]\�_�\�8>��C�x�b�v\�Z\�\�\��1\�\��g�mʴ\�{.\�F[)EEE������M�\�8\�\r�7o���u\�֙\�\�\�۩�L�+<�mS��7\�ŋ�����f�\��.//?Iu\0d��mʔ\�ӧ\�\�D�~�)�c\0�\�m�2�[Beb{���+W�\� 㼴mS�x٢E�z\� t�[yyy.�\0\�m�2�ͅ��!\�\�յ�*�q^ٶ)�T9r�g�0���1���cy�\0\�8/l۔	����\�\�\�I���\�\�f\�o�\n�5n߶)t�ĺu\�~��\�o^\��F �vۦL�:ujmkk\�5����\�c�=v3�\n\0V�uۦLѓ>֬YӧW��E��\�\��j\0`��m\�$\�qf:t\�\�0^�v\�	^\0\��u\�6e\�O\�iлw\�f�\0�p۶M�VTTt\�[o�e\�Ν\��\�\�*nڶ)KϷ\�qVP\0pe@�bۦl�\�fk������l}ۦl�:s\�9�\�p�\���MY����\���a\�\�m��g,��#\r�\���mS$Y$?l�8\�\0\\\�\�\�69��X�\�-�̯�ܶI/8/\�\�8G�g�q\�&	\�\��rtx�߶m�0~\�q�\�Y\0�\�m�$���\�q\0�?m\�$\�\�E�sTx�_�m�\����\�8�\0<\�\�6\��p8���	�\�\�\�m�\�����N�$\0\���M�ߕ�	G�/xu\�&�\��Mf\�q��\'�m\�+\�\�c�\���\r/n\�$A\\-����W��m�<\�Z�8r\0�ȞٶIg\�:;\��k {b\�&\�e7l\0\�m�$��\�X\�\�\�����m\�5ƺ֘#�\�ܾm��}�g\�q�\0����m�ǵW\�\�%\0�\�\�m��mz\�6���p\�Mz-c\�q�\�\�(n۶I�X?`\\ő8nڶI��\�}�8*\0\�M\�6\�\�\�\�\�pT\0�[�m\�5\���rD\0��m��?)3\�\�\r\0Ad�\�6\��6\�\�xG@\�\�ܶ)޻~��\0\0c\�m\�$�yF\�C\0���m�\�9\n�\��\0gcۦ�E�\��\0\�7��m�̌/ʘN\�\�\�@\�ڶMr�\�\�\�\00pHfe\�&�����W\0X��m�$�\�\�>�6\0�ݶI�����;*\r\0�H\�M999�8�s��z�&�\�)��+*\r\0C\�^Ӳm����>&\�\��ȸPXX8���\0ұmS4\Z�\� a|uH`��j� ұmS�\���.�cV\0)H�m�\�z\�r[\�hf\�̊`��ۯ�m�m�Θ\�\���{	\���q7�b\0�\�m�d��0���7�}(�s�0^Me`��M!3\�\�\0}ߙ)ήO&���TB\0�@\�	\�F�Iz�\�SlULK�7�QU\0�����$<\�Y�֔\��ҿ��f���ߥ�\0�\"m%\�tC��o�_\�\�d\�\��͝�?��qVF��\�\�\�<\0:�_\�K_�^��޿��@\�\�j%`��:\���c=c/�{\0�k�š�\�kh\�U\�$�\�pB8ɨg�\0C\�٫\�~\�\�\�\�o���5}\�3g�U�V�m۶�\�\�F\�\�\�n��\�\�\�l>�\��\�K/�����\�m�$�j@\n$4\�e\�\�\'H\�͛w5h���M�v\�\�iJKK��rL���\0��Ķ�����\�\��UVV�\�\�\���d\0���{�q,�%�\�_�t8r䈙={v�2-\0\�\'�¢=1���N��Y{\�|�\0}\�����t͈�!�kYl��\00\�uĉ}b\�g����\�\�\�(\0<]Җ�j���\�d\�C=�خh\�(\04\�\'�Y�\�ײa�\�\�}\�\�K\�\�\0G��%~h7�%lÕxbH*;�\0��[u���z�j�M���j�ӥ9\Z\0�\�-����8g��DZ\�9\Z\0+\�Z\�ԩSY\rc]w�x�M�� ό�\�ދ�d�\�_\��s4\0\�2l ���1\0�=c\0p\�̘\�\0\��0f�1\0��M�\�\�x�\�wg\��\�kSh��kS\0��V\��ī�ecv��7Wm�1_]\�X�A\�z\�\0`v\\���>�L�\�N\00݋N��\��x�f\�b<\0�\�֜خH�\�ЉA\�\�\�\00x ?�\�ڲ\��h>\�\�q�քΊPm\0F ���عs簗�����	a��1\0�e�\�CNl]\�z;v\�z-�ދ\�\�\��\�3\�O\�H\�Ӛ\0�a\�\�WY�rl\�\�:\0]�,�\�O\�\�Ke\�uzBG$�5U�4\�S�\�ײ\�\�rK\�\�7Nk>��\�kMp�3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\��\�\�\�	\�c��\0\0\0\0IEND�B`�',1),('3',1,'d:/upload//processDefiniton/2020/01/12/a933937eab428d5c21c7f14bb6ce0ef6.allowance.png','1',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0c\0\0\�\0\0\0PEXi\0\0\�IDATx\�\�\�lTם\�qTUUT�V��\ZUQ\�J��������VQ�**jڢF؞��\�`b\�%Q\�X摆ȋ�ZR�RmH�\�nLl��&�dy9�@y�\�#`�{\���d��=�g\�\�\��#�x�3�3?�\�\�{ƌ\0\0\0W��\�4�u;\0 ��}-ӷ\0c\0 �\0�1\0\�T\0�#�)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��1f\�\r\�]�bťe˖\�\�Νk\nM~~�)((0�\��)++\�Z�`A\�9s�b\0�F\'O����\�+\�\�>3s\�L�f\�\Z�m\�6s\�\�)\�\�\�nTWW�inn6;v\�0�����1c��5kV���t�\�87PE\0�L�����3�g\�626�w\�\Z��jhh02�6ӦM32�^@E`�\�g�}6VRRbv\�\�iFc���fΜ9\�{\�9]XX8�\�@\nZ[[甕��\�˗��/�t\�v�~�{\��K\�\0�X�xɒ%���ۤ[EE�ΐύ7\�:�\r\0\���&t�� \��\�3ϘI�&�\�\00\0��N{\�\�jMֲ�1cF\�q��\0�\��jBWLd�~��F{\�@]G�\�ײ\�\�G\�\�\�\�_O�`\�Wg\�\�	ٚ�ڷo����>\�\0QUU�7=�.�\�%SXX\���q\0�^kBOq�\�駟n\�\�ϯ\�(\0<�\�^k�[�vK\�(\0<���^�ǆ3g\�\�$�;9\n\0O/\�{��l\�\�%89\n\0O\�\�&\�\0Ĕ)SlΌc�1\0�x�Zϸ�����1\0����N[�)6l\�\�\�j\n\0�-:jk�qYYY\�@̙3\�.ݳ\�\�xz:4g\���rO��MQ__�-\n�M\0�y\�MK�.\�j7q\�6\0H��\�}�\�1\�\�9>�\�3:+\�z\�\0\�ϬY�\���\�飭��\'�t�\�\0$1cƌSO?�t&?̋\�}4�\�\�CT\0�\�\�d�|fŊ�\�Xii\�1]W�m�\r\0Crqqq�O>i._���\�Ľ�ޫ\��O\0\�䂂�CӧO�\�ڵk\�\�i�X[̈`�C�I�&u���_\�PN\�\�\�?n\�t|\�\��h\�lVf�\�\�\�\�ɓc˖-k�\������z�zĽW_Ӌ�����g�g=�NCX\�Ӗ\0�4�p-�Q-\��\�_gF���e\�\�)ΜY\0\�\rh3��oR	\0�\�\�\�\�ߦ\0`9�Y%\0.\�	&\\O%\0�n\�&N��=*\0�\�\�XQQ\�MT\0,�qaa\��\0X\�8NONN\��\0\�\�[�\0X���ߝ��w+�\0\0�a�;<��J\0�\�0v\�6*\0vø+\n��J\0�\�0\��\�\�\0\�\r\���\0`�̊;\"�\�\�\0؝�\�ȥ\0`7�\�A%\0�n_\�혨\0Xc�\�E%\0��p8|Q�n*\0vg\�df<�J\0�ݙ�y	\�9T\0,�Y�P(t?�\0\0�dV|V\��A*\0�\�\�H$RJ%\0�n7K�S	\0�(??�Iy�\0\0�a|J\�cT\0\�q�̌�P	\0�\�q�\�P\�)*\0vg\�G%���\0`7�\�XA%\0�n�#��\0`7�\�XM%\0�n\�8Ο�\0\�\r\�}2^�\0`Q8n�0~�J\0�\�0\�-a�&�\0\0�a�\�q��R	\0�ƟJ�C%\0�n\�0^G%\0�no�0�;�\0\0����\�%�+�\0\�\r\�%���\0X\�8\�\�5T\0,\� \�@�\0`Q~~~��:*\0v\�x���T\0,\�em���J\0�\�0^�\'~P	\0�(??�]�P	\0�\�ke\�\0`7�\�\�\�hR	\0�Ư\�\�\0\�\r\�Wd|F%\0�n����R	\0�ƫe�\0`Q8^)a�*\0v\��y\�qS	\0�\�\�ef|�J\0�E�P\�)��\0`wf�DfƍT\0,�Y�b	\�T\0,�D\"�dv\�D%\0�n�K7S	\0�ƥ\�-T\0,\�\�\�H\�*\09�3W\���\0\0�3\�9\�p�<�\0\0�3\�\��\0\�\r\�\�2.R	\0�Hf\�Se�R	\0�\�2.Q	\0�\�\�mT\0,\n�\�y�1\0X\n�\�0n�\0`��odtP	\0�(��0\�\0`Qnn\�\�\�tQ	\0�(\n�\\f\�W�\0X�F@�\�\�	f���\0�I�=\�\rc]\�F�\0�\�\��(�,�\�˒�q4\Z\rS!\0\�\�\�u�0f�h\0\�r?\�?��B�T\0�\�\��,\0d&\\�0+.�\"\0`yvL%\0��P(�0a�׌1\�:t\�x}}�ٸq����b�`TWW�͛7\�dT�0l\Z\�uuu���\�tvv2F1ZZZLmmmL�y�,\0â3b�8��,3e��`x�5A��whۂW�a\�\� @	c\0	\�K_�2�v�1\r\���o�\Z\�K\�R��o4{7��]�\�g\�\��6�0��0>ް\� \�\'\Z\���1�l��MO$\rc��\0&�d!��V\�O\Z\�zL �	c\0�c]=�,��6�0��0>�eE\�0\�\�`\�@\��l\�n����k[�5��\0&�d!�u��\�k\�X�F�\�\0�\�\��֊k[�5��\0&�d8���/�<��g��qa Sa,3\�Sj̞\�ҤA\�;�\�\�\�e�LHc5f�L\�B�2l�L\�\0\�\�#\r\�\�A\�\0\�\�\�\0aL ��1\00@3c\0�1a�0f\�\0c\�\0a�\�p��p�\�v\�@`\�x��پ�0@\�\0@\�\0c\�\0c\�\0aL@�\�xK\�\0�ns\�\0Ƅ1\00\00@\�\0@\�\0c\�\0c\�\0aL\�\0c\�\0a\� �Ƅ1\0A �	c\0�1�00\n7n$@\�<\�{\�=\���\�\�\��477�i\Z<�FM8�\�h\�\�\�?+「z��\�X\�8NInn\�\�\�ƍ��W!�1555�\�\�\�\�N�>=�:{�lƃ���\�\�A|\�ĉ�\�\�\�WV�X�^�פ0\�\�\0�&����\��:S���\��\�_7����� 7�\Z.\�֭3�~�\�\�۷�\�˗�w\�y\'c���\�)�\\�5�z�*�C�Н��\0����p�G��Z�\�]wݵ\�\�g�\�ܴi�9��\�u�\�Q\r��L=���\�Ν�\�}��J\�f\�	\��\0�L�\��cϾ}���W�Ȭ�J8n\�\�c8v\�ء\��ںuk��\�b/\�.��:IǢ\�\�OyuHIQQ\�M3gΌ�!lذ�C-\�\�chmm\�\�\�\�\�s�\����y\�\�@�\���&M�^e\0R�\�=�\�W�\n\�+V\��\�f\�1455]s�_~�e�\�N/\�P?��\�mO\�\�Ǐ���&Q���\�q\��̫\r@R��j\�ڵ]C�qIII,��?�1\�}���\�:�,�B�\�h�7�h\�\�Xg\�2�d<\�+@��qŶm\�:bm!L�2\�L�\�[��-\�\�\�I\�7��x�\�+K\��;��\��H<�i]\0���\n]\�\�\�\�=X���\��6\��\�\�\�\�:Ԍ��\�\��a\�;^���J�ϭ�\nZ\0���mmm�~��gϞX(z0\���e˖��\�ttt\\]:�A痚Ӻ\0p�3f4j;` \�\�\�z\�owyy�\�\�\���oJ\�\Zƿ��\�yef<���\0_y\�\'\�ï��3�=䧞z\�D�\�z��L��}\�7���\�A�U��O\'�u\�U�V\�>�쳫+JJJ�7|Ag�999�d\���B:�}x\��D:����\����\�[���X��������m6ǒ%Kv�o���\�_h?;hǄ\�@v\�\�M\���cچ���\�I8\�\��`\��\�x�.\0�f��\��$�\��\�3{�\�\�Ν3���ʵ)h]\0M�\�+\n�\�M�kժU-z	Myl\'9J}���o��诿\�\��ش-�=l�P�#\���G\�M�3y3w\�x\�ų@������\�~_¸#\n�\��\�I�V\'Z�\�\�\�\���\�8缰T�0N��{��\�j���\�$���\�\�� �\�S�ev��<^\�x䵣u��\����<!�\�\�\�\�L���e\"�H�.a��K��\0!�Ӏ\�\�2#\�ә��t\�\�	\��֓\�`�^\�R\�\�\�x�GÃ0N3Z@�M�<�Fݥ8\n���gr�q�к\0����X/�yVf>;��<\�Ԙ\���7\�A�����0��\���\0�\�\�O�0\�z<\�8�h]\0\��\��F�F�?�\��!�\�ԝ\�0�7\�C�_3\��\�9Ɩк\0FZ��\�3}��c\�h]\0)\�\�˻U\�K?\�\�2��{�� ��\'~O\�\�X\�\�\0 �]�\�0\0\�EYf\�g\�M�\�ǳ1\�؅h]\0}�\�s	⦼��oưt|h] �o��~YKL{���\�W\�����\�\0�\�!�=�\��6#�/��D\"�_\��\�\�;f_�.d\�p�\�B�;\�\n\�\��0��\����7\�\���?�8�+��B\�\'�\�\�\�\��=o\�؃3c\�\�Kg\��篨|C^\�7H�ɋ��\�&�=\"\�3>I\���k�\�\�\"a\�\�Ya\�r�zB�S5�)\�k�\�\�//�\�~^KL{��|ݒ`�1�\�U2.|7�ov\�؅hI HA���%\�\�ɹ%\�3/\�\�EhI P\�׾}��B�	�\ZL�\�XВ@ph\0ǯK\\B5c7�%���D\"�?\��y�A\�FK��k�\�EY\��T�0vA\�iI xtٚ\�<�兿�j\�6ђ@�\�	�\�o\�<�al-	\�\�p��ڴMA5cK5�%���	�Ӌ�\�wT�0\�6Z�W3\�\��\���j\�\�DK�\�\�\�\�ϥ\Z�q�\�IK�ψ_K��j\�\�BKH��\�MDu3Q�Ag-	�]K,o�&�S\r\�8K��%�\�\�+o�3�%&�3���D(���%�8q\���a�)�$�A\�l���.//\�V�Ag�N�$�A�xf|-�D�Ag-	`2�U��R\r\�8\�hI\0)�F�?ҙ�̌�D5\�Ԅ�0�	&\\_K��j\�\�DKH\����)o�S2P\r\�8]hI\0\��]2\��j\�iz��$�\�7\�:yôO�<�F�A�-	`\�W\�e�\�F�?�\Z�\n^=]\�1.ђ\00Ќxz���G5F\�C��\�y-	\0����2t-�\�T#m�\�2H���\��$�Q\�\�\��a|-�Fvf\�R\�\�^xڮZ�l�����z,_�\�,\\��Ϙ7o�>�m�$�\�\�\���\�\�dl�\Z	\�zǗ�2+~��\��������\\�\�В\0F(���Qfi�F�f\�^\�\�.ߛ7o2��;f�L��G��\�%α�8\�|ҋ�\�_|qG*�⊊�.�20� ~G\�\��>\�\�,�	OKc\�|�\�\�\�0d766꬘\�\0#�%��XƿS��͎����2+^�fͻ�̊�.]\Zc\�`��4]\��F\�T#�a\\\�3��\�\�3d:t(&��J�.0L����k�i��d\�u\n\�\�\�\�\�ƍMUUc���\�l޼9&�B\��̊-Zd���n\�oF|s|!�\�~z^\Z\�uuu���\�tvv2F1ZZZLmmm\��\�ñ���\���\��j\��Caa\�Xy\�\\� \�\�\�3b�8}c߾}ל�2u\�T3{�\�>C���i�\�R�k�%�O8�sX��~{~ښ D\�;\�{\�=.���\�l>� >����O~|~\�\�$@\�;���s�4����q��?dI5�/}y\�ڱ\�4T/�:���k�/ad:�\�Zb�_+ �0n=\�h�n(3��>�\�Я\�m0ad�515��-\��\�JoXwM��\r\�	`\�\�Ȍ�?�2��H�<\�7�0޷鉤a����1�V���?� \�@~5(\�9�0\�[5?i\�m0a�3�\�J_�0�\��&�	c�M�!A|\\��\��%m\�\�da����1�\�\�e|ĭnR	\�[V$\rc��\0&��t�\�\'.((�� >�T\��l\�n����k[�5��\0&��Q	�\�O\�Zb\�qnj\rR=\�\��\�/_\��50FE����<\�:�\�\��֊k[�5��\0&��\�Ό�\�w\��	a��\�/�<��g��qa�#�+e\\�0a\���q\�\��5fOei\� \��w�\�2K&��Q���A�L昀-kK\�C͆�%\�@F\�\�1ui�/?�0Ne6<\�,�0&��Ѵ+�n�$�z�4�{aL�mW�F/\n�\�	r3c�:	\�\��sAE\"�7t��ɓ\'\�H3c�n\�b������o\�\��DCX\�XC�0fƀEڦ\�v��-caX�\�\�?\�{�0fƀ\�@�GY��\�\��HO��r3a<�!w;\�\�\�\�1\�qz���6��Oƣ\����\�\�	c����\�Ƅ1aX��\�\�Kn\�7	c0\�+~�(�\�1aLv9\�8����Ƅ1a\�\r\�ǽ�maL�\��m�X\�F~�!{v\�&N� �\���M�1a��]\�\�m�c\��c�\�s\�6Ƅ1\�K^۶�0&�\��ҶM�1a��e\�m�c\��5�l\�Dƀ\�ya\�&0�\�\�6Ƅ1�@v\�M�1a�[�m\"�	c pܸmaLA\�m�c\�$�m\�D\�@�\��ٶi\�ƍ(a:�]�mS]]]Oss3!��q\�ĉ�Ɲ�\�o��m�jjj�����>}\�\�!\�\�\�\� ����\"c�n�cܰm��\��\�]\�_�\�8>��C�x�b�v\�Z\�\�\��1\�\��g�mʴ\�{.\�F[)EEE������M�\�8\�\r�7o���u\�֙\�\�\�۩�L�+<�mS��7\�ŋ�����f�\��.//?Iu\0d��mʔ\�ӧ\�\�D�~�)�c\0�\�m�2�[Beb{���+W�\� 㼴mS�x٢E�z\� t�[yyy.�\0\�m�2�ͅ��!\�\�յ�*�q^ٶ)�T9r�g�0���1���cy�\0\�8/l۔	����\�\�\�I���\�\�f\�o�\n�5n߶)t�ĺu\�~��\�o^\��F �vۦL�:ujmkk\�5����\�c�=v3�\n\0V�uۦLѓ>֬YӧW��E��\�\��j\0`��m\�$\�qf:t\�\�0^�v\�	^\0\��u\�6e\�O\�iлw\�f�\0�p۶M�VTTt\�[o�e\�Ν\��\�\�*nڶ)KϷ\�qVP\0pe@�bۦl�\�fk������l}ۦl�:s\�9�\�p�\���MY����\���a\�\�m��g,��#\r�\���mS$Y$?l�8\�\0\\\�\�\�69��X�\�-�̯�ܶI/8/\�\�8G�g�q\�&	\�\��rtx�߶m�0~\�q�\�Y\0�\�m�$���\�q\0�?m\�$\�\�E�sTx�_�m�\����\�8�\0<\�\�6\��p8���	�\�\�\�m�\�����N�$\0\���M�ߕ�	G�/xu\�&�\��Mf\�q��\'�m\�+\�\�c�\���\r/n\�$A\\-����W��m�<\�Z�8r\0�ȞٶIg\�:;\��k {b\�&\�e7l\0\�m�$��\�X\�\�\�����m\�5ƺ֘#�\�ܾm��}�g\�q�\0����m�ǵW\�\�%\0�\�\�m��mz\�6���p\�Mz-c\�q�\�\�(n۶I�X?`\\ő8nڶI��\�}�8*\0\�M\�6\�\�\�\�\�pT\0�[�m\�5\���rD\0��m��?)3\�\�\r\0Ad�\�6\��6\�\�xG@\�\�ܶ)޻~��\0\0c\�m\�$�yF\�C\0���m�\�9\n�\��\0gcۦ�E�\��\0\�7��m�̌/ʘN\�\�\�@\�ڶMr�\�\�\�\00pHfe\�&�����W\0X��m�$�\�\�>�6\0�ݶI�����;*\r\0�H\�M999�8�s��z�&�\�)��+*\r\0C\�^Ӳm����>&\�\��ȸPXX8���\0ұmS4\Z�\� a|uH`��j� ұmS�\���.�cV\0)H�m�\�z\�r[\�hf\�̊`��ۯ�m�m�Θ\�\���{	\���q7�b\0�\�m�d��0���7�}(�s�0^Me`��M!3\�\�\0}ߙ)ήO&���TB\0�@\�	\�F�Iz�\�SlULK�7�QU\0�����$<\�Y�֔\��ҿ��f���ߥ�\0�\"m%\�tC��o�_\�\�d\�\��͝�?��qVF��\�\�\�<\0:�_\�K_�^��޿��@\�\�j%`��:\���c=c/�{\0�k�š�\�kh\�U\�$�\�pB8ɨg�\0C\�٫\�~\�\�\�\�o���5}\�3g�U�V�m۶�\�\�F\�\�\�n��\�\�\�l>�\��\�K/�����\�m�$�j@\n$4\�e\�\�\'H\�͛w5h���M�v\�\�iJKK��rL���\0��Ķ�����\�\��UVV�\�\�\���d\0���{�q,�%�\�_�t8r䈙={v�2-\0\�\'�¢=1���N��Y{\�|�\0}\�����t͈�!�kYl��\00\�uĉ}b\�g����\�\�\�(\0<]Җ�j���\�d\�C=�خh\�(\04\�\'�Y�\�ײa�\�\�}\�\�K\�\�\0G��%~h7�%lÕxbH*;�\0��[u���z�j�M���j�ӥ9\Z\0�\�-����8g��DZ\�9\Z\0+\�Z\�ԩSY\rc]w�x�M�� ό�\�ދ�d�\�_\��s4\0\�2l ���1\0�=c\0p\�̘\�\0\��0f�1\0��M�\�\�x�\�wg\��\�kSh��kS\0��V\��ī�ecv��7Wm�1_]\�X�A\�z\�\0`v\\���>�L�\�N\00݋N��\��x�f\�b<\0�\�֜خH�\�ЉA\�\�\�\00x ?�\�ڲ\��h>\�\�q�քΊPm\0F ���عs簗�����	a��1\0�e�\�CNl]\�z;v\�z-�ދ\�\�\��\�3\�O\�H\�Ӛ\0�a\�\�WY�rl\�\�:\0]�,�\�O\�\�Ke\�uzBG$�5U�4\�S�\�ײ\�\�rK\�\�7Nk>��\�kMp�3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\��\�\�\�	\�c��\0\0\0\0IEND�B`�',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','10001',5),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('5005','allowance:2:2504','5001','5004','begin',NULL,NULL,'开始','startEvent',NULL,'2020-01-12 21:04:18.709','2020-01-12 21:04:18.710',1,NULL,''),('5006','allowance:2:2504','5001','5004','selfVerify','5007',NULL,'申请人办理','userTask','lyf','2020-01-12 21:04:18.711','2020-01-12 21:55:16.660',3057949,NULL,''),('7504','allowance:2:2504','5001','5004','leaderVerify','7505',NULL,'主管审核','userTask','yangzc','2020-01-12 21:55:16.681','2020-01-12 21:56:49.031',92350,NULL,''),('7509','allowance:2:2504','5001','5004','selfVerify','7510',NULL,'申请人办理','userTask','lyf','2020-01-12 21:56:49.031',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
INSERT INTO `act_hi_comment` VALUES ('7501','comment','2020-01-12 21:55:16.598','lyf','5007','5001','AddComment','请领导批准，1111111111111111111',_binary '请领导批准，1111111111111111111'),('7507','event','2020-01-12 21:55:16.685','lyf','7505',NULL,'AddUserLink','yangzc_|_assignee',NULL),('7508','comment','2020-01-12 21:56:49.014','yangzc','7505','5001','AddComment','不同意，1111111111111111111111',_binary '不同意，1111111111111111111111');
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('5002',NULL,'starter','lyf',NULL,'5001'),('7506',NULL,'participant','yangzc',NULL,'5001');
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('5001','5001','1','allowance:2:2504','2020-01-12 21:04:18.698',NULL,NULL,'lyf','begin',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('5007','allowance:2:2504','selfVerify','5001','5004','申请人办理',NULL,NULL,NULL,'lyf','2020-01-12 21:04:18.739','2020-01-12 21:55:16.624','2020-01-12 21:55:16.652',3057913,NULL,50,NULL,NULL,NULL,''),('7505','allowance:2:2504','leaderVerify','5001','5004','主管审核',NULL,NULL,NULL,'yangzc','2020-01-12 21:55:16.682','2020-01-12 21:56:49.019','2020-01-12 21:56:49.030',92348,NULL,50,NULL,NULL,NULL,''),('7510','allowance:2:2504','selfVerify','5001','5004','申请人办理',NULL,NULL,NULL,'lyf','2020-01-12 21:56:49.031',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('5003','5001','5001',NULL,'username','string',0,NULL,NULL,NULL,'lyf',NULL,'2020-01-12 21:04:18.706','2020-01-12 21:04:18.706'),('7502','5001','5001',NULL,'comment','string',1,NULL,NULL,NULL,'不同意，1111111111111111111111',NULL,'2020-01-12 21:55:16.645','2020-01-12 21:56:49.027'),('7503','5001','5001',NULL,'outcome','string',1,NULL,NULL,NULL,'驳回',NULL,'2020-01-12 21:55:16.646','2020-01-12 21:56:49.028');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1',NULL,NULL,NULL,'','2020-01-12 09:42:36.980',NULL),('2501',NULL,NULL,NULL,'','2020-01-12 11:20:54.118',NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('allowance:1:4',1,'http://www.activiti.org/test','补贴申请','allowance',1,'1','d:/upload//processDefiniton/2020/01/12/a933937eab428d5c21c7f14bb6ce0ef6.bpmn','d:/upload//processDefiniton/2020/01/12/a933937eab428d5c21c7f14bb6ce0ef6.allowance.png',NULL,0,1,1,'',NULL),('allowance:2:2504',1,'http://www.activiti.org/test','补贴申请','allowance',2,'2501','d:/upload//processDefiniton/2020/01/12/f889091233f599a141f845b41642e9fc.bpmn','d:/upload//processDefiniton/2020/01/12/f889091233f599a141f845b41642e9fc.allowance.png',NULL,0,1,1,'',NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('5001',1,'5001','1',NULL,'allowance:2:2504',NULL,'5001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-12 21:04:18.698','lyf',NULL,0,0,0,0,0,0,0,0,0),('5004',3,'5001',NULL,'5001','allowance:2:2504',NULL,'5001','selfVerify',1,0,0,0,0,1,NULL,'',NULL,'2020-01-12 21:04:18.707',NULL,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('5002',1,NULL,'starter','lyf',NULL,'5001',NULL),('7506',1,NULL,'participant','yangzc',NULL,'5001',NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('7510',1,'5004','5001','allowance:2:2504','申请人办理',NULL,NULL,'selfVerify',NULL,'lyf',NULL,50,'2020-01-12 13:56:49.031',NULL,NULL,1,'',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('5003',1,'string','username','5001','5001',NULL,NULL,NULL,NULL,'lyf',NULL),('7502',2,'string','comment','5001','5001',NULL,NULL,NULL,NULL,'不同意，1111111111111111111111',NULL),('7503',2,'string','outcome','5001','5001',NULL,NULL,NULL,NULL,'驳回',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_allowance`
--

DROP TABLE IF EXISTS `biz_allowance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_allowance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_money` int(11) DEFAULT NULL,
  `instance_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `apply_user` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apply_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_allowance`
--

LOCK TABLES `biz_allowance` WRITE;
/*!40000 ALTER TABLE `biz_allowance` DISABLE KEYS */;
INSERT INTO `biz_allowance` VALUES (1,'申请奖学金1111111111111','测试数据，1111111111111',2000,'5001','lyf','2020-01-12 20:35:50','lyf',NULL,'lyf','2020-01-12 21:04:18'),(2,'申请交通补贴2222222222','测试数据',300,NULL,'lyf','2020-01-12 20:54:45',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `biz_allowance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_student`
--

DROP TABLE IF EXISTS `stu_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu_student` (
  `sno` int(4) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_student`
--

LOCK TABLES `stu_student` WRITE;
/*!40000 ALTER TABLE `stu_student` DISABLE KEYS */;
INSERT INTO `stu_student` VALUES (1013,'刘亦菲','女','1989-10-28','upload/a8e6c5830753402f81dbf69b990be323.jpg'),(1017,'赵六','女','1999-01-01','upload/11fe2afce22a46b5bf069f85b0cf52a9.jpg');
/*!40000 ALTER TABLE `stu_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_on` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_on` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (7,1,'admin','登录',0,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:42:03'),(8,1,'admin','登录',15,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:47:04'),(9,1,'admin','登录',0,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:53:27'),(10,1,'admin','登录',16,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:54:17'),(11,1,'admin','登录',31,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:56:26'),(12,1,'admin','登录',156,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8435\",null]','127.0.0.1','2020-01-05 22:03:41'),(13,1,'admin','登录',4,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8951\",null]','127.0.0.1','2020-01-05 22:18:42'),(14,1,'admin','登录',3388,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"7836\",null]','127.0.0.1','2020-01-06 23:00:30'),(15,1,'admin','登录',3012,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"6737\",null]','127.0.0.1','2020-01-06 23:06:57'),(16,1,'admin','登录',413,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8331\",null]','127.0.0.1','2020-01-07 23:11:19'),(17,1,'admin','登录',309,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"5453\",null]','127.0.0.1','2020-01-08 23:42:23'),(18,1,'admin','登录',174,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"9926\",null]','127.0.0.1','2020-01-12 12:35:00'),(19,1,'admin','登录',2,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"9426\",null]','127.0.0.1','2020-01-12 12:35:51'),(20,1,'admin','登录',72,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"9574\",null]','127.0.0.1','2020-01-12 16:32:23'),(21,1,'admin','登录',18,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"2331\",null]','127.0.0.1','2020-01-12 17:02:57'),(22,1,'admin','流程定义导入',82,'com.yangzc.studentboot.workflow.definition.controller.ProcessDefinitionController.upload()','[null]','127.0.0.1','2020-01-12 17:37:16'),(23,1,'admin','流程定义导入',26940,'com.yangzc.studentboot.workflow.definition.controller.ProcessDefinitionController.upload()','[null]','127.0.0.1','2020-01-12 17:42:38'),(24,1,'admin','登录',20,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"2179\",null]','127.0.0.1','2020-01-12 17:50:59'),(25,1,'admin','登录',24,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8753\",null]','127.0.0.1','2020-01-12 19:20:43'),(26,1,'admin','流程定义导入',370,'com.yangzc.studentboot.workflow.definition.controller.ProcessDefinitionController.upload()','[null]','127.0.0.1','2020-01-12 19:20:54'),(27,1,'admin','登录',61,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"1145\",null]','127.0.0.1','2020-01-12 20:16:54'),(28,1,'admin','登录',28,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"1497\",null]','127.0.0.1','2020-01-12 20:22:12'),(29,1,'admin','登录',14,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"5926\",null]','127.0.0.1','2020-01-12 20:27:22'),(30,-1,'[\"admin\",\"111111\",\"5751\",null]','登录',0,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"5751\",null]','127.0.0.1','2020-01-12 20:27:31'),(31,-1,'[\"admin\",\"111111\",\"5751\",null]','登录',1,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"5751\",null]','127.0.0.1','2020-01-12 20:27:34'),(32,-1,'[\"admin\",\"111111\",\"7998\",null]','登录',1,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"7998\",null]','127.0.0.1','2020-01-12 20:27:43'),(33,1,'admin','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"0059\",null]','127.0.0.1','2020-01-12 20:28:06'),(34,-1,'[\"lyf\",\"123456\",\"2116\",null]','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"123456\",\"2116\",null]','127.0.0.1','2020-01-12 20:29:10'),(35,-1,'[\"lyf\",\"123456\",\"6720\",null]','登录',11,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"123456\",\"6720\",null]','127.0.0.1','2020-01-12 20:29:17'),(36,2,'lyf','登录',9,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"6720\",null]','127.0.0.1','2020-01-12 20:29:25'),(37,2,'lyf','补贴申请',46,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.addSave()','[{\"createBy\":\"刘亦菲\",\"createTime\":1578832549913,\"id\":1,\"params\":{},\"reason\":\"测试数据，1111111111111\",\"title\":\"申请奖学金1111111111111\",\"totalMoney\":2000}]','127.0.0.1','2020-01-12 20:35:50'),(38,-1,'[\"yangzc\",\"111111\",\"6997\",null]','登录',30324,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"6997\",null]','127.0.0.1','2020-01-12 20:51:33'),(39,3,'yangzc','登录',3910,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"6997\",null]','127.0.0.1','2020-01-12 20:52:14'),(40,-1,'[\"yangzc\",\"111111\",\"3444\",null]','登录',4,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"3444\",null]','127.0.0.1','2020-01-12 20:52:57'),(41,3,'yangzc','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"2553\",null]','127.0.0.1','2020-01-12 20:53:02'),(42,-1,'[\"lyf\",\"111111\",\"6366\",null]','登录',1,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"6366\",null]','127.0.0.1','2020-01-12 20:53:44'),(43,2,'lyf','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"8500\",null]','127.0.0.1','2020-01-12 20:53:49'),(44,2,'lyf','补贴申请',7,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.addSave()','[{\"createBy\":\"lyf\",\"createTime\":1578833684729,\"id\":2,\"params\":{},\"reason\":\"测试数据\",\"title\":\"申请交通补贴2222222222\",\"totalMoney\":300}]','127.0.0.1','2020-01-12 20:54:45'),(45,2,'lyf','补贴申请提交',344,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.submitApply()','[1]','127.0.0.1','2020-01-12 21:04:19'),(46,1,'admin','登录',61,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"6404\",null]','127.0.0.1','2020-01-12 21:17:13'),(47,2,'lyf','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"1741\",null]','127.0.0.1','2020-01-12 21:17:43'),(48,1,'admin','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8497\",null]','127.0.0.1','2020-01-12 21:20:17'),(49,1,'admin','登录',12,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8151\",null]','127.0.0.1','2020-01-12 21:27:27'),(50,1,'admin','登录',54,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"2025\",null]','127.0.0.1','2020-01-12 21:38:41'),(51,-1,'[\"lyf\",\"111111\",\"8697\",null]','登录',1,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"8697\",null]','127.0.0.1','2020-01-12 21:39:10'),(52,2,'lyf','登录',4,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"9780\",null]','127.0.0.1','2020-01-12 21:39:15'),(53,3,'yangzc','登录',10,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"4334\",null]','127.0.0.1','2020-01-12 21:56:06'),(54,2,'lyf','登录',5,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"1587\",null]','127.0.0.1','2020-01-12 21:57:32'),(55,1,'admin','登录',5,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"7940\",null]','127.0.0.1','2020-01-12 22:45:11');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_on` datetime DEFAULT NULL COMMENT '创建时间',
  `update_on` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'权限管理',NULL,NULL,0,'fa fa-gear',1,'2019-12-21 00:00:00','2019-12-21 00:00:00'),(2,1,'系统菜单','sys/menu/','sys:menu:menu',1,'fa fa-th-list',12,'2019-12-21 00:00:00','2019-12-21 00:00:00'),(3,1,'角色管理','sys/role','sys:role:role',1,'fa fa-paw',11,'2019-12-21 00:00:00','2019-12-21 00:00:00'),(4,1,'用户权限','sys/user/','sys:user:user',1,'',10,'2019-12-21 00:00:00','2019-12-21 00:00:00'),(5,0,'学员管理','','',0,'fa fa-user',2,'2019-12-21 00:00:00','2019-12-21 00:00:00'),(6,5,'学员列表','stu/list/','stu:list',1,'',20,'2019-12-21 00:00:00','2019-12-21 00:00:00'),(7,2,'新增','','sys:menu:add',2,'',120,'2019-12-29 00:00:00','2019-12-29 00:00:00'),(8,2,'编辑','','sys:menu:edit',2,'',122,'2019-12-29 00:00:00','2019-12-29 00:00:00'),(9,2,'删除','','sys:menu:remove',2,'',123,'2019-12-29 00:00:00','2019-12-29 00:00:00'),(10,2,'批量删除','','sys:menu:batchRemove',2,'',124,'2019-12-29 00:00:00','2019-12-29 00:00:00'),(11,6,'添加','','stu:create',2,'',200,NULL,NULL),(13,0,'补贴办理','','',0,'fa fa-tasks',3,NULL,'2020-01-12 12:46:21'),(16,0,'日志管理','','',0,'fa fa-table',4,'2020-01-04 23:08:10',NULL),(17,16,'日志查看','/log/list','log:list',1,'',40,'2020-01-04 23:08:49','2020-01-04 23:09:02'),(18,0,'系统监控','','',0,'fa fa-video-camera',5,'2020-01-06 23:36:13','2020-01-06 23:37:17'),(19,18,'数据监控','/druid/index.html','',1,'',50,'2020-01-06 23:39:33',NULL),(22,13,'补贴申请','/workflow/allowance/apply/list','workflow:allowance:apply:list',1,'',30,'2020-01-12 12:47:21','2020-01-12 21:20:33'),(23,13,'我的待办','/workflow/allowance/task/list','workflow:allowance:task:list',1,'',31,'2020-01-12 12:48:41','2020-01-12 12:51:02'),(24,13,'我的已办','/workflow/allowance/done/list','workflow:allowance:done:list',1,'',32,'2020-01-12 12:52:08',NULL),(25,0,'流程设计','','',0,'fa fa-send',6,'2020-01-12 12:56:32','2020-01-12 12:57:12'),(26,25,'流程模型','/workflow/model/list','workflow:model:list',1,'60',60,'2020-01-12 12:59:10','2020-01-12 17:02:12'),(27,25,'流程定义','/workflow/definition/list','workflow:definition:list',1,'',61,'2020-01-12 13:00:13','2020-01-12 16:59:17'),(28,22,'查询','','workflow:allowance:apply:query',2,'',300,'2020-01-12 13:05:26','2020-01-12 13:05:48'),(29,22,'添加','','workflow:allowance:apply:add',2,'',301,'2020-01-12 13:06:39',NULL),(30,23,'审批','','workflow:allowance:task:audit',2,'',310,'2020-01-12 13:08:35','2020-01-12 13:10:46');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `create_on` datetime DEFAULT NULL COMMENT '创建时间',
  `update_on` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级用户角色','admin','拥有最高权限',NULL,'2019-12-21 00:00:00','2019-12-21 00:00:00');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,13),(15,1,16),(16,1,17),(17,1,18),(18,1,19),(19,1,22),(20,1,23),(21,1,24),(22,1,25),(23,1,26),(24,1,27),(25,1,28),(26,1,29),(27,1,30);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `create_by` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `create_on` datetime DEFAULT NULL COMMENT '创建时间',
  `update_on` datetime DEFAULT NULL COMMENT '修改时间',
  `gender` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','超级管理员','27bd386e70f280e24c2f4f2a549b82cf',NULL,'yangzc23@aliyun.com','17721038951',1,1,'2019-12-21 18:05:39','2019-12-21 18:05:39',NULL,'1999-10-15 00:00:00',NULL,NULL,NULL,'上海市','上海市市辖区','徐汇区'),(2,'lyf','刘亦菲','7fdb1d9008f45950c1620ba0864e5fbd',NULL,'lyf@aliyun.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'yangzc','杨振春','b926e2a0b1cc80a3020a4cdb44c901fa',NULL,'yangzc23@aliyun.com',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-12 23:41:31
