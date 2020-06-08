-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: studentboot
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
INSERT INTO `act_ge_bytearray` VALUES ('10002',5,'source',NULL,'{\"resourceId\":\"10001\",\"properties\":{\"process_id\":\"allowance\",\"name\":\"补贴申请\",\"documentation\":\"补贴申请\",\"process_author\":\"\",\"process_version\":\"\",\"process_namespace\":\"http://www.activiti.org/processdef\",\"executionlisteners\":\"\",\"eventlisteners\":\"\",\"signaldefinitions\":\"\",\"messagedefinitions\":\"\"},\"stencil\":{\"id\":\"BPMNDiagram\"},\"childShapes\":[{\"resourceId\":\"sid-55156C4C-204D-4BEA-98C8-2BB5D3E05CBA\",\"properties\":{\"overrideid\":\"begin\",\"name\":\"开始\",\"documentation\":\"开始\",\"executionlisteners\":\"\",\"initiator\":\"\",\"formkeydefinition\":\"\",\"formproperties\":\"\"},\"stencil\":{\"id\":\"StartNoneEvent\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-E5B27D1C-A8A6-4478-AB20-FACA1AF45013\"}],\"bounds\":{\"lowerRight\":{\"x\":210,\"y\":45},\"upperLeft\":{\"x\":180,\"y\":15}},\"dockers\":[]},{\"resourceId\":\"sid-02C0979B-B51D-485A-84CF-F7300B02969D\",\"properties\":{\"overrideid\":\"selfVerify\",\"name\":\"申请人办理\",\"documentation\":\"申请人办理\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":{\"assignment\":{\"assignee\":\"${username}\"}},\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":\"\"},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-BDC573ED-1869-4DE6-A313-909751A3A1F2\"},{\"resourceId\":\"sid-3D7DBE33-1336-4330-B597-50670E22F9C8\"}],\"bounds\":{\"lowerRight\":{\"x\":245,\"y\":230},\"upperLeft\":{\"x\":145,\"y\":150}},\"dockers\":[]},{\"resourceId\":\"sid-17C99FB8-085C-4465-B4A3-F41B5A57E5D4\",\"properties\":{\"overrideid\":\"leaderVerify\",\"name\":\"领导审核\",\"documentation\":\"领导审核\",\"asynchronousdefinition\":\"false\",\"exclusivedefinition\":\"false\",\"executionlisteners\":\"\",\"multiinstance_type\":\"None\",\"multiinstance_cardinality\":\"\",\"multiinstance_collection\":\"\",\"multiinstance_variable\":\"\",\"multiinstance_condition\":\"\",\"isforcompensation\":\"false\",\"usertaskassignment\":\"\",\"formkeydefinition\":\"\",\"duedatedefinition\":\"\",\"prioritydefinition\":\"\",\"formproperties\":\"\",\"tasklisteners\":{\"taskListeners\":[{\"event\":\"create\",\"implementation\":\"com.yangzc.studentboot.workflow.allowance.listener.MyTaskListener\",\"className\":\"com.yangzc.studentboot.workflow.allowance.listener.MyTaskListener\",\"expression\":\"\",\"delegateExpression\":\"\"}]}},\"stencil\":{\"id\":\"UserTask\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-C28D0100-D70E-4459-84DE-378A90FE47D3\"},{\"resourceId\":\"sid-D397F841-1048-4E86-A45B-5E6FD1CFB6A2\"}],\"bounds\":{\"lowerRight\":{\"x\":245,\"y\":380},\"upperLeft\":{\"x\":145,\"y\":300}},\"dockers\":[]},{\"resourceId\":\"sid-823E44D3-E191-496C-9115-96B327B135D6\",\"properties\":{\"overrideid\":\"end\",\"name\":\"结束\",\"documentation\":\"结束\",\"executionlisteners\":\"\"},\"stencil\":{\"id\":\"EndNoneEvent\"},\"childShapes\":[],\"outgoing\":[],\"bounds\":{\"lowerRight\":{\"x\":209,\"y\":478},\"upperLeft\":{\"x\":181,\"y\":450}},\"dockers\":[]},{\"resourceId\":\"sid-E5B27D1C-A8A6-4478-AB20-FACA1AF45013\",\"properties\":{\"overrideid\":\"submit_apply\",\"name\":\"发起流程\",\"documentation\":\"发起流程\",\"conditionsequenceflow\":\"\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-02C0979B-B51D-485A-84CF-F7300B02969D\"}],\"bounds\":{\"lowerRight\":{\"x\":195,\"y\":149.625},\"upperLeft\":{\"x\":195,\"y\":45.375}},\"dockers\":[{\"x\":15,\"y\":15},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-02C0979B-B51D-485A-84CF-F7300B02969D\"}},{\"resourceId\":\"sid-3D7DBE33-1336-4330-B597-50670E22F9C8\",\"properties\":{\"overrideid\":\"give_up\",\"name\":\"放弃\",\"documentation\":\"放弃\",\"conditionsequenceflow\":\"${outcome==\'撤回\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-823E44D3-E191-496C-9115-96B327B135D6\"}],\"bounds\":{\"lowerRight\":{\"x\":324.5,\"y\":464},\"upperLeft\":{\"x\":209.15234375,\"y\":190}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":324.5,\"y\":190},{\"x\":324.5,\"y\":464},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-823E44D3-E191-496C-9115-96B327B135D6\"}},{\"resourceId\":\"sid-C28D0100-D70E-4459-84DE-378A90FE47D3\",\"properties\":{\"overrideid\":\"leader_agree\",\"name\":\"同意\",\"documentation\":\"同意\",\"conditionsequenceflow\":\"${outcome==\'通过\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-823E44D3-E191-496C-9115-96B327B135D6\"}],\"bounds\":{\"lowerRight\":{\"x\":195,\"y\":449.4375},\"upperLeft\":{\"x\":195,\"y\":380.71875}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":14,\"y\":14}],\"target\":{\"resourceId\":\"sid-823E44D3-E191-496C-9115-96B327B135D6\"}},{\"resourceId\":\"sid-D397F841-1048-4E86-A45B-5E6FD1CFB6A2\",\"properties\":{\"overrideid\":\"leader_not_agree\",\"name\":\"不同意\",\"documentation\":\"不同意\",\"conditionsequenceflow\":\"${outcome==\'驳回\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\",\"showdiamondmarker\":false},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-02C0979B-B51D-485A-84CF-F7300B02969D\"}],\"bounds\":{\"lowerRight\":{\"x\":145,\"y\":340},\"upperLeft\":{\"x\":57.5,\"y\":190}},\"dockers\":[{\"x\":1,\"y\":40},{\"x\":57.5,\"y\":340},{\"x\":57.5,\"y\":190},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-02C0979B-B51D-485A-84CF-F7300B02969D\"}},{\"resourceId\":\"sid-BDC573ED-1869-4DE6-A313-909751A3A1F2\",\"properties\":{\"overrideid\":\"self_agree\",\"name\":\"同意\",\"documentation\":\"同意\",\"conditionsequenceflow\":\"${outcome==\'提交\'}\",\"executionlisteners\":\"\",\"defaultflow\":\"false\"},\"stencil\":{\"id\":\"SequenceFlow\"},\"childShapes\":[],\"outgoing\":[{\"resourceId\":\"sid-17C99FB8-085C-4465-B4A3-F41B5A57E5D4\"}],\"bounds\":{\"lowerRight\":{\"x\":195,\"y\":299.15625},\"upperLeft\":{\"x\":195,\"y\":230.84375}},\"dockers\":[{\"x\":50,\"y\":40},{\"x\":50,\"y\":40}],\"target\":{\"resourceId\":\"sid-17C99FB8-085C-4465-B4A3-F41B5A57E5D4\"}}],\"bounds\":{\"lowerRight\":{\"x\":1200,\"y\":1050},\"upperLeft\":{\"x\":0,\"y\":0}},\"stencilset\":{\"url\":\"stencilsets/bpmn2.0/bpmn2.0.json\",\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"},\"ssextensions\":[]}',NULL),('10003',2,'source-extra',NULL,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0w\0\0\0\0\0z\�.�\0\0\0 cHRM\0\0z&\0\0��\0\0�\0\0\0�\�\0\0u0\0\0\�`\0\0:�\0\0p��Q<\0\0\0gAMA\0\0��|�Q�\0\0\0sRGB\0�\�\�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\�\0\0\��+\0\0 \0IDATx\�\�\�	xT\����g��٥�\�.({)�\�*��h]��\���oѪ_�+�b\�VDmB����\Z�#�A@!	�!I�d\�\�3g\�0$M&��|?\�u{fΜ��\��y\�9\�9c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�.�\0��\�\�ٶmۍ�6m�mFFƀ���ؼ���\�\�b\�iܸ�-Z\�oҤ\�j\���iӦ\�\�@�!\�\��\�k۷o�r��\��\�?\��\�\�\�t\�\�\�H��������o�\�\�g���\�ƍ=aaaiG�}��\�^{�V\���5k\�ܲ|��rss�\�\�\�P?��nٲ\�$$$�9rdwvv����E\�\�i\��\�zĠA��ϟ?�\�\�ÇG\�~�\�C�Fz\�g�\�ڵ3cƌ	���l�\�w\�\�z�\�ذa\�FZ�;PK��bŊ\���\��\�\�\\v\�e?*\�u\�\�\�0 rժUce��q\�\�u�2w��i�]���G�\�իC�f\�\�\���#��\�=z�ؗ�����\�\�cס\�WW��4l\�\��\�\�/\�\�/�ݻw\�$\�hq��0�\0u�ΊY�t\�˿�\�/\�y\��\�\�ҥ��<yrtXX؛�8w�,\\��������\�\��y&N�ؠiӦ\�N�2\�zZ�;\�^{rr�u:\�1222\�\�w\�m�5�\��]�<w ��\�ӃF\�<���c\�\�\�\�\�ʇIWZ�;$zJ�s�Ru\�۷o�,���A�A�\�\�ӧO�>\�\����\�b$�\�=	�\�d�Iݺu��\�\0Z�$�&@]�gw\��jRӦM[ˢ�\�=w H���zvǚd?_�\��\�\�h�|M***:@\��;DM�49���S�\�)ϗ+NA\0\��f͚����\�\�sn۶\�{Yl��A��빯\�_P�I�W��\�b�\��\�\�\�\'7o\�\�.--���,޽{w/YΧ�A�A��\��W\Z�&,]�t�\�\�NOHHH��A��\�?������z\�9o��Vo�\��*�\��7\�x#���`\�\'�|\�\�9s��ڏfdd$\�\� ܁�\�_���\�\�޽;(��m۶7l\��K\�ߚ��TB�#\��3{�����s.�\����\�\�O\�\�<՟ƫ.��\�_5}���r����\�im\�@\rںu\�^�ze�\\����jٲe��\�5\�KKK_NHHx�V\�\�	\�Mݻw\�+?.<<�\��΋\n�I��9��\�\�͛7\�\��<,\�Ѻe.�\0���R����7�\�\�nk2p\��gy\�\�e˖-�;wn����bc�����\��V\�_#!GTTT\�^�z\Z6lX�s\�=7\�\�v�[�f��\�K�\"##��o߾[z�\�w\�\�!��r\�7233\�a\�)w �M�:���5�g�\\�H��W!\�Y\�\�\�\�b���9@	�;\�\��YL�zT\�|-�c�;\0\�\0\0\�}=����O��\����:�1��l\�å\ZK��:\"�\�x��)=)?`��R\��]�\�\� ܁�\�CT3��K5�\�~�}\�/�?YYYړo-5Q��T�}�9��p��&E�cX0&\�w!&&&[z�\�$�\�R\�H}g���{yӜ:d\�sj�����\�&喺H\�\�1v\�\\C��\�\�\�|	v����\��\�\�կ�\�{Lj�\�q�\�v�;d:ܲH�ؾ��\�,��I]+��T�\�8�Rz�\0�a�\�\�3�%%%��\�\\&��\���Rc\�\�\��x�e@�5@{ҷI\�1ޡ\r\��ms\�e�T;;\�+\�r��Ǯu�L�<\�M�bN�\���\�\�Ԝ��\�\�\�/�w襹T\���T�N���\�E��iV\�@\�\�!���\Z�3�\�\�c\�tXF\�\�\'I\�m\�w��N�\�\�w��\r�{\�:,�\�/:�E�gt�\\w�>.\�\�o{�i�]�����=�?\�Wg\Z\��u\�\�pN7�\Z�;Ps6\�\�#��\�^\�4\�\��e�¸ǯW�B\���n\�zg����#p湣.x\�x�:�J�\�x8J7\��\n��K��@\�p�׌w�\\{\�z�\�@��S\�ۄә\�8�N���\�R\�K\��\�w\Z\�i^\�*w��I\�/ϲ{\�:�1\�=e���;\�<����\�HU�\�\�M\�\�\�\0�_SQ\���N�4��i@�\�\�?E�u�m�w\��i&�n/��\�ۍ�\�`\�إ\�$�\Z\��P/0掺\�\�Y\��\�,�{\�\���@3��;\�\Z\�O\�\�}��\�:�]�~Յ�=w�9\�7\�s�둪?Όi%U\�]��\�\n\�<d�\�o�C/z�\�`\�=��\�\�\�L�O�A]��Ȥ��t�� L]Ro�\�\�4w�yR\������F\�w׀י3�H\� u;̈́��a\�znv=\ZU\�/�\�\�:�Q\�\�o�����\�\�\Z�	�;\�,=\���\�g\�{6șv�\�Ќ\�TL3�p���9y�_��&A}Ę;\��\�\�N��p�i�]\�4H�;W�Im��@�΢\�r\�\�փ�\��[����}�̈́��1w\�zN�\"S��J�\��;\�@\�~\�~�\�zߘ��&\�8��S[����[�\�ε�Gi&\�����\�s\�̷/똻�Xw�\�9\�K\�\�6�	�\�\�\�m�\��t�+LiRC�vJu��9_\�/4\�Ρ.u�/�\�\\\���c\�K\�\�s�_\�t|m��}G�\���w\'\�8�+i&\�3-����쳤b�:J}hN�\�l�\�b\�uI�����\�7�g{ٖ&=w�����\�\�\�̀p��\��ܞ\�{�;\�,:䢧H������h8J�;\�(�w��Os��>Ծ�?\�q#̈́��1H\�S�����\�\���\��c�?���\�q�\n�\�爯\�6RIRMi&<c�?�\�!\�[\�Cv��\�v��M�ov\���j,5J\�wR�ZJ\�\�\�\�\�;<�4\�\�p���g��T�\�T\�y�\�d�_I\�Im��@�Ρ�\�\�2K�\�i��d\�#\�{�\�\��a�uc\��t��c\�zJ\�ʹ�1�\��יv\�s�Up[��\�\0�܁:&�&\0\�\0 \�\0�;\0�p\0\�\0@�\0w\0\0\�\0 \�\0�;\0�p\0\�\0@�\0w\0\0\�\0 \��p\0\�\0\0\�\0@�\0w\0\0\�\0�;\0�p\0\�\0\0\�\0@�\0\�\0 \�\0�;\0�p\0\�\0�ӹh\�7�\'O~�\�r=y�\�\'$$�\��܁�Ӈ�m�@�uL||�Y�\�\�?\�b \���x<\�a��\�Z�;\��p���Х\�\�z�\�\�8Dll\�J	n�ۢe������\�\�8Ĝ9s��w�����III%�w�YfW\�V����-��@��C.䅁\�].W�,~\�\�\�XN+�pF�\\$\�\�\nX]6K�!\�C��\�u�}�3Z�;\�P\�y\�}\�\�!�,�۽�\�\�8�=4�,`��\�\�\�Z�;\�`�\�U�\��̒\�8]LL\�\Z�\�\�\�\�I�\nw�\�\��vٽ�=r=�V�\�q�j��e\�޽{\�.((�����\�ѣGc\�nw\���YYYf\�ڵ\�\�/4m۶\r\��.�G�Y���Z{\�ĉ�Æ\r��ww\�	�\�%,�+..�m׮�iڴ�iܸ��I\�T�~@\��\�\�\�Ӄ�����\�(**�~���ɴwMZZ\�\�={�\\չsgӾ}{\�i\�(A���nRRR�\�ҔѣG@��\'�&@u�\�U\��iݺ5�^�Q�-\"<�\�믿~\�ܹsw\�* \�Qmt(Fz�\�`oҤ\�i�+8`2��o2w|`��~a\n�\�5\�\rۘ�\�&4^EEEi�GgffN�:u\�\�\��\�AZ��\�t穎�\�PLE��o\�MA\�N\�.=n<\�S���I\���)\�\�OV��\r��]��\�\�\�_�5@���z\�w\�\�Sc/Ov\�W�\��\�\�\�k\�g\�M��Iǎ[DDD��lٲKi\r\�2�b*\Zc/��w��zT�6m\�d\�\�jZ�;�L\�\�tǊxJOT|g���F�Z�\� �Q�\"hT����6P�\�u8G�i	\�sG�\�5�\"�����6\��\�\�+�\�M� \�\�H-:1Q\rO[\���\�2�w8Q�\�盆�z���q�h �p�S��(:m]ɱ|\Z \�\�DǏ��D-8�\�ێ\�m\�\�϶�@�\�!r\�7J��n�G�\"�9�&e\�\�\�H\�j\�a\�;Pm�2���\�\�Zl�\�φ��@�ϗ\�}�M�5U\0=w�퉟m��ҋ�~\�Wi@�pG(Ҟ�O�g�Puˠ\��\Z�8�\0\�s\0\�\0�Ko���\��Iu:�\�x\�p�2\�@H\�.5[*\�o\�/����m�_\�p\�7R��\�M�\ZC��\�܁���ԅ�\�v(�z[�\�/�.��T�\�eR\�Rz0B?�_K=*5\�\���}_\�sPK�篖H\� ����Xj�\��K})u�ԓvh��A�T�\�/��K�\���VѴ�;�\�\�;��Tw�\�\�_��]/�m�\�z\�\��\�.5I��\�c�&%\���cR�w\�\�GR�\�\�:\\�[ζH\�d\0�\"�\�x�e�\��/�2�0\�\�_�\�\�y��\�\�T�=�\�\��oGkssr�Fg̤I}\'5\�04C\�@��\�o`_\���C�5�\�{\�>:f�T�\��.k/��\�\0�^R�4-=w\0�Gw�.�/ko}�}����h��_O]{\�K\�\�:Sf�T�}�\�xw�\�6�iVz\�\0j\�h\��;Fun���Aj��΢�k�\��5��\�xw���\�A\�@\�.�\�;ξR*]j�\�\��W\�H=(���\�t�ݫ�\�x\��\�p\'\�\'\���]~��\��h\r��\�˱v�~]9�u+\�N�#D\�\�\�=\�r��322%%%q\�\��\�L\�\\X����0\���\�\�y�m۶���L�2\�\�k�mJ\��5k\�+�=33\���~ڴig�����&--�-,,4/��b����?\�;�\�|\�{ׯ\�\�I\�_^ !�H���4gΜ\�\��\�rrr̉\'*��U�VfҤIfѢEf\�ʕeA�a\��d\�SRRbV�Ze�|�\�r\��\�\�.]��Ν;��oپ}�INN���Ç�-[��}\���7�\�/�\�\�޽\�z���|�o\�>���\�\�\Z\�HB>N�q\�\�\�ǤG�@\�?�&�nn��F#0\�\��\�כ��\"Ӹqc\��?����\�o�6m\�x\�\�V���.�\�\�\�Ĕ���	��\�\�*|�]�vY g#;;\��\�g?+��m\�6s\�\�F��_vZ�liz�\�e}\�\\}�\�\�߬\�<�\�Р:t���~\�\0�;j�\��[	�߶m\�6_�3��j�{�n�\�\nD\�\���kh��\�G>�\�./X��4l\�\�ȇQY�fee�v\�ڕ�\\ڳ?r\�H��\�l޼\�DEE��k\�Z4�\�\�\Z�F0hР�\�۷oo\"##���u�\�\�n\�j]�*��]��|����\��\�E�$=zm\�=�\n\�s<x�,@{\�:\�\����ߛ�;w�\�ӧ��>�\�,[�̴n\�������m��\�O��~\�\�Y�\�\�\�\�~^^^��\�4h\��z\\\�}\�c�>h\�Ν{J�뇒~X\�0�~�\�ݻ\�\nt_\�}�\�\�A\�\��\�\�2�w\�O6\'!!!�p}\Z\�\�y�M7\�\�\��CuӞye=w\"\�ҝ�\�3�\�\�+��b�v\�jƎkm�=\�����y�\�=\�\�nz�\�m�~�~#�?��\�;\�\�իͳ\�>{\�m\�<��\�A?\�\�\�\�ҥK���;�f͚\�X\�����2�6\�E\��U\��\��6,�(\�\�r�M��\�{D@O~��z��\��\�\�_mn�喲\��\�\�+7\�\�g�}f�\�\��~(\�@�+V�;vX�ugml쩧P��\�;�\�şw\�y\�+�0��fĈ\�X��\���\���~�T�\�Ç�\�\�T\rx\�\���w@��b�\�W-���Cz���%\�K\�@�e�\\ϑ\�r�w����蘻��\'��xy\�LE��C\"��S{���§��t]�\�&�a\r_�Ѣ��\�\Z�ѐ7\�ԣ�\�\�í\0���U�=���3\�\���kt��>��쫓\�\Z\���iӦ�^���\�T��C\��\�OHxG\�=s}�\�BM\�y\r\Z4X.��S���u\�dy\�2���=j�x\�	kz�����w�^�ױx��z\�\\u\�U\�>8exF{\�\Z\�\��={v\�z}\�̜+��\�Z��`t��\�\�\rx���r��~\�p\r@����\���\�8_\�c	�E�1\�\�?\�O�#\�N?�Nw�>���ִH��*11�\��qk|\�Z��N���\�K\�#�<b���ڲ)�3g\�4�>\�\�\�o}���W{\���CHC\\?|\�!C�\������\�c\0�;�N�\\d�$�\�;p)\'T�6\�5kUfݺu���\��ͬY����]�;Eu\�h\�\��a�\�oZ\����tj\�M7\�T֛oڴ���\�\����\�\�0\�\�ŋ\�f\�谒��*77\�z��9p\n \��S<\"��\�ϯ\�#Q+�Az�Y&���ꫯ��\�����������T��#GZ�t8%p6��Έ)\�D`\�\��pG�KHHx<\��\�;}P�f�K\��3;P�xw\0\�\0 \�\0�;\0�p\0\�\0@�\0w\0\0\�\0 \�\0�;\0\�4\0\�\0\0\�\0@�\0w\0\0\�\0�;\0�p\0\�\0\0\�\0@�\0\�\0 ܁\�\�Daa�\�MC�\0yReQBK�pG�\�\�\�\�\�ϧ!B��#G�e���\0\�*���\\���KC��\�\�\�<Y$\� \�Qe\�\�\�\�ddd��x<4F\�J\�\�\�\�/\�4wTو#\�J�oMOO�1jQrr�2y\�ǎ��\�\0\�\�\�_���R���GcԂ����\��+�\��GZ�;�\���㿕`�\�o�\�%\�k>طm\�\�\�\�r\�*�C2-\�\�j̘1\�KJJ�ٲeK^ZZZ6c�A����<{\�֭�\��\���h\�Z����NIIY������v\�޽\�ȑ#��>>++˼���\�2�\�<�Ç,ߐ\��\�\�\�\�\�se\�X��\"hT7�\�\�ҥKddd\\-5J�7��	տy\�ƍfӦM&55\�\Z4(����\�!�R/���;jܸq\��`\ZGP7C\�%\��6m\�^=8\�2\0@�\0w\0\0\�\0 \�\0�;\0\�S��`�\�\r\�A�p�e���e�\�ohEI\�J=/\�Vj̈́����PW\�$�Bj�\�R�\�\�3���\Z.5Z\�Q�\n�\�\�x֜<\Z��+\�z�^��\��	�;\�,-�Hu+\�7�:I�+\� \��iN1\�	���\�\�R�h&\�/�j�\�큾�\�_\�nn�;X�z���K�\Zﰌΐii�\�\�\�h\"4\n�~\�x\�ص\�/\�@\�\0\�\�p��~!���۵\�\�W*��\�87\�-�iP��C\0\�!\����\�v�J}Ks�p�AO1p�TJ%\�4�\�m�c�̄:�a\�:#f�T;�����^/���\�p��vx\�\"GH\r���}\�a��\�ˠ.\�.Ud�\���\�\0=w\0\0=w D\��I�\�\"H}H��p����\�}\0M\�p��v�ݜ!\�7\�T \�\�\�\���a�h�	�;\�,{h\�$f\�\0\0\�\0 \�\0�;\0�p\0\�\0@�\0w\0\0\�\0 \�\0�;\0\�4\0\�\0\0\�\0@�\0w\0\0\�\0�;\0�p\0\�\0\0\�\0@�\0\�\0�s\"h\�7�\'O~�\�r=Y�\�\�\�\�\���HHHp\�j�\����>,l3�\0\��c\�\�\�x<���\��Z�;\��\�p{��G>�\�T \���Оw�M�qv�\��.�\�p�\�\�ؕ�Ȫd��z{ff\�JZ�;\�s\�\�)�Ţ\nn.�{����Jh-�U\�J	u\�\�EXX\���;\�0:\�\"A��\�\�rE\�⇌��\�w�at\�E�<��~\�\�/aH�;\�P\�Vp\�g�w��8��\�����\�r�݋h\�C\�C/�V/ILL,�u@�\�vʸ�\�\�b�w�\�bbb\��_���N�U@�g\���\�k\�#\�sh8\�sGPx<���{�\�]PPp}aaaϣG�Ƹ\�\��{���\�ڵkͅ^\�\�[n�\�\�)>�fq8**j\�\'f6\�\�m \�Q#$\�o_�~�s\�\�ű\�ڵ3Z�7\�#>C�\��\�o~�m+�.��l���7133s̗_~����\���\�\�\'�΃?�eP�\�\�\�����ܲe\�؋/�\�t\�\�\�4m\�4\�\�1�`��4ib:v\�h.�袨N�:�\�^�\�~�\�Av��.�\�ӡCB�Q��}�����\r$�\�^�|��wT+�ٳg\�U={��z���0?l~\�\��\�����\�0i\�4\�y�i�jаaCӯ_�\��a����~ڇ\�j�;O����\�!���}\�\�����\�]z\�x\�%�0�{��\�\r�\Z�k׮\����h\r^�ݺ�T�ʓ���)9~���\Z�Y{�h�jұc\�\�-[�\�RZ�;�L�;ꌘ�\�؋*\�k�էM�6�����\0\�*\�y\�:#�\"�\�\�\�\��Q�V�:\�b-湣\��\0%�ǎ\�\'�\�9�hMK��;�L�<e{�����t\�@�#�\"4���c4=~�p�#�\�<\�DD5<m}xdӢ\�0\Z \�\�D�Z�o\Z�\�Y\��\�m.��\0\�NUz�\�u%\��i�p�?z\�:�\�Ў\�n;zx�I[?\�\�\0\��\�M\�(���)<��\�m\nsRM\�ڗ͑�\�\�Üw�\�0e\nA\�ص\�ꙟ\r=\r�n�/��6=&�k�6\0z\�)\�?\�`?�/=�\�u�Ҁ\0\�P�=�J\�	�\��A�\�5\�q\Z�\�\0 \��\�k�\�u=#`\�\�3��ۮ�bo&PG\��IC�\�R�~\�:J\� ��\�\�-+U(\�_j�ԗ�<���uå\Zۏ\�î-R��J�Z\�K\�>\�R�\��zVjq%�\�T\�퍤.�Ct�m_\�˿K�پ��ԍ~\��r�;�D�K\��\�Yl;\�騠+\�^��?:K��?@�H�\'5\�/�\�f3\�\�\�\�L\�\��4��*\�v�\�eR�\�\�J}S\�v��j\0\0\�IDATJ\r�C]䴗��\�پ\�k�a��ء\��K\��\�\�v\���J^û��\�է�^�~#(5\�!�\�&\���;�d�\���\�o�\�6�E\�O\�\�\�\���\�N�i�;f�+��\�\\˄�Iv���\��w�wvLy\�KM�/��\�9\n\�muxF�b6\�\�\�\�\�ټ\0\�\�H\�x�������\�ٽ{���� ��\�Ҍw\�f�\�:V?\�xg\����N�<\�\�8_�Cסr��Ǽ^K�.g\��\�!݉�k�\�\�m��QR\�K%�R\0�\�Q3�_=H\�h9\���w\�fK\�\Z�\�\�%�~RJ�\�\��@�#\�;4�;� \�\\�g���Jn\�q��S�\�^n��<4;\�<\�\0\0\�Ծ�����h]...6�\�\�/�l�9R���;̊+\�ʕ+O�7\�|\�dffV�\\����9~���ӿ�\�[f\�ƍ��}���\n/w\�\�X�`�Y�v�uy���&//\�|�\�\�\�\'�\�S�\�L\�ƍ˶ߺu�\�\�\�7�\\r\�)�f\�\Z~\�c��\��\\oذ�Y�~}�۸\�nSXxr\�wDD�\�\�ζ>x\�޽{y\�P\�s�\�,Y�\����5ӦM3�<�\�\�Ȱ���\�3�\Z5�\����.:ك	3\�\�\�&66��\�\��ixk/�y�\�ֺ��ӻwo\�>\�\����iӦ\�s*�вeKs�����w\�N�\r�\�\�\�\���8q\��\�\�ԩ��\0\��C�SF�\Ze\�=�\\3v\�X�\�CY=\�;\�\�l\�\�=�\�_���Y�\�\�w��\�c�\rv\�:>\�_�n�7n\\\���\'�\�K\�`\�۷�u�gϞ\�s+JJJ��I\�\�ԯ_?\��\�6�Z�2�7o67\�|3/� �\�+:ެ�]\r�`\�a\r�)S��o�\�\Z\�nѢ�y�\�̈́	̭�\�jfϞ]6\�i�\�{\�ړ\�mSSS\�\�]{\�O<�4h�u]\�\���K�RRR�!�?�\�{�L��p\�W���z\��\�0f\����n=ߕW^i=N�6m̐!Cx��pv��W�M�6�.]��_��\�A}7\��t5t\�Pk�\�ª���&M��\\{\�>˗/7\��\�+�恵\��\��\�/)�\�\�\� \�o\r�A\�Ow\�\���~\���4�\�\\x\�\�\�?��{~��\�YM�4\�½�\�\�e��N>|xП�u\�\�\�0����\�u�]�f�{\�|��\�&��o\�n\r\�\�\���fƌ�\��\�\�u�^\�\�cbb�\�\�s\�.\\�\��\�0�z��>$ڷoo:dfΜi�}�Y���F�\��{uJHHH�\�^\�\���\�?=\�C2>\Z�;v�zŝ;w�B^�V�׮;1�����履~j�\��T�\��:6�=\��\�\Z}\�����\�]�G��Ç��mڋ�7o�y�駭\�\Z��A��p\�@C\\wX\�0Ƚ�\�k�\�qrݩ�\��W?k֬�\�u�\�ѣ�5\�F﫢���\r\�@:\\S^\�]\��u��OVV�\�3\���j\�Ν\���\�{\��\�\�M7\�ċ\�8\rY��`�\�\��s���Su.�\�sױn\�\�?���\�z������\�\�[;Hu�@e/�Os�\�ҝ�\�رc���\�\n~}\�g�y\�\Z�뮻�\�#G�<m\\6b�\�\�\�I\�\�\�\�Z;FW�^]v\0���Φ\���tǪ\�@}\��)���\�\�y\�:S�2ڣ\�o��}��5\�\�!�\�_|��z\��\�\�ql��\�?���d�qw\�\���::�U\�6�=�X�\�\�<zݱ\n\�s\��\���n�1\�\�g�\r@�\0w\0\0\�\0�;\0�p\0\�\0\0\�\0@�\0\�\0 \�\0�;\0�p\0\�\0\0\�\0w\0\0\�\0 \�\0�;\0�p\0\�\0@�\0w\0\0\�\0 \�Q\�o��0�\�\�!B����(�%@��\�bbb\�\�\�\�!\�ȑ#ɲ\�LK�pG�EFF�\�\�ͥ!B@fff�,�h	\�\�\�g222Nx<\Z�v�dgg��\���;�lĈk%ط���\��(99y��\�cǎ]Ck�pGu�ޯOII)\�\�ˣ1jANN\�\�k��\�\��#�\�\�f���\�J�\\�\�7\�\��5\�۶m\�\�r�n�\�!�\�j5f̘\�%%%\�lٲ%/---�1��KINN��u\�\��r�^i�E4	|\�iT��s\�\�:u\�\�\�\�\��\�\�\�M���w�������I\�2d�,�駟�֭[�\�\�ؐ�;u{vv���{�nعsgˢ��Y7uܸq+y�UM�>}F\�Bk�|h&9��\'��\�M�ht�t\�\�WK\�?�fR1��7oܸ\�lڴɤ���A��r�v�:$�C\�v��pG��ޤL\�j\�\�\�f\�b���ӦM����c\�\0w\0\0\�\0 \�\0�;\0�p\0\�p���׹\�=h�������\r�()=\��y��R�h&\�Ą�\�&�R�����\�^�!u�\�p�\�R�\�T�\�8ǳ\�\�Ѱ�H]i\�����\�\�L \�gi)5@�[9��)\�I�_�\�8\�Lsr�qO�mݥ^�\�G3�p�\�~�T\�o����zws\�\��\n\�\�PE]2\�x�et�LK{]�p�D�p��Q���\�;Ʈ=�|�Rh&l���\�ܮ���R�4w��!h!M����\0@\�I\�H��,��U\�[��;\�z��;�R*٦�\�n\��\�`&\�yˠ�\�1C�\�I�\��z�\�\�v\��,�\�[\�9Bj�\�?\�\�\�=|�^`Xu\�v�\"�\��?4\�\0\�!JO5�L�\�x\��@\�C��;\�\\M���\�h\n\��\r�{\�\�����\�8��v��\�D\�L \�g\�C\0\'1[\0w\0\0\�\0 \�\0�;\0�p\0\�\0@�\0w\0\0\�\0 \��p�	\0�p\0\�\0\0\�\0@�\0w\0 \�\0�;\0�p\0\�\0\0\�\0w\0@�A���<y�.�\�\�\nn�7\�EBB��V=w \�\��aa�i\�@�\�\��\�\�\�?\�b \�\��\�K�?�!���\�8���ΰ\�	��\�\�z�\�\�8Dll\�JY�d���\�\�̕�w�!\�̙S,��\�\�\�{����Jh-Hx�^�M\�x{XX\�Z	�;\�0:\�\"_X\�M�R?ddd,��@��C.\�;��\�7$��!\�C�\�\�O��K��틟\�: \��:p\��\�c\��]w�\\zJ�,	�E�w��t\�E�Ӏ\�KhΚ��g�w�\�bbb\��_���N�U\�t���\�ԩS;���L�^�\�\�\�\�\�;KF;;��i�\�ɛ\�U\�\�\�	\��.\'\���)S�L�\�]n�{��wT9�\�ۻ\�m]e9����ٸ��$��F||�;� w �H@k`�\��x\���������ǸM\��\�\�\�\�\�hQ\�@-�<yr\\XX\�K\�[o\�[n��\�cl�w\�n�5kf\Z7nl\nMNN�III1k׮57n4\'N��\�m�\�o���\�\��\�`�B��	�p_�_~�\�fܸq�u\�֧mkU��\�͐!C����\�\�\'�|b�׮�4�^�\��1�\�\�U\�4\�x���\�\��\\�\�6Æ\r3\r6<�ǈ��1���3_|���\�oM^^�\�+��\��}rr�VZ�n�or�d��B^\�$���0u���K/�%_��\�\�\�̘1\�t\�\�\�\'=�\�O\�/�^�N�e\�����A�5�\�{\�7Ʈ=�?�\�O֘zU\�p\�}�\�\���C4�im\�@\r\�\�\�\�\�:Ʈ�\\\�`��{\�\�z\\\�0y�\�iu\�@�\�廠;O\�PLE��⊲\�\�{�\�<\�u\�]7&..\�a^.�eP�葧\�k���׮\�&L0�/�M��c�			)�\�gԨQmڴ6U�^#\�Ⱦ\�q^9\�@%\�S\nXc&���7-Z�\��\��A�����ڷJ\�zfy�~\�9\�\\*��{�\�\�\�֌W	�;�#\�b|�/�䒠>�>�_����)S�L�oz��\�I�7��6^ \��O4�w�[�nA}��]��_7\�x\��!�ޜ0\�T�v�:tL�\�Aꋟ�8�0��-$L\'܁\�\�\�IYm\�+�\�\"	\�@\�(�|~~~P^O2V	=?�ˮ3y��-�\�!܁Г)\�]/\�I��\���~�{<�\�].��RXw�v��M\�8V\�y�f�p*�\�\�{�\����\�i��l�7o\�\"Y.\Z5j\�۵k7I\�/a?! \�O\��\�\�\�\n\�8[�+$Puιu>��#G\������]HJJ*�\�|��=�\�j�	��p~\�:\"baii\�?�\�-[LvvvPd\�!�\r6x�z\��+\�6!!!I3_/O�<�RY���=P��j�:gʔ)\��hP��瀙:uj�?���\��|WW\��\�<B	\'C]��\���Ҿ}������>�\�#OY\�\�z�&\�Y||�Bc�\�O\�=���ִ\�\�\�g͚U\�v�}\�zWfdd$\�\� ܁�q�T�^HOO7\�=�\\�^�]>(<��\��Mk,�^���T ��������s.�\��}�:\�<\��\�ú\��\�\�\�4m\��G?�\�<�\�S�\�}�]Y�H���-\�sZ�;P���\�\�>}�耻��F��\�?��sSTTd:w\�l����謘���^zɓ��W\��\������he�*fˠΛ<yr�,^�?������\�]O۫g�ԓ�\�Ѭ:����(iO_\�}\�\�1�\�K=��=\�shY\�@-\�_J�p�\�\"��\�1����oiQ\�@h��5зIȏ2g\�J�7233\�a\�)w �ٿ�z���P�z��^ውw����FO)0�L��\n\0\0\0\0\0�\�L�\�\�w]\�۟9��-1\�\�M��BO\�\�w]w��~\'/\�^\��������Ku��7�\�4\'B��E}0@\�M�v)���R�.�\��Im�C\��zG�>\�J=Ds\�	8Bu��\�\�I-���\�<�MR���H\�2\�Y1�?��C1:c\�<�˥ڗ���<4+\��K�Z\�K=h�a\�Ϸ]\�=�?���\�}4\�ۗo�\�\�\���;P\���-\�_\�+�\'���\�ڭ\�\�\�x�k�>�����.�9\�ˠ>��\�\�J)RӤ\Z\�P��\��\�b+��\�!�uR�5\�s\�\�zO\�S\�=\�	\0B\�Pu\�G\�N�\�\Z\�Ћ?\�\�_Wj)o�쟲\��܁��;BuFL�\�\Z)�qj�\�&\�\�\�\�o��\� �\��l�k�\�J\����\�\�{�\0�Z\�/\��\�=���}�\��[~�u�$\�\�\0Pp�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 �?8\r��,9\�\0\0\0\0IEND�B`�',NULL),('10005',1,'补贴申请.bpmn20.xml','10004','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"allowance\" name=\"补贴申请\" isExecutable=\"true\">\n    <documentation>补贴申请</documentation>\n    <startEvent id=\"begin\" name=\"开始\">\n      <documentation>开始</documentation>\n    </startEvent>\n    <userTask id=\"selfVerify\" name=\"申请人办理\" activiti:assignee=\"${username}\">\n      <documentation>申请人办理</documentation>\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"leaderVerify\" name=\"领导审核\">\n      <documentation>领导审核</documentation>\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.yangzc.studentboot.workflow.allowance.listener.MyTaskListener\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\">\n      <documentation>结束</documentation>\n    </endEvent>\n    <sequenceFlow id=\"submit_apply\" name=\"发起流程\" sourceRef=\"begin\" targetRef=\"selfVerify\">\n      <documentation>发起流程</documentation>\n    </sequenceFlow>\n    <sequenceFlow id=\"self_agree\" name=\"同意\" sourceRef=\"selfVerify\" targetRef=\"leaderVerify\">\n      <documentation>同意</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[{$outcome == \'提交\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"leader_not_agree\" name=\"不同意\" sourceRef=\"leaderVerify\" targetRef=\"selfVerify\">\n      <documentation>不同意</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome == \'驳回\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"leader_agree\" name=\"同意\" sourceRef=\"leaderVerify\" targetRef=\"end\">\n      <documentation>同意</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome == \'通过\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"give_up\" name=\"放弃\" sourceRef=\"selfVerify\" targetRef=\"end\">\n      <documentation>放弃</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome == \'撤回\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_allowance\">\n    <bpmndi:BPMNPlane bpmnElement=\"allowance\" id=\"BPMNPlane_allowance\">\n      <bpmndi:BPMNShape bpmnElement=\"begin\" id=\"BPMNShape_begin\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"180.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"selfVerify\" id=\"BPMNShape_selfVerify\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"150.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"leaderVerify\" id=\"BPMNShape_leaderVerify\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"181.0\" y=\"450.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"self_agree\" id=\"BPMNEdge_self_agree\">\n        <omgdi:waypoint x=\"195.0\" y=\"230.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"195.0\" y=\"300.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"give_up\" id=\"BPMNEdge_give_up\">\n        <omgdi:waypoint x=\"245.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"324.5\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"324.5\" y=\"464.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.0\" y=\"464.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"leader_not_agree\" id=\"BPMNEdge_leader_not_agree\">\n        <omgdi:waypoint x=\"145.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"57.5\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"57.5\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"145.0\" y=\"190.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"leader_agree\" id=\"BPMNEdge_leader_agree\">\n        <omgdi:waypoint x=\"195.0\" y=\"380.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"195.0\" y=\"450.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"submit_apply\" id=\"BPMNEdge_submit_apply\">\n        <omgdi:waypoint x=\"195.0\" y=\"45.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"195.0\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('10006',1,'补贴申请.allowance.png','10004','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0N\0\0\�\0\0\0&�\0\0\ZIDATx\�\�\�Ml\�\���9r\�1�=\�\�[^\�\�R3\�V��:	mcĪ�C�4\�	I7�[-��l7Q$ҕ�iP+�\�\�\n�S\�6\Z\�.��\��E\�&\�fl\�g��\�a�����|>ңD;i<�o�y�c�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T�\�\��\�Ͽ�\�\�N��\��\�|\�;���1l߾=\�\�ׇ]�v�\�\�ֹ\�^{m��\�\��fb@U�رc����(|\�{\����\�w��]H�\�!�͆(�ull,��\��N�\�w�^z饹\�\�\��6A��$���+���\�\�{\'����a�Ξ=���\�\�{nv۶mO�&�\�O�[~�\�_N>���\�ĉk\nf�\�\�\�\�\�\��>�M͏?�xz�\�\�\�\�ŋ\�a�z�j�޹s\�/L\�t\�I3F3>f�0\�޷��\�|]]\�S6���f<>��\�R\'φ��\�o�6�\�o=x�\��\�4\�ӯ�\���;2&T�\�Ǐ_�Ϟ߾};��]�v\�\�e*��_�_r�Ν;�:��\��z���ճ\�>�K�RO�>P�\�\�(\�z뭰�\�|�\�/�o\�~\��\�{\�F��\�p��>P�\�vܸqcC\�922�K\�9o�@E��r���%��\�\'+�>P�b�\�*\�3\�<�\�\'\�/��2\'�@\�z�\�7�1\�\�ׯ\�z��X���\�Ϫ�\�Gc�U*\�믿���:\��y\'P�~�\��k����\�����\�C@E{饗no\�{Փ�\�W�\�\�-S*ZSS\�\�ٳg#N���8��\�H���\�s\�e\���8\�\��YSS�\�ā�s|�\�g\�\�\�ϟ?#�w\�|<��\�\�\��gr�|\�shxx�V\�9wс\�\Z\����X\�a�<N�s���ݦlZI\�:��\�?�\���<a��\�O~r)\�=߾}�[�\nlz�1\�\��\��\�?��ӟ���b�<y�\�Ix�\�A\�����Fhccc\�\�W_��\�o;\�ڵ�\��\�\�{\�\�\�3z\����\�{\�ߊ�LϞUmǎ_ON�]I��\�\n\�||\�y|�w,\�G\�\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0E���\\aM��?\�ٰR8kkk\�L\n\�\�x�/\�LMM\�SX\�3�J���\��\\\�\�i�M�5�:=�	�r<�;m�Ar\�\�YΗM`u�\�;�u:m�>�\r\�9l����\�O?�4�����\'OZ�zzz\�\'�|�O\�;*@�\�\�ӧ\�\�\�X����\�\Z}}}�$�oؕP\�\�IS4\�\'�\�	t֮�2V��x\�ݮ�2/T�N`\�9=u#��\�\�B\��;+�}��\�	\'\�+3���/��\�޻V�Z�M����h\r_��h.�kN�p�p��~�Z\�p\�\�O8A8�\�\�\'�g�M���S8�x�p\�g\�K�3\�&x\�	\�Y�.���d8\�m�\'� �E\�f�|��7�｛�|-\�&x\�	¹ĺ�w\�	g��\�	\'\�Rkf&\\\Z8r\�\��\�k�6�N΢w\r]\��i\�\�8\�m\�=$� ��\��N�?w��d4W����N�\�	UΕN�N�\�	\�Yt�改\�\�S\0��.��\�\�%�\�	\���%��p\n\' �\�	�%� ��p�pZ\�	\�)�\�	�p\�)��pZ\�	\�i	\'�%��p\n\' �\�Κ��-v-��\�۷\�L�R��ss�3��D:�\�����}��}(��>\�\�fmm\�N\�\�p�f�ٰhff&=z��/��M;\�\'��k|��p�o83�\�\�cccs�����\�\�\���\�\�ƭv<�O8�:�T8\�/���CCC��\\.�$�χ\�\�\�|KK\�A�\�/�_�@\�]x\�,�u\�̙055�k411�92�����\�\�j`=\���X\�t:ttt�\�\�ɵv�\�\�ğ�����\�4����\�\�TҶ���gy�>� 477�\�V\�\�z5��\�\�\��z*�zR+0��λ�Y.�q&��\\\�r��zr(	`{[[\�|r�\�-��\�Lgg\�ߒ\��ߞ\�\n\�xx\�\�ċ�\�\��\�!�\�}\�Q\��(�UO�ܾV__�رc�\�\'�._�|���n&��\�gMMM�\��ZagnK�0��r\�Y�g\�\�\�Ғ�\�f�S���C�?��\�v�V\�# �\�\�(�09�v\�\�!�\�;��\�0�S8�W]+C8�ӧ#i�a�p\n�V\�\�ǼI8�\�0�\�N�0ᴄS+\�N�0�S8�\�\�C8��0ᴄS+C8-\�\�\n\�NK8�\�0N\�\�\n\�@8��0ᴄS+C8-\�\�\n\�NK8�\�0N\�\�\n\�@8�S+�\�0�S8\�\n\�NK8�\�0�\�N�0ᴄS+\�N�0�S8\�\n\�NK8�\�0�\�N�0ᴄS+\�N�0�S8�B+C8��0�2\�\�\�+X©��Z�>}:766&Ze��]���$��v�VF�;u\�ԏ���򣣣�t:]�\�\�\�\�K\�v�VFH.ֶ\�3\�&V\�:s\�L\�\�\�]]]�R�?ē�hj�a�!B[\'&&򓓓���y\�D�\�`CCC�a����|*�j7�0à�L&�t.��:4\�\�\���\�h�a�FFF\�B����\\}}�Y\�\�\nÀ\"\�\�ý��\�Ǐ\�}\�`JZa� i\�\�l�T7C>�---ٚ��-����t:�	+�r\�J|��˴�\�0 \�\�߿R7\�\�\�\�d\�;���[ML+�����_$a\\6����CN�ZaP\���ߟ-\�˗/_H�M\�c�ZaP`۶mO%�\\ꉡ����Ϫk�a�>|.>�^\�\�߾X[[��\�h�a�\�]�\�\�\�\\��߯�R�\�\�9��a,c�\�\�{&&&\�|\��^u��0X�\�\�\����r\�^�n\ZZ�a�\n�y\�\'�	#\�\�\n�{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0\�\��{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0\�\��{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0\�\��{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0�jO�\�}�6)�0�\�hX)����m&��w\��e���\�bJZa�\�Sg*�j7!�0Xzo,�X\�ӦV�a��S�\�6�\�`\��q\�i�0\� 9a\�,\�\�&��\�#w\�t\�\�\nS0V�G\Z\�\�\�\�0!�-���ß~�i\�\�\�\r\'O��6x���O>�$��#v�VF�\�<}�t���\�#Z\�\�㡯�/�D�\r�R+�\�œ�h�O<�\�]��Q\�\�\�s\�*�\�ەZae.^��%�Za�C8��n��\��<\\\�9xgſ�_;\�\�\n\�\�%Vf2>�h_8���w���x�\�	�V�p�\�\�\�\�u\�\�	�N�0\�,^����ጷ	�pj�ag\���䁒ጷ	�pj�a�p\n�V\��,z�p\�\�O8�\�0��h]\��Y\�p\�\�O8�\�0��h\�L���f��wӓ�\�\�O8�\�0�s�u\�\�\�\��5�N�0\�\\j\�̄KG�|-\�&x©�!�E\�\Z�\��Ӓ�q\�ۼ{H8�\�0�s\�y\�ҩ�\�\���\�\�\��\�\�S8�\�0�6�+�2�>�S+C8�.\�՜2�;}\n�pj�aT]8\�7��K\0�S+�:㴄S+\�N�0�S8\�\n\�NK8�\�0�\�N�0ᴄS+C8�S8�\�0N\�\�\n\�0\�N�\�0�\�N�0ᴄS+C8-\�\�\n\�@8�S+�թ��\�\"�©��*��H�ә����o߾KT8�S+�\���po6�\r�fff\�ѣGo��\�\�N\�\�\nà@&�yzlll.�088\�\�\��\�\�ظU8�S+�\�\�o\Z\Z\Z\�\�ra%�|>tww\�[ZZ\n�pj�aT�\�\�\�ק���a�&&&#G&N�8!X©�qV\�\�\�\�&\'\'\�\�\�;?6�3\�i��R8��*�cǎ�777�\�V\�\�z5��\�d�]\�\�\�,\�N�S*�jokk�ON��eߜ\�\�\��[�\���\�c��!ۥ\�F\�.�\�I�\��k���g�;�+~�\��\�\�\�\�\�fjkk?kjjz|�g\�1�\�}m�oN\�z7PCKKKvppp>�\�N���%_\�į�p\n�p�N�\�\�7S�k��sH8�S8)��.w�p\n�p\�\Z	�p\n\'�p\n\'T_8�r$�ᴄS8NK8�ᴄS8A8�S8A8�\�D8-\�N�\�N\�D8-\�NN\�NN\�D8N\�D8NK8�ᴄS8NK8��S8��S8N�\�N\�D8-\�N�\�N\�\�N\�\�N�\�N�ᴄS8NK8�\�,\�NN\�NN\�D8)����%�\�	kq��\�\�\�ؘh���v\�\�ߓp\�ڕ\�I�;u\�ԏ���򣣣�t:]�\�\�\�\�K\�v�pR���-9\�Lǻ���Μ9:::BWWW�\���)�\�	\"��ubb\"?99���GMD8�\r\r\r��T�\�T�(!�\�<�\�\�B�C�\�755=n:\�	,addd.���\�\�\�ן5\�����?�K.�SN`A\�\�\'�\�l�n�|>ZZZ�555[LK8�D:�΄\\�r%>Q\�eZ\�	$���W\�f�����Rcc\�VN�z��\��E\�e\�\�\�\�:\�\�)�@��\��T4/_�|!��2\�N���m۞J�\�C3uuu3�UN`	�>�A/��\�o_����\�t�XB�+\�\�ݝ+x��\�T*u\�;��X\�\�ݻ�LLL����\�\�\�	�Bgg\�x�X�\�¹n\Z\�	�B�k/����i\'\��\0\r�\0�h��E�=\0.\Z\��E�=\0.\Z\�p\�`��{\0\\4\�\��\0\\4\�\��\0\r�\0�h��E�=\0�h��E�=\0.\Z\�p\�`��{\0\\4\���{\0\\4\�\��\0\r�\0�h�\0\r�\0�h��E�=\0.\Z\�p\�`��{\0p\�`��{\0\\4\�\��\0\r�\0\��\0\r�\0�h��E�=\0.\Z\���d$^$+�i�N\��H\�Jᬭ�m3)\�\�HƗ	g���f�)	\'�\�Sg*�j7!\���P�z�s\�iS8�5�:=�)��\�\�u�M�\� 9a\�,\�\�&\"��\�.�;�u:m\n�)@	;v\��zr\���\�BN�R��\�[��~\"~�i	\'T��2�\�⸙�5�\�C�/M����;bz\�	\�\�\'�5�\�X�X��m\���i\n\'lz\�]�\�Ę/�`r<����S�N�����\�_�\���GH�ӡ��?��曡���8�y�O\�\�Ͷ»\�1�\��^�199y\��\�\�\�}\�t�6\�I�0�---wN��#�\�޽{��p¦\�,�{����\�߯x7�СC\�wۿa\�\�	�%�7O�\Z\�\�x�<o��p\�f�f{\�c��{�|��텏y�\�.��6�W�\��\�\�z8z��S�p\�\�\�\���P<޼ys]\��m/|�R|Lu��1~\�u:\�	ei\�m�wbv��ᰞ\�\�<N�\'J�\����#�P�x1T}}}\�\Z\��\"��p��\n�p\n\'��\�\�x\�O\n�\�0*\��\�\�\�]/��M:\�	\��z\�\�\�z	\�r/MZ\�{\��\�\'�\�\�_\\\�?4\�*\�\�*sO�\��ַ�=�Za$PQ\�c��~9��S8�J9q>�g\�-�@o	\'P\�\�\�u�E\'Ќ?�,\�w�O}=\�9T__��wT\�\�u\�UX��p�\\�\�\�ܳg\�]�M��\�,\�|2�Z\�a�+��\�\��\�+�Ρ\�\�Q>\�\�*:i��lNI\�\�*����	����j�=�O��\�$\�ݦl\�g�\���\��u��E�~�zGGGx\�g\���\�1Ʀ\nlz�y\�|���\�1M�\ZO�o\�G@\�\�&\��\�9P\�~7Q\�\�{\�\�B9��	\�\'�#\0\0\0\0\0\0\0\0\0\0\�\���㬂\Z\�v\0\0\0\0IEND�B`�',1),('10019',1,'补贴申请.bpmn20.xml','10018','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"allowance\" name=\"补贴申请\" isExecutable=\"true\">\n    <documentation>补贴申请</documentation>\n    <startEvent id=\"begin\" name=\"开始\">\n      <documentation>开始</documentation>\n    </startEvent>\n    <userTask id=\"selfVerify\" name=\"申请人办理\" activiti:assignee=\"${username}\">\n      <documentation>申请人办理</documentation>\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"leaderVerify\" name=\"领导审核\">\n      <documentation>领导审核</documentation>\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.yangzc.studentboot.workflow.allowance.listener.MyTaskListener\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\">\n      <documentation>结束</documentation>\n    </endEvent>\n    <sequenceFlow id=\"submit_apply\" name=\"发起流程\" sourceRef=\"begin\" targetRef=\"selfVerify\">\n      <documentation>发起流程</documentation>\n    </sequenceFlow>\n    <sequenceFlow id=\"give_up\" name=\"放弃\" sourceRef=\"selfVerify\" targetRef=\"end\">\n      <documentation>放弃</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'撤回\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"self_agree\" name=\"同意\" sourceRef=\"selfVerify\" targetRef=\"leaderVerify\">\n      <documentation>同意</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[{$outcome==\'提交\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"leader_agree\" name=\"同意\" sourceRef=\"leaderVerify\" targetRef=\"end\">\n      <documentation>同意</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"leader_not_agree\" name=\"不同意\" sourceRef=\"leaderVerify\" targetRef=\"selfVerify\">\n      <documentation>不同意</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_allowance\">\n    <bpmndi:BPMNPlane bpmnElement=\"allowance\" id=\"BPMNPlane_allowance\">\n      <bpmndi:BPMNShape bpmnElement=\"begin\" id=\"BPMNShape_begin\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"180.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"selfVerify\" id=\"BPMNShape_selfVerify\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"150.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"leaderVerify\" id=\"BPMNShape_leaderVerify\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"181.0\" y=\"450.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"self_agree\" id=\"BPMNEdge_self_agree\">\n        <omgdi:waypoint x=\"195.0\" y=\"230.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"195.0\" y=\"300.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"give_up\" id=\"BPMNEdge_give_up\">\n        <omgdi:waypoint x=\"245.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"324.5\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"324.5\" y=\"464.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.0\" y=\"464.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"leader_not_agree\" id=\"BPMNEdge_leader_not_agree\">\n        <omgdi:waypoint x=\"145.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"57.5\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"57.5\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"145.0\" y=\"190.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"leader_agree\" id=\"BPMNEdge_leader_agree\">\n        <omgdi:waypoint x=\"195.0\" y=\"380.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"195.0\" y=\"450.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"submit_apply\" id=\"BPMNEdge_submit_apply\">\n        <omgdi:waypoint x=\"195.0\" y=\"45.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"195.0\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('10020',1,'补贴申请.allowance.png','10018','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0N\0\0\�\0\0\0&�\0\0\ZIDATx\�\�\�Ml\�\���9r\�1�=\�\�[^\�\�R3\�V��:	mcĪ�C�4\�	I7�[-��l7Q$ҕ�iP+�\�\�\n�S\�6\Z\�.��\��E\�&\�fl\�g��\�a�����|>ңD;i<�o�y�c�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T�\�\��\�Ͽ�\�\�N��\��\�|\�;���1l߾=\�\�ׇ]�v�\�\�ֹ\�^{m��\�\��fb@U�رc����(|\�{\����\�w��]H�\�!�͆(�ull,��\��N�\�w�^z饹\�\�\��6A��$���+���\�\�{\'����a�Ξ=���\�\�{nv۶mO�&�\�O�[~�\�_N>���\�ĉk\nf�\�\�\�\�\�\��>�M͏?�xz�\�\�\�\�ŋ\�a�z�j�޹s\�/L\�t\�I3F3>f�0\�޷��\�|]]\�S6���f<>��\�R\'φ��\�o�6�\�o=x�\��\�4\�ӯ�\���;2&T�\�Ǐ_�Ϟ߾};��]�v\�\�e*��_�_r�Ν;�:��\��z���ճ\�>�K�RO�>P�\�\�(\�z뭰�\�|�\�/�o\�~\��\�{\�F��\�p��>P�\�vܸqcC\�922�K\�9o�@E��r���%��\�\'+�>P�b�\�*\�3\�<�\�\'\�/��2\'�@\�z�\�7�1\�\�ׯ\�z��X���\�Ϫ�\�Gc�U*\�믿���:\��y\'P�~�\��k����\�����\�C@E{饗no\�{Փ�\�W�\�\�-S*ZSS\�\�ٳg#N���8��\�H���\�s\�e\���8\�\��YSS�\�ā�s|�\�g\�\�\�ϟ?#�w\�|<��\�\�\��gr�|\�shxx�V\�9wс\�\Z\����X\�a�<N�s���ݦlZI\�:��\�?�\���<a��\�O~r)\�=߾}�[�\nlz�1\�\��\��\�?��ӟ���b�<y�\�Ix�\�A\�����Fhccc\�\�W_��\�o;\�ڵ�\��\�\�{\�\�\�3z\����\�{\�ߊ�LϞUmǎ_ON�]I��\�\n\�||\�y|�w,\�G\�\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0E���\\aM��?\�ٰR8kkk\�L\n\�\�x�/\�LMM\�SX\�3�J���\��\\\�\�i�M�5�:=�	�r<�;m�Ar\�\�YΗM`u�\�;�u:m�>�\r\�9l����\�O?�4�����\'OZ�zzz\�\'�|�O\�;*@�\�\�ӧ\�\�\�X����\�\Z}}}�$�oؕP\�\�IS4\�\'�\�	t֮�2V��x\�ݮ�2/T�N`\�9=u#��\�\�B\��;+�}��\�	\'\�+3���/��\�޻V�Z�M����h\r_��h.�kN�p�p��~�Z\�p\�\�O8A8�\�\�\'�g�M���S8�x�p\�g\�K�3\�&x\�	\�Y�.���d8\�m�\'� �E\�f�|��7�｛�|-\�&x\�	¹ĺ�w\�	g��\�	\'\�Rkf&\\\Z8r\�\��\�k�6�N΢w\r]\��i\�\�8\�m\�=$� ��\��N�?w��d4W����N�\�	UΕN�N�\�	\�Yt�改\�\�S\0��.��\�\�%�\�	\���%��p\n\' �\�	�%� ��p�pZ\�	\�)�\�	�p\�)��pZ\�	\�i	\'�%��p\n\' �\�Κ��-v-��\�۷\�L�R��ss�3��D:�\�����}��}(��>\�\�fmm\�N\�\�p�f�ٰhff&=z��/��M;\�\'��k|��p�o83�\�\�cccs�����\�\�\���\�\�ƭv<�O8�:�T8\�/���CCC��\\.�$�χ\�\�\�|KK\�A�\�/�_�@\�]x\�,�u\�̙055�k411�92�����\�\�j`=\���X\�t:ttt�\�\�ɵv�\�\�ğ�����\�4����\�\�TҶ���gy�>� 477�\�V\�\�z5��\�\�\��z*�zR+0��λ�Y.�q&��\\\�r��zr(	`{[[\�|r�\�-��\�Lgg\�ߒ\��ߞ\�\n\�xx\�\�ċ�\�\��\�!�\�}\�Q\��(�UO�ܾV__�رc�\�\'�._�|���n&��\�gMMM�\��ZagnK�0��r\�Y�g\�\�\�Ғ�\�f�S���C�?��\�v�V\�# �\�\�(�09�v\�\�!�\�;��\�0�S8�W]+C8�ӧ#i�a�p\n�V\�\�ǼI8�\�0�\�N�0ᴄS+\�N�0�S8�\�\�C8��0ᴄS+C8-\�\�\n\�NK8�\�0N\�\�\n\�@8��0ᴄS+C8-\�\�\n\�NK8�\�0N\�\�\n\�@8�S+�\�0�S8\�\n\�NK8�\�0�\�N�0ᴄS+\�N�0�S8\�\n\�NK8�\�0�\�N�0ᴄS+\�N�0�S8�B+C8��0�2\�\�\�+X©��Z�>}:766&Ze��]���$��v�VF�;u\�ԏ���򣣣�t:]�\�\�\�\�K\�v�VFH.ֶ\�3\�&V\�:s\�L\�\�\�]]]�R�?ē�hj�a�!B[\'&&򓓓���y\�D�\�`CCC�a����|*�j7�0à�L&�t.��:4\�\�\���\�h�a�FFF\�B����\\}}�Y\�\�\nÀ\"\�\�ý��\�Ǐ\�}\�`JZa� i\�\�l�T7C>�---ٚ��-����t:�	+�r\�J|��˴�\�0 \�\�߿R7\�\�\�\�d\�;���[ML+�����_$a\\6����CN�ZaP\���ߟ-\�˗/_H�M\�c�ZaP`۶mO%�\\ꉡ����Ϫk�a�>|.>�^\�\�߾X[[��\�h�a�\�]�\�\�\�\\��߯�R�\�\�9��a,c�\�\�{&&&\�|\��^u��0X�\�\�\����r\�^�n\ZZ�a�\n�y\�\'�	#\�\�\n�{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0\�\��{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0\�\��{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0\�\��{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0�jO�\�}�6)�0�\�hX)����m&��w\��e���\�bJZa�\�Sg*�j7!�0Xzo,�X\�ӦV�a��S�\�6�\�`\��q\�i�0\� 9a\�,\�\�&��\�#w\�t\�\�\nS0V�G\Z\�\�\�\�0!�-���ß~�i\�\�\�\r\'O��6x���O>�$��#v�VF�\�<}�t���\�#Z\�\�㡯�/�D�\r�R+�\�œ�h�O<�\�]��Q\�\�\�s\�*�\�ەZae.^��%�Za�C8��n��\��<\\\�9xgſ�_;\�\�\n\�\�%Vf2>�h_8���w���x�\�	�V�p�\�\�\�\�u\�\�	�N�0\�,^����ጷ	�pj�ag\���䁒ጷ	�pj�a�p\n�V\��,z�p\�\�O8�\�0��h]\��Y\�p\�\�O8�\�0��h\�L���f��wӓ�\�\�O8�\�0�s�u\�\�\�\��5�N�0\�\\j\�̄KG�|-\�&x©�!�E\�\Z�\��Ӓ�q\�ۼ{H8�\�0�s\�y\�ҩ�\�\���\�\�\��\�\�S8�\�0�6�+�2�>�S+C8�.\�՜2�;}\n�pj�aT]8\�7��K\0�S+�:㴄S+\�N�0�S8\�\n\�NK8�\�0�\�N�0ᴄS+C8�S8�\�0N\�\�\n\�0\�N�\�0�\�N�0ᴄS+C8-\�\�\n\�@8�S+�թ��\�\"�©��*��H�ә����o߾KT8�S+�\���po6�\r�fff\�ѣGo��\�\�N\�\�\nà@&�yzlll.�088\�\�\��\�\�ظU8�S+�\�\�o\Z\Z\Z\�\�ra%�|>tww\�[ZZ\n�pj�aT�\�\�\�ק���a�&&&#G&N�8!X©�qV\�\�\�\�&\'\'\�\�\�;?6�3\�i��R8��*�cǎ�777�\�V\�\�z5��\�d�]\�\�\�,\�N�S*�jokk�ON��eߜ\�\�\��[�\���\�c��!ۥ\�F\�.�\�I�\��k���g�;�+~�\��\�\�\�\�\�fjkk?kjjz|�g\�1�\�}m�oN\�z7PCKKKvppp>�\�N���%_\�į�p\n�p�N�\�\�7S�k��sH8�S8)��.w�p\n�p\�\Z	�p\n\'�p\n\'T_8�r$�ᴄS8NK8�ᴄS8A8�S8A8�\�D8-\�N�\�N\�D8-\�NN\�NN\�D8N\�D8NK8�ᴄS8NK8��S8��S8N�\�N\�D8-\�N�\�N\�\�N\�\�N�\�N�ᴄS8NK8�\�,\�NN\�NN\�D8)����%�\�	kq��\�\�\�ؘh���v\�\�ߓp\�ڕ\�I�;u\�ԏ���򣣣�t:]�\�\�\�\�K\�v�pR���-9\�Lǻ���Μ9:::BWWW�\���)�\�	\"��ubb\"?99���GMD8�\r\r\r��T�\�T�(!�\�<�\�\�B�C�\�755=n:\�	,addd.���\�\�\�ן5\�����?�K.�SN`A\�\�\'�\�l�n�|>ZZZ�555[LK8�D:�΄\\�r%>Q\�eZ\�	$���W\�f�����Rcc\�VN�z��\��E\�e\�\�\�\�:\�\�)�@��\��T4/_�|!��2\�N���m۞J�\�C3uuu3�UN`	�>�A/��\�o_����\�t�XB�+\�\�ݝ+x��\�T*u\�;��X\�\�ݻ�LLL����\�\�\�	�Bgg\�x�X�\�¹n\Z\�	�B�k/����i\'\��\0\r�\0�h��E�=\0.\Z\��E�=\0.\Z\�p\�`��{\0\\4\�\��\0\\4\�\��\0\r�\0�h��E�=\0�h��E�=\0.\Z\�p\�`��{\0\\4\���{\0\\4\�\��\0\r�\0�h�\0\r�\0�h��E�=\0.\Z\�p\�`��{\0p\�`��{\0\\4\�\��\0\r�\0\��\0\r�\0�h��E�=\0.\Z\���d$^$+�i�N\��H\�Jᬭ�m3)\�\�HƗ	g���f�)	\'�\�Sg*�j7!\���P�z�s\�iS8�5�:=�)��\�\�u�M�\� 9a\�,\�\�&\"��\�.�;�u:m\n�)@	;v\��zr\���\�BN�R��\�[��~\"~�i	\'T��2�\�⸙�5�\�C�/M����;bz\�	\�\�\'�5�\�X�X��m\���i\n\'lz\�]�\�Ę/�`r<����S�N�����\�_�\���GH�ӡ��?��曡���8�y�O\�\�Ͷ»\�1�\��^�199y\��\�\�\�}\�t�6\�I�0�---wN��#�\�޽{��p¦\�,�{����\�߯x7�СC\�wۿa\�\�	�%�7O�\Z\�\�x�<o��p\�f�f{\�c��{�|��텏y�\�.��6�W�\��\�\�z8z��S�p\�\�\�\���P<޼ys]\��m/|�R|Lu��1~\�u:\�	ei\�m�wbv��ᰞ\�\�<N�\'J�\����#�P�x1T}}}\�\Z\��\"��p��\n�p\n\'��\�\�x\�O\n�\�0*\��\�\�\�]/��M:\�	\��z\�\�\�z	\�r/MZ\�{\��\�\'�\�\�_\\\�?4\�*\�\�*sO�\��ַ�=�Za$PQ\�c��~9��S8�J9q>�g\�-�@o	\'P\�\�\�u�E\'Ќ?�,\�w�O}=\�9T__��wT\�\�u\�UX��p�\\�\�\�ܳg\�]�M��\�,\�|2�Z\�a�+��\�\��\�+�Ρ\�\�Q>\�\�*:i��lNI\�\�*����	����j�=�O��\�$\�ݦl\�g�\���\��u��E�~�zGGGx\�g\���\�1Ʀ\nlz�y\�|���\�1M�\ZO�o\�G@\�\�&\��\�9P\�~7Q\�\�{\�\�B9��	\�\'�#\0\0\0\0\0\0\0\0\0\0\�\���㬂\Z\�v\0\0\0\0IEND�B`�',1),('10033',1,'补贴申请.bpmn20.xml','10032','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">\n  <process id=\"allowance\" name=\"补贴申请\" isExecutable=\"true\">\n    <documentation>补贴申请</documentation>\n    <startEvent id=\"begin\" name=\"开始\">\n      <documentation>开始</documentation>\n    </startEvent>\n    <userTask id=\"selfVerify\" name=\"申请人办理\" activiti:assignee=\"${username}\">\n      <documentation>申请人办理</documentation>\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://activiti.com/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"leaderVerify\" name=\"领导审核\">\n      <documentation>领导审核</documentation>\n      <extensionElements>\n        <activiti:taskListener event=\"create\" class=\"com.yangzc.studentboot.workflow.allowance.listener.MyTaskListener\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\">\n      <documentation>结束</documentation>\n    </endEvent>\n    <sequenceFlow id=\"submit_apply\" name=\"发起流程\" sourceRef=\"begin\" targetRef=\"selfVerify\">\n      <documentation>发起流程</documentation>\n    </sequenceFlow>\n    <sequenceFlow id=\"give_up\" name=\"放弃\" sourceRef=\"selfVerify\" targetRef=\"end\">\n      <documentation>放弃</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'撤回\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"leader_agree\" name=\"同意\" sourceRef=\"leaderVerify\" targetRef=\"end\">\n      <documentation>同意</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"leader_not_agree\" name=\"不同意\" sourceRef=\"leaderVerify\" targetRef=\"selfVerify\">\n      <documentation>不同意</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"self_agree\" name=\"同意\" sourceRef=\"selfVerify\" targetRef=\"leaderVerify\">\n      <documentation>同意</documentation>\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'提交\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_allowance\">\n    <bpmndi:BPMNPlane bpmnElement=\"allowance\" id=\"BPMNPlane_allowance\">\n      <bpmndi:BPMNShape bpmnElement=\"begin\" id=\"BPMNShape_begin\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"180.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"selfVerify\" id=\"BPMNShape_selfVerify\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"150.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"leaderVerify\" id=\"BPMNShape_leaderVerify\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"145.0\" y=\"300.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"181.0\" y=\"450.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"self_agree\" id=\"BPMNEdge_self_agree\">\n        <omgdi:waypoint x=\"195.0\" y=\"230.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"195.0\" y=\"300.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"give_up\" id=\"BPMNEdge_give_up\">\n        <omgdi:waypoint x=\"245.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"324.5\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"324.5\" y=\"464.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.0\" y=\"464.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"leader_not_agree\" id=\"BPMNEdge_leader_not_agree\">\n        <omgdi:waypoint x=\"145.0\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"57.5\" y=\"340.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"57.5\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"145.0\" y=\"190.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"leader_agree\" id=\"BPMNEdge_leader_agree\">\n        <omgdi:waypoint x=\"195.0\" y=\"380.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"195.0\" y=\"450.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"submit_apply\" id=\"BPMNEdge_submit_apply\">\n        <omgdi:waypoint x=\"195.0\" y=\"45.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"195.0\" y=\"150.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('10034',1,'补贴申请.allowance.png','10032','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0N\0\0\�\0\0\0&�\0\0\ZIDATx\�\�\�Ml\�\���9r\�1�=\�\�[^\�\�R3\�V��:	mcĪ�C�4\�	I7�[-��l7Q$ҕ�iP+�\�\�\n�S\�6\Z\�.��\��E\�&\�fl\�g��\�a�����|>ңD;i<�o�y�c�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T�\�\��\�Ͽ�\�\�N��\��\�|\�;���1l߾=\�\�ׇ]�v�\�\�ֹ\�^{m��\�\��fb@U�رc����(|\�{\����\�w��]H�\�!�͆(�ull,��\��N�\�w�^z饹\�\�\��6A��$���+���\�\�{\'����a�Ξ=���\�\�{nv۶mO�&�\�O�[~�\�_N>���\�ĉk\nf�\�\�\�\�\�\��>�M͏?�xz�\�\�\�\�ŋ\�a�z�j�޹s\�/L\�t\�I3F3>f�0\�޷��\�|]]\�S6���f<>��\�R\'φ��\�o�6�\�o=x�\��\�4\�ӯ�\���;2&T�\�Ǐ_�Ϟ߾};��]�v\�\�e*��_�_r�Ν;�:��\��z���ճ\�>�K�RO�>P�\�\�(\�z뭰�\�|�\�/�o\�~\��\�{\�F��\�p��>P�\�vܸqcC\�922�K\�9o�@E��r���%��\�\'+�>P�b�\�*\�3\�<�\�\'\�/��2\'�@\�z�\�7�1\�\�ׯ\�z��X���\�Ϫ�\�Gc�U*\�믿���:\��y\'P�~�\��k����\�����\�C@E{饗no\�{Փ�\�W�\�\�-S*ZSS\�\�ٳg#N���8��\�H���\�s\�e\���8\�\��YSS�\�ā�s|�\�g\�\�\�ϟ?#�w\�|<��\�\�\��gr�|\�shxx�V\�9wс\�\Z\����X\�a�<N�s���ݦlZI\�:��\�?�\���<a��\�O~r)\�=߾}�[�\nlz�1\�\��\��\�?��ӟ���b�<y�\�Ix�\�A\�����Fhccc\�\�W_��\�o;\�ڵ�\��\�\�{\�\�\�3z\����\�{\�ߊ�LϞUmǎ_ON�]I��\�\n\�||\�y|�w,\�G\�\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0\�	 �\0\�	 �\0\�	�p\'�p\'�p\'\0E���\\aM��?\�ٰR8kkk\�L\n\�\�x�/\�LMM\�SX\�3�J���\��\\\�\�i�M�5�:=�	�r<�;m�Ar\�\�YΗM`u�\�;�u:m�>�\r\�9l����\�O?�4�����\'OZ�zzz\�\'�|�O\�;*@�\�\�ӧ\�\�\�X����\�\Z}}}�$�oؕP\�\�IS4\�\'�\�	t֮�2V��x\�ݮ�2/T�N`\�9=u#��\�\�B\��;+�}��\�	\'\�+3���/��\�޻V�Z�M����h\r_��h.�kN�p�p��~�Z\�p\�\�O8A8�\�\�\'�g�M���S8�x�p\�g\�K�3\�&x\�	\�Y�.���d8\�m�\'� �E\�f�|��7�｛�|-\�&x\�	¹ĺ�w\�	g��\�	\'\�Rkf&\\\Z8r\�\��\�k�6�N΢w\r]\��i\�\�8\�m\�=$� ��\��N�?w��d4W����N�\�	UΕN�N�\�	\�Yt�改\�\�S\0��.��\�\�%�\�	\���%��p\n\' �\�	�%� ��p�pZ\�	\�)�\�	�p\�)��pZ\�	\�i	\'�%��p\n\' �\�Κ��-v-��\�۷\�L�R��ss�3��D:�\�����}��}(��>\�\�fmm\�N\�\�p�f�ٰhff&=z��/��M;\�\'��k|��p�o83�\�\�cccs�����\�\�\���\�\�ƭv<�O8�:�T8\�/���CCC��\\.�$�χ\�\�\�|KK\�A�\�/�_�@\�]x\�,�u\�̙055�k411�92�����\�\�j`=\���X\�t:ttt�\�\�ɵv�\�\�ğ�����\�4����\�\�TҶ���gy�>� 477�\�V\�\�z5��\�\�\��z*�zR+0��λ�Y.�q&��\\\�r��zr(	`{[[\�|r�\�-��\�Lgg\�ߒ\��ߞ\�\n\�xx\�\�ċ�\�\��\�!�\�}\�Q\��(�UO�ܾV__�رc�\�\'�._�|���n&��\�gMMM�\��ZagnK�0��r\�Y�g\�\�\�Ғ�\�f�S���C�?��\�v�V\�# �\�\�(�09�v\�\�!�\�;��\�0�S8�W]+C8�ӧ#i�a�p\n�V\�\�ǼI8�\�0�\�N�0ᴄS+\�N�0�S8�\�\�C8��0ᴄS+C8-\�\�\n\�NK8�\�0N\�\�\n\�@8��0ᴄS+C8-\�\�\n\�NK8�\�0N\�\�\n\�@8�S+�\�0�S8\�\n\�NK8�\�0�\�N�0ᴄS+\�N�0�S8\�\n\�NK8�\�0�\�N�0ᴄS+\�N�0�S8�B+C8��0�2\�\�\�+X©��Z�>}:766&Ze��]���$��v�VF�;u\�ԏ���򣣣�t:]�\�\�\�\�K\�v�VFH.ֶ\�3\�&V\�:s\�L\�\�\�]]]�R�?ē�hj�a�!B[\'&&򓓓���y\�D�\�`CCC�a����|*�j7�0à�L&�t.��:4\�\�\���\�h�a�FFF\�B����\\}}�Y\�\�\nÀ\"\�\�ý��\�Ǐ\�}\�`JZa� i\�\�l�T7C>�---ٚ��-����t:�	+�r\�J|��˴�\�0 \�\�߿R7\�\�\�\�d\�;���[ML+�����_$a\\6����CN�ZaP\���ߟ-\�˗/_H�M\�c�ZaP`۶mO%�\\ꉡ����Ϫk�a�>|.>�^\�\�߾X[[��\�h�a�\�]�\�\�\�\\��߯�R�\�\�9��a,c�\�\�{&&&\�|\��^u��0X�\�\�\����r\�^�n\ZZ�a�\n�y\�\'�	#\�\�\n�{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0\�\��{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0\�\��{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0\�\��{�0�O��{�0�O��{�0�>�0\�\�\��>�0\�\�\��>�0�jO�\�}�6)�0�\�hX)����m&��w\��e���\�bJZa�\�Sg*�j7!�0Xzo,�X\�ӦV�a��S�\�6�\�`\��q\�i�0\� 9a\�,\�\�&��\�#w\�t\�\�\nS0V�G\Z\�\�\�\�0!�-���ß~�i\�\�\�\r\'O��6x���O>�$��#v�VF�\�<}�t���\�#Z\�\�㡯�/�D�\r�R+�\�œ�h�O<�\�]��Q\�\�\�s\�*�\�ەZae.^��%�Za�C8��n��\��<\\\�9xgſ�_;\�\�\n\�\�%Vf2>�h_8���w���x�\�	�V�p�\�\�\�\�u\�\�	�N�0\�,^����ጷ	�pj�ag\���䁒ጷ	�pj�a�p\n�V\��,z�p\�\�O8�\�0��h]\��Y\�p\�\�O8�\�0��h\�L���f��wӓ�\�\�O8�\�0�s�u\�\�\�\��5�N�0\�\\j\�̄KG�|-\�&x©�!�E\�\Z�\��Ӓ�q\�ۼ{H8�\�0�s\�y\�ҩ�\�\���\�\�\��\�\�S8�\�0�6�+�2�>�S+C8�.\�՜2�;}\n�pj�aT]8\�7��K\0�S+�:㴄S+\�N�0�S8\�\n\�NK8�\�0�\�N�0ᴄS+C8�S8�\�0N\�\�\n\�0\�N�\�0�\�N�0ᴄS+C8-\�\�\n\�@8�S+�թ��\�\"�©��*��H�ә����o߾KT8�S+�\���po6�\r�fff\�ѣGo��\�\�N\�\�\nà@&�yzlll.�088\�\�\��\�\�ظU8�S+�\�\�o\Z\Z\Z\�\�ra%�|>tww\�[ZZ\n�pj�aT�\�\�\�ק���a�&&&#G&N�8!X©�qV\�\�\�\�&\'\'\�\�\�;?6�3\�i��R8��*�cǎ�777�\�V\�\�z5��\�d�]\�\�\�,\�N�S*�jokk�ON��eߜ\�\�\��[�\���\�c��!ۥ\�F\�.�\�I�\��k���g�;�+~�\��\�\�\�\�\�fjkk?kjjz|�g\�1�\�}m�oN\�z7PCKKKvppp>�\�N���%_\�į�p\n�p�N�\�\�7S�k��sH8�S8)��.w�p\n�p\�\Z	�p\n\'�p\n\'T_8�r$�ᴄS8NK8�ᴄS8A8�S8A8�\�D8-\�N�\�N\�D8-\�NN\�NN\�D8N\�D8NK8�ᴄS8NK8��S8��S8N�\�N\�D8-\�N�\�N\�\�N\�\�N�\�N�ᴄS8NK8�\�,\�NN\�NN\�D8)����%�\�	kq��\�\�\�ؘh���v\�\�ߓp\�ڕ\�I�;u\�ԏ���򣣣�t:]�\�\�\�\�K\�v�pR���-9\�Lǻ���Μ9:::BWWW�\���)�\�	\"��ubb\"?99���GMD8�\r\r\r��T�\�T�(!�\�<�\�\�B�C�\�755=n:\�	,addd.���\�\�\�ן5\�����?�K.�SN`A\�\�\'�\�l�n�|>ZZZ�555[LK8�D:�΄\\�r%>Q\�eZ\�	$���W\�f�����Rcc\�VN�z��\��E\�e\�\�\�\�:\�\�)�@��\��T4/_�|!��2\�N���m۞J�\�C3uuu3�UN`	�>�A/��\�o_����\�t�XB�+\�\�ݝ+x��\�T*u\�;��X\�\�ݻ�LLL����\�\�\�	�Bgg\�x�X�\�¹n\Z\�	�B�k/����i\'\��\0\r�\0�h��E�=\0.\Z\��E�=\0.\Z\�p\�`��{\0\\4\�\��\0\\4\�\��\0\r�\0�h��E�=\0�h��E�=\0.\Z\�p\�`��{\0\\4\���{\0\\4\�\��\0\r�\0�h�\0\r�\0�h��E�=\0.\Z\�p\�`��{\0p\�`��{\0\\4\�\��\0\r�\0\��\0\r�\0�h��E�=\0.\Z\���d$^$+�i�N\��H\�Jᬭ�m3)\�\�HƗ	g���f�)	\'�\�Sg*�j7!\���P�z�s\�iS8�5�:=�)��\�\�u�M�\� 9a\�,\�\�&\"��\�.�;�u:m\n�)@	;v\��zr\���\�BN�R��\�[��~\"~�i	\'T��2�\�⸙�5�\�C�/M����;bz\�	\�\�\'�5�\�X�X��m\���i\n\'lz\�]�\�Ę/�`r<����S�N�����\�_�\���GH�ӡ��?��曡���8�y�O\�\�Ͷ»\�1�\��^�199y\��\�\�\�}\�t�6\�I�0�---wN��#�\�޽{��p¦\�,�{����\�߯x7�СC\�wۿa\�\�	�%�7O�\Z\�\�x�<o��p\�f�f{\�c��{�|��텏y�\�.��6�W�\��\�\�z8z��S�p\�\�\�\���P<޼ys]\��m/|�R|Lu��1~\�u:\�	ei\�m�wbv��ᰞ\�\�<N�\'J�\����#�P�x1T}}}\�\Z\��\"��p��\n�p\n\'��\�\�x\�O\n�\�0*\��\�\�\�]/��M:\�	\��z\�\�\�z	\�r/MZ\�{\��\�\'�\�\�_\\\�?4\�*\�\�*sO�\��ַ�=�Za$PQ\�c��~9��S8�J9q>�g\�-�@o	\'P\�\�\�u�E\'Ќ?�,\�w�O}=\�9T__��wT\�\�u\�UX��p�\\�\�\�ܳg\�]�M��\�,\�|2�Z\�a�+��\�\��\�+�Ρ\�\�Q>\�\�*:i��lNI\�\�*����	����j�=�O��\�$\�ݦl\�g�\���\��u��E�~�zGGGx\�g\���\�1Ʀ\nlz�y\�|���\�1M�\ZO�o\�G@\�\�&\��\�9P\�~7Q\�\�{\�\�B9��	\�\'�#\0\0\0\0\0\0\0\0\0\0\�\���㬂\Z\�v\0\0\0\0IEND�B`�',1),('2',1,'d:/upload//processDefiniton/2020/01/12/a933937eab428d5c21c7f14bb6ce0ef6.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1578711271300\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"allowance\" isClosed=\"false\" isExecutable=\"true\" name=\"补贴申请\" processType=\"None\">\r\n    <startEvent id=\"begin\" name=\"开始\"></startEvent>\r\n    <userTask activiti:assignee=\"#{username}\" activiti:exclusive=\"true\" id=\"selfVerify\" name=\"申请人办理\">\r\n    </userTask>\r\n    <endEvent id=\"end\" name=\"结束\"/>\r\n    <sequenceFlow id=\"_5\" name=\"发起申请\" sourceRef=\"begin\" targetRef=\"selfVerify\"/>\r\n    <userTask activiti:exclusive=\"true\" id=\"leaderVerify\" name=\"主管审核\">\r\n      <extensionElements>\r\n        <activiti:taskListener event=\"create\" class=\"com.ruoyi.process.allowance.listener.MyTaskListener\">\r\n		</activiti:taskListener>\r\n      </extensionElements>\r\n    </userTask>\r\n    <sequenceFlow id=\"_8\" name=\"提交\" sourceRef=\"selfVerify\" targetRef=\"leaderVerify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'提交\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_9\" name=\"同意\" sourceRef=\"leaderVerify\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_6\" name=\"放弃\" sourceRef=\"selfVerify\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'撤回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_10\" name=\"不同意\" sourceRef=\"leaderVerify\" targetRef=\"selfVerify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"allowance\">\r\n      <bpmndi:BPMNShape bpmnElement=\"begin\" id=\"Shape-begin\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"215.0\" y=\"30.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"selfVerify\" id=\"Shape-selfVerify\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"155.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"215.0\" y=\"415.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"leaderVerify\" id=\"Shape-leaderVerify\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"290.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"_2\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"231.0\" y=\"62.0\"/>\r\n        <omgdi:waypoint x=\"231.0\" y=\"155.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_3\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"190.0\" y=\"182.5\"/>\r\n        <omgdi:waypoint x=\"125.0\" y=\"305.0\"/>\r\n        <omgdi:waypoint x=\"215.0\" y=\"431.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_3\" targetElement=\"_7\">\r\n        <omgdi:waypoint x=\"232.5\" y=\"210.0\"/>\r\n        <omgdi:waypoint x=\"232.5\" y=\"290.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_7\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"231.0\" y=\"345.0\"/>\r\n        <omgdi:waypoint x=\"231.0\" y=\"415.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_7\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"317.5\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"250.0\"/>\r\n        <omgdi:waypoint x=\"275.0\" y=\"182.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2502',1,'d:/upload//processDefiniton/2020/01/12/f889091233f599a141f845b41642e9fc.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1578711271300\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"allowance\" isClosed=\"false\" isExecutable=\"true\" name=\"补贴申请\" processType=\"None\">\r\n    <startEvent id=\"begin\" name=\"开始\"></startEvent>\r\n    <userTask activiti:assignee=\"#{username}\" activiti:exclusive=\"true\" id=\"selfVerify\" name=\"申请人办理\">\r\n    </userTask>\r\n    <endEvent id=\"end\" name=\"结束\"/>\r\n    <sequenceFlow id=\"_5\" name=\"发起申请\" sourceRef=\"begin\" targetRef=\"selfVerify\"/>\r\n    <userTask activiti:exclusive=\"true\" id=\"leaderVerify\" name=\"主管审核\">\r\n      <extensionElements>\r\n        <activiti:taskListener event=\"create\" class=\"com.yangzc.studentboot.workflow.allowance.listener.MyTaskListener\">\r\n		</activiti:taskListener>\r\n      </extensionElements>\r\n    </userTask>\r\n    <sequenceFlow id=\"_8\" name=\"提交\" sourceRef=\"selfVerify\" targetRef=\"leaderVerify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'提交\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_9\" name=\"同意\" sourceRef=\"leaderVerify\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_6\" name=\"放弃\" sourceRef=\"selfVerify\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'撤回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_10\" name=\"不同意\" sourceRef=\"leaderVerify\" targetRef=\"selfVerify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"allowance\">\r\n      <bpmndi:BPMNShape bpmnElement=\"begin\" id=\"Shape-begin\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"215.0\" y=\"30.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"selfVerify\" id=\"Shape-selfVerify\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"155.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"215.0\" y=\"415.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"leaderVerify\" id=\"Shape-leaderVerify\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"290.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"_2\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"231.0\" y=\"62.0\"/>\r\n        <omgdi:waypoint x=\"231.0\" y=\"155.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"_3\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"190.0\" y=\"182.5\"/>\r\n        <omgdi:waypoint x=\"125.0\" y=\"305.0\"/>\r\n        <omgdi:waypoint x=\"215.0\" y=\"431.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_3\" targetElement=\"_7\">\r\n        <omgdi:waypoint x=\"232.5\" y=\"210.0\"/>\r\n        <omgdi:waypoint x=\"232.5\" y=\"290.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_7\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"231.0\" y=\"345.0\"/>\r\n        <omgdi:waypoint x=\"231.0\" y=\"415.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_7\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"275.0\" y=\"317.5\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"250.0\"/>\r\n        <omgdi:waypoint x=\"275.0\" y=\"182.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2503',1,'d:/upload//processDefiniton/2020/01/12/f889091233f599a141f845b41642e9fc.allowance.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0c\0\0\�\0\0\0PEXi\0\0\�IDATx\�\�\�lTם\�qTUUT�V��\ZUQ\�J��������VQ�**jڢF؞��\�`b\�%Q\�X摆ȋ�ZR�RmH�\�nLl��&�dy9�@y�\�#`�{\���d��=�g\�\�\��#�x�3�3?�\�\�{ƌ\0\0\0W��\�4�u;\0 ��}-ӷ\0c\0 �\0�1\0\�T\0�#�)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��1f\�\r\�]�bťe˖\�\�Νk\nM~~�)((0�\��)++\�Z�`A\�9s�b\0�F\'O����\�+\�\�>3s\�L�f\�\Z�m\�6s\�\�)\�\�\�nTWW�inn6;v\�0�����1c��5kV���t�\�87PE\0�L�����3�g\�626�w\�\Z��jhh02�6ӦM32�^@E`�\�g�}6VRRbv\�\�iFc���fΜ9\�{\�9]XX8�\�@\nZ[[甕��\�˗��/�t\�v�~�{\��K\�\0�X�xɒ%���ۤ[EE�ΐύ7\�:�\r\0\���&t�� \��\�3ϘI�&�\�\00\0��N{\�\�jMֲ�1cF\�q��\0�\��jBWLd�~��F{\�@]G�\�ײ\�\�G\�\�\�\�_O�`\�Wg\�\�	ٚ�ڷo����>\�\0QUU�7=�.�\�%SXX\���q\0�^kBOq�\�駟n\�\�ϯ\�(\0<�\�^k�[�vK\�(\0<���^�ǆ3g\�\�$�;9\n\0O/\�{��l\�\�%89\n\0O\�\�&\�\0Ĕ)SlΌc�1\0�x�Zϸ�����1\0����N[�)6l\�\�\�j\n\0�-:jk�qYYY\�@̙3\�.ݳ\�\�xz:4g\���rO��MQ__�-\n�M\0�y\�MK�.\�j7q\�6\0H��\�}�\�1\�\�9>�\�3:+\�z\�\0\�ϬY�\���\�飭��\'�t�\�\0$1cƌSO?�t&?̋\�}4�\�\�CT\0�\�\�d�|fŊ�\�Xii\�1]W�m�\r\0Crqqq�O>i._���\�Ľ�ޫ\��O\0\�䂂�CӧO�\�ڵk\�\�i�X[̈`�C�I�&u���_\�PN\�\�\�?n\�t|\�\��h\�lVf�\�\�\�\�ɓc˖-k�\������z�zĽW_Ӌ�����g�g=�NCX\�Ӗ\0�4�p-�Q-\��\�_gF���e\�\�)ΜY\0\�\rh3��oR	\0�\�\�\�\�ߦ\0`9�Y%\0.\�	&\\O%\0�n\�&N��=*\0�\�\�XQQ\�MT\0,�qaa\��\0X\�8NONN\��\0\�\�[�\0X���ߝ��w+�\0\0�a�;<��J\0�\�0v\�6*\0vø+\n��J\0�\�0\��\�\�\0\�\r\���\0`�̊;\"�\�\�\0؝�\�ȥ\0`7�\�A%\0�n_\�혨\0Xc�\�E%\0��p8|Q�n*\0vg\�df<�J\0�ݙ�y	\�9T\0,�Y�P(t?�\0\0�dV|V\��A*\0�\�\�H$RJ%\0�n7K�S	\0�(??�Iy�\0\0�a|J\�cT\0\�q�̌�P	\0�\�q�\�P\�)*\0vg\�G%���\0`7�\�XA%\0�n�#��\0`7�\�XM%\0�n\�8Ο�\0\�\r\�}2^�\0`Q8n�0~�J\0�\�0\�-a�&�\0\0�a�\�q��R	\0�ƟJ�C%\0�n\�0^G%\0�no�0�;�\0\0����\�%�+�\0\�\r\�%���\0X\�8\�\�5T\0,\� \�@�\0`Q~~~��:*\0v\�x���T\0,\�em���J\0�\�0^�\'~P	\0�(??�]�P	\0�\�ke\�\0`7�\�\�\�hR	\0�Ư\�\�\0\�\r\�Wd|F%\0�n����R	\0�ƫe�\0`Q8^)a�*\0v\��y\�qS	\0�\�\�ef|�J\0�E�P\�)��\0`wf�DfƍT\0,�Y�b	\�T\0,�D\"�dv\�D%\0�n�K7S	\0�ƥ\�-T\0,\�\�\�H\�*\09�3W\���\0\0�3\�9\�p�<�\0\0�3\�\��\0\�\r\�\�2.R	\0�Hf\�Se�R	\0�\�2.Q	\0�\�\�mT\0,\n�\�y�1\0X\n�\�0n�\0`��odtP	\0�(��0\�\0`Qnn\�\�\�tQ	\0�(\n�\\f\�W�\0X�F@�\�\�	f���\0�I�=\�\rc]\�F�\0�\�\��(�,�\�˒�q4\Z\rS!\0\�\�\�u�0f�h\0\�r?\�?��B�T\0�\�\��,\0d&\\�0+.�\"\0`yvL%\0��P(�0a�׌1\�:t\�x}}�ٸq����b�`TWW�͛7\�dT�0l\Z\�uuu���\�tvv2F1ZZZLmmmL�y�,\0â3b�8��,3e��`x�5A��whۂW�a\�\� @	c\0	\�K_�2�v�1\r\���o�\Z\�K\�R��o4{7��]�\�g\�\��6�0��0>ް\� \�\'\Z\���1�l��MO$\rc��\0&�d!��V\�O\Z\�zL �	c\0�c]=�,��6�0��0>�eE\�0\�\�`\�@\��l\�n����k[�5��\0&�d!�u��\�k\�X�F�\�\0�\�\��֊k[�5��\0&�d8���/�<��g��qa Sa,3\�Sj̞\�ҤA\�;�\�\�\�e�LHc5f�L\�B�2l�L\�\0\�\�#\r\�\�A\�\0\�\�\�\0aL ��1\00@3c\0�1a�0f\�\0c\�\0a�\�p��p�\�v\�@`\�x��پ�0@\�\0@\�\0c\�\0c\�\0aL@�\�xK\�\0�ns\�\0Ƅ1\00\00@\�\0@\�\0c\�\0c\�\0aL\�\0c\�\0a\� �Ƅ1\0A �	c\0�1�00\n7n$@\�<\�{\�=\���\�\�\��477�i\Z<�FM8�\�h\�\�\�?+「z��\�X\�8NInn\�\�\�ƍ��W!�1555�\�\�\�\�N�>=�:{�lƃ���\�\�A|\�ĉ�\�\�\�WV�X�^�פ0\�\�\0�&����\��:S���\��\�_7����� 7�\Z.\�֭3�~�\�\�۷�\�˗�w\�y\'c���\�)�\\�5�z�*�C�Н��\0����p�G��Z�\�]wݵ\�\�g�\�ܴi�9��\�u�\�Q\r��L=���\�Ν�\�}��J\�f\�	\��\0�L�\��cϾ}���W�Ȭ�J8n\�\�c8v\�ء\��ںuk��\�b/\�.��:IǢ\�\�OyuHIQQ\�M3gΌ�!lذ�C-\�\�chmm\�\�\�\�\�s�\����y\�\�@�\���&M�^e\0R�\�=�\�W�\n\�+V\��\�f\�1455]s�_~�e�\�N/\�P?��\�mO\�\�Ǐ���&Q���\�q\��̫\r@R��j\�ڵ]C�qIII,��?�1\�}���\�:�,�B�\�h�7�h\�\�Xg\�2�d<\�+@��qŶm\�:bm!L�2\�L�\�[��-\�\�\�I\�7��x�\�+K\��;��\��H<�i]\0���\n]\�\�\�\�=X���\��6\��\�\�\�\�:Ԍ��\�\��a\�;^���J�ϭ�\nZ\0���mmm�~��gϞX(z0\���e˖��\�ttt\\]:�A痚Ӻ\0p�3f4j;` \�\�\�z\�owyy�\�\�\���oJ\�\Zƿ��\�yef<���\0_y\�\'\�ï��3�=䧞z\�D�\�z��L��}\�7���\�A�U��O\'�u\�U�V\�>�쳫+JJJ�7|Ag�999�d\���B:�}x\��D:����\����\�[���X��������m6ǒ%Kv�o���\�_h?;hǄ\�@v\�\�M\���cچ���\�I8\�\��`\��\�x�.\0�f��\��$�\��\�3{�\�\�Ν3���ʵ)h]\0M�\�+\n�\�M�kժU-z	Myl\'9J}���o��诿\�\��ش-�=l�P�#\���G\�M�3y3w\�x\�ų@������\�~_¸#\n�\��\�I�V\'Z�\�\�\�\���\�8缰T�0N��{��\�j���\�$���\�\�� �\�S�ev��<^\�x䵣u��\����<!�\�\�\�\�L���e\"�H�.a��K��\0!�Ӏ\�\�2#\�ә��t\�\�	\��֓\�`�^\�R\�\�\�x�GÃ0N3Z@�M�<�Fݥ8\n���gr�q�к\0����X/�yVf>;��<\�Ԙ\���7\�A�����0��\���\0�\�\�O�0\�z<\�8�h]\0\��\��F�F�?�\��!�\�ԝ\�0�7\�C�_3\��\�9Ɩк\0FZ��\�3}��c\�h]\0)\�\�˻U\�K?\�\�2��{�� ��\'~O\�\�X\�\�\0 �]�\�0\0\�EYf\�g\�M�\�ǳ1\�؅h]\0}�\�s	⦼��oưt|h] �o��~YKL{���\�W\�����\�\0�\�!�=�\��6#�/��D\"�_\��\�\�;f_�.d\�p�\�B�;\�\n\�\��0��\����7\�\���?�8�+��B\�\'�\�\�\�\��=o\�؃3c\�\�Kg\��篨|C^\�7H�ɋ��\�&�=\"\�3>I\���k�\�\�\"a\�\�Ya\�r�zB�S5�)\�k�\�\�//�\�~^KL{��|ݒ`�1�\�U2.|7�ov\�؅hI HA���%\�\�ɹ%\�3/\�\�EhI P\�׾}��B�	�\ZL�\�XВ@ph\0ǯK\\B5c7�%���D\"�?\��y�A\�FK��k�\�EY\��T�0vA\�iI xtٚ\�<�兿�j\�6ђ@�\�	�\�o\�<�al-	\�\�p��ڴMA5cK5�%���	�Ӌ�\�wT�0\�6Z�W3\�\��\���j\�\�DK�\�\�\�\�ϥ\Z�q�\�IK�ψ_K��j\�\�BKH��\�MDu3Q�Ag-	�]K,o�&�S\r\�8K��%�\�\�+o�3�%&�3���D(���%�8q\���a�)�$�A\�l���.//\�V�Ag�N�$�A�xf|-�D�Ag-	`2�U��R\r\�8\�hI\0)�F�?ҙ�̌�D5\�Ԅ�0�	&\\_K��j\�\�DKH\����)o�S2P\r\�8]hI\0\��]2\��j\�iz��$�\�7\�:yôO�<�F�A�-	`\�W\�e�\�F�?�\Z�\n^=]\�1.ђ\00Ќxz���G5F\�C��\�y-	\0����2t-�\�T#m�\�2H���\��$�Q\�\�\��a|-�Fvf\�R\�\�^xڮZ�l�����z,_�\�,\\��Ϙ7o�>�m�$�\�\�\���\�\�dl�\Z	\�zǗ�2+~��\��������\\�\�В\0F(���Qfi�F�f\�^\�\�.ߛ7o2��;f�L��G��\�%α�8\�|ҋ�\�_|qG*�⊊�.�20� ~G\�\��>\�\�,�	OKc\�|�\�\�\�0d766꬘\�\0#�%��XƿS��͎����2+^�fͻ�̊�.]\Zc\�`��4]\��F\�T#�a\\\�3��\�\�3d:t(&��J�.0L����k�i��d\�u\n\�\�\�\�\�ƍMUUc���\�l޼9&�B\��̊-Zd���n\�oF|s|!�\�~z^\Z\�uuu���\�tvv2F1ZZZLmmm\��\�ñ���\���\��j\��Caa\�Xy\�\\� \�\�\�3b�8}c߾}ל�2u\�T3{�\�>C���i�\�R�k�%�O8�sX��~{~ښ D\�;\�{\�=.���\�l>� >����O~|~\�\�$@\�;���s�4����q��?dI5�/}y\�ڱ\�4T/�:���k�/ad:�\�Zb�_+ �0n=\�h�n(3��>�\�Я\�m0ad�515��-\��\�JoXwM��\r\�	`\�\�Ȍ�?�2��H�<\�7�0޷鉤a����1�V���?� \�@~5(\�9�0\�[5?i\�m0a�3�\�J_�0�\��&�	c�M�!A|\\��\��%m\�\�da����1�\�\�e|ĭnR	\�[V$\rc��\0&��t�\�\'.((�� >�T\��l\�n����k[�5��\0&��Q	�\�O\�Zb\�qnj\rR=\�\��\�/_\��50FE����<\�:�\�\��֊k[�5��\0&��\�Ό�\�w\��	a��\�/�<��g��qa�#�+e\\�0a\���q\�\��5fOei\� \��w�\�2K&��Q���A�L昀-kK\�C͆�%\�@F\�\�1ui�/?�0Ne6<\�,�0&��Ѵ+�n�$�z�4�{aL�mW�F/\n�\�	r3c�:	\�\��sAE\"�7t��ɓ\'\�H3c�n\�b������o\�\��DCX\�XC�0fƀEڦ\�v��-caX�\�\�?\�{�0fƀ\�@�GY��\�\��HO��r3a<�!w;\�\�\�\�1\�qz���6��Oƣ\����\�\�	c����\�Ƅ1aX��\�\�Kn\�7	c0\�+~�(�\�1aLv9\�8����Ƅ1a\�\r\�ǽ�maL�\��m�X\�F~�!{v\�&N� �\���M�1a��]\�\�m�c\��c�\�s\�6Ƅ1\�K^۶�0&�\��ҶM�1a��e\�m�c\��5�l\�Dƀ\�ya\�&0�\�\�6Ƅ1�@v\�M�1a�[�m\"�	c pܸmaLA\�m�c\�$�m\�D\�@�\��ٶi\�ƍ(a:�]�mS]]]Oss3!��q\�ĉ�Ɲ�\�o��m�jjj�����>}\�\�!\�\�\�\� ����\"c�n�cܰm��\��\�]\�_�\�8>��C�x�b�v\�Z\�\�\��1\�\��g�mʴ\�{.\�F[)EEE������M�\�8\�\r�7o���u\�֙\�\�\�۩�L�+<�mS��7\�ŋ�����f�\��.//?Iu\0d��mʔ\�ӧ\�\�D�~�)�c\0�\�m�2�[Beb{���+W�\� 㼴mS�x٢E�z\� t�[yyy.�\0\�m�2�ͅ��!\�\�յ�*�q^ٶ)�T9r�g�0���1���cy�\0\�8/l۔	����\�\�\�I���\�\�f\�o�\n�5n߶)t�ĺu\�~��\�o^\��F �vۦL�:ujmkk\�5����\�c�=v3�\n\0V�uۦLѓ>֬YӧW��E��\�\��j\0`��m\�$\�qf:t\�\�0^�v\�	^\0\��u\�6e\�O\�iлw\�f�\0�p۶M�VTTt\�[o�e\�Ν\��\�\�*nڶ)KϷ\�qVP\0pe@�bۦl�\�fk������l}ۦl�:s\�9�\�p�\���MY����\���a\�\�m��g,��#\r�\���mS$Y$?l�8\�\0\\\�\�\�69��X�\�-�̯�ܶI/8/\�\�8G�g�q\�&	\�\��rtx�߶m�0~\�q�\�Y\0�\�m�$���\�q\0�?m\�$\�\�E�sTx�_�m�\����\�8�\0<\�\�6\��p8���	�\�\�\�m�\�����N�$\0\���M�ߕ�	G�/xu\�&�\��Mf\�q��\'�m\�+\�\�c�\���\r/n\�$A\\-����W��m�<\�Z�8r\0�ȞٶIg\�:;\��k {b\�&\�e7l\0\�m�$��\�X\�\�\�����m\�5ƺ֘#�\�ܾm��}�g\�q�\0����m�ǵW\�\�%\0�\�\�m��mz\�6���p\�Mz-c\�q�\�\�(n۶I�X?`\\ő8nڶI��\�}�8*\0\�M\�6\�\�\�\�\�pT\0�[�m\�5\���rD\0��m��?)3\�\�\r\0Ad�\�6\��6\�\�xG@\�\�ܶ)޻~��\0\0c\�m\�$�yF\�C\0���m�\�9\n�\��\0gcۦ�E�\��\0\�7��m�̌/ʘN\�\�\�@\�ڶMr�\�\�\�\00pHfe\�&�����W\0X��m�$�\�\�>�6\0�ݶI�����;*\r\0�H\�M999�8�s��z�&�\�)��+*\r\0C\�^Ӳm����>&\�\��ȸPXX8���\0ұmS4\Z�\� a|uH`��j� ұmS�\���.�cV\0)H�m�\�z\�r[\�hf\�̊`��ۯ�m�m�Θ\�\���{	\���q7�b\0�\�m�d��0���7�}(�s�0^Me`��M!3\�\�\0}ߙ)ήO&���TB\0�@\�	\�F�Iz�\�SlULK�7�QU\0�����$<\�Y�֔\��ҿ��f���ߥ�\0�\"m%\�tC��o�_\�\�d\�\��͝�?��qVF��\�\�\�<\0:�_\�K_�^��޿��@\�\�j%`��:\���c=c/�{\0�k�š�\�kh\�U\�$�\�pB8ɨg�\0C\�٫\�~\�\�\�\�o���5}\�3g�U�V�m۶�\�\�F\�\�\�n��\�\�\�l>�\��\�K/�����\�m�$�j@\n$4\�e\�\�\'H\�͛w5h���M�v\�\�iJKK��rL���\0��Ķ�����\�\��UVV�\�\�\���d\0���{�q,�%�\�_�t8r䈙={v�2-\0\�\'�¢=1���N��Y{\�|�\0}\�����t͈�!�kYl��\00\�uĉ}b\�g����\�\�\�(\0<]Җ�j���\�d\�C=�خh\�(\04\�\'�Y�\�ײa�\�\�}\�\�K\�\�\0G��%~h7�%lÕxbH*;�\0��[u���z�j�M���j�ӥ9\Z\0�\�-����8g��DZ\�9\Z\0+\�Z\�ԩSY\rc]w�x�M�� ό�\�ދ�d�\�_\��s4\0\�2l ���1\0�=c\0p\�̘\�\0\��0f�1\0��M�\�\�x�\�wg\��\�kSh��kS\0��V\��ī�ecv��7Wm�1_]\�X�A\�z\�\0`v\\���>�L�\�N\00݋N��\��x�f\�b<\0�\�֜خH�\�ЉA\�\�\�\00x ?�\�ڲ\��h>\�\�q�քΊPm\0F ���عs簗�����	a��1\0�e�\�CNl]\�z;v\�z-�ދ\�\�\��\�3\�O\�H\�Ӛ\0�a\�\�WY�rl\�\�:\0]�,�\�O\�\�Ke\�uzBG$�5U�4\�S�\�ײ\�\�rK\�\�7Nk>��\�kMp�3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\��\�\�\�	\�c��\0\0\0\0IEND�B`�',1),('3',1,'d:/upload//processDefiniton/2020/01/12/a933937eab428d5c21c7f14bb6ce0ef6.allowance.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0c\0\0\�\0\0\0PEXi\0\0\�IDATx\�\�\�lTם\�qTUUT�V��\ZUQ\�J��������VQ�**jڢF؞��\�`b\�%Q\�X摆ȋ�ZR�RmH�\�nLl��&�dy9�@y�\�#`�{\���d��=�g\�\�\��#�x�3�3?�\�\�{ƌ\0\0\0W��\�4�u;\0 ��}-ӷ\0c\0 �\0�1\0\�T\0�#�)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��1f\�\r\�]�bťe˖\�\�Νk\nM~~�)((0�\��)++\�Z�`A\�9s�b\0�F\'O����\�+\�\�>3s\�L�f\�\Z�m\�6s\�\�)\�\�\�nTWW�inn6;v\�0�����1c��5kV���t�\�87PE\0�L�����3�g\�626�w\�\Z��jhh02�6ӦM32�^@E`�\�g�}6VRRbv\�\�iFc���fΜ9\�{\�9]XX8�\�@\nZ[[甕��\�˗��/�t\�v�~�{\��K\�\0�X�xɒ%���ۤ[EE�ΐύ7\�:�\r\0\���&t�� \��\�3ϘI�&�\�\00\0��N{\�\�jMֲ�1cF\�q��\0�\��jBWLd�~��F{\�@]G�\�ײ\�\�G\�\�\�\�_O�`\�Wg\�\�	ٚ�ڷo����>\�\0QUU�7=�.�\�%SXX\���q\0�^kBOq�\�駟n\�\�ϯ\�(\0<�\�^k�[�vK\�(\0<���^�ǆ3g\�\�$�;9\n\0O/\�{��l\�\�%89\n\0O\�\�&\�\0Ĕ)SlΌc�1\0�x�Zϸ�����1\0����N[�)6l\�\�\�j\n\0�-:jk�qYYY\�@̙3\�.ݳ\�\�xz:4g\���rO��MQ__�-\n�M\0�y\�MK�.\�j7q\�6\0H��\�}�\�1\�\�9>�\�3:+\�z\�\0\�ϬY�\���\�飭��\'�t�\�\0$1cƌSO?�t&?̋\�}4�\�\�CT\0�\�\�d�|fŊ�\�Xii\�1]W�m�\r\0Crqqq�O>i._���\�Ľ�ޫ\��O\0\�䂂�CӧO�\�ڵk\�\�i�X[̈`�C�I�&u���_\�PN\�\�\�?n\�t|\�\��h\�lVf�\�\�\�\�ɓc˖-k�\������z�zĽW_Ӌ�����g�g=�NCX\�Ӗ\0�4�p-�Q-\��\�_gF���e\�\�)ΜY\0\�\rh3��oR	\0�\�\�\�\�ߦ\0`9�Y%\0.\�	&\\O%\0�n\�&N��=*\0�\�\�XQQ\�MT\0,�qaa\��\0X\�8NONN\��\0\�\�[�\0X���ߝ��w+�\0\0�a�;<��J\0�\�0v\�6*\0vø+\n��J\0�\�0\��\�\�\0\�\r\���\0`�̊;\"�\�\�\0؝�\�ȥ\0`7�\�A%\0�n_\�혨\0Xc�\�E%\0��p8|Q�n*\0vg\�df<�J\0�ݙ�y	\�9T\0,�Y�P(t?�\0\0�dV|V\��A*\0�\�\�H$RJ%\0�n7K�S	\0�(??�Iy�\0\0�a|J\�cT\0\�q�̌�P	\0�\�q�\�P\�)*\0vg\�G%���\0`7�\�XA%\0�n�#��\0`7�\�XM%\0�n\�8Ο�\0\�\r\�}2^�\0`Q8n�0~�J\0�\�0\�-a�&�\0\0�a�\�q��R	\0�ƟJ�C%\0�n\�0^G%\0�no�0�;�\0\0����\�%�+�\0\�\r\�%���\0X\�8\�\�5T\0,\� \�@�\0`Q~~~��:*\0v\�x���T\0,\�em���J\0�\�0^�\'~P	\0�(??�]�P	\0�\�ke\�\0`7�\�\�\�hR	\0�Ư\�\�\0\�\r\�Wd|F%\0�n����R	\0�ƫe�\0`Q8^)a�*\0v\��y\�qS	\0�\�\�ef|�J\0�E�P\�)��\0`wf�DfƍT\0,�Y�b	\�T\0,�D\"�dv\�D%\0�n�K7S	\0�ƥ\�-T\0,\�\�\�H\�*\09�3W\���\0\0�3\�9\�p�<�\0\0�3\�\��\0\�\r\�\�2.R	\0�Hf\�Se�R	\0�\�2.Q	\0�\�\�mT\0,\n�\�y�1\0X\n�\�0n�\0`��odtP	\0�(��0\�\0`Qnn\�\�\�tQ	\0�(\n�\\f\�W�\0X�F@�\�\�	f���\0�I�=\�\rc]\�F�\0�\�\��(�,�\�˒�q4\Z\rS!\0\�\�\�u�0f�h\0\�r?\�?��B�T\0�\�\��,\0d&\\�0+.�\"\0`yvL%\0��P(�0a�׌1\�:t\�x}}�ٸq����b�`TWW�͛7\�dT�0l\Z\�uuu���\�tvv2F1ZZZLmmmL�y�,\0â3b�8��,3e��`x�5A��whۂW�a\�\� @	c\0	\�K_�2�v�1\r\���o�\Z\�K\�R��o4{7��]�\�g\�\��6�0��0>ް\� \�\'\Z\���1�l��MO$\rc��\0&�d!��V\�O\Z\�zL �	c\0�c]=�,��6�0��0>�eE\�0\�\�`\�@\��l\�n����k[�5��\0&�d!�u��\�k\�X�F�\�\0�\�\��֊k[�5��\0&�d8���/�<��g��qa Sa,3\�Sj̞\�ҤA\�;�\�\�\�e�LHc5f�L\�B�2l�L\�\0\�\�#\r\�\�A\�\0\�\�\�\0aL ��1\00@3c\0�1a�0f\�\0c\�\0a�\�p��p�\�v\�@`\�x��پ�0@\�\0@\�\0c\�\0c\�\0aL@�\�xK\�\0�ns\�\0Ƅ1\00\00@\�\0@\�\0c\�\0c\�\0aL\�\0c\�\0a\� �Ƅ1\0A �	c\0�1�00\n7n$@\�<\�{\�=\���\�\�\��477�i\Z<�FM8�\�h\�\�\�?+「z��\�X\�8NInn\�\�\�ƍ��W!�1555�\�\�\�\�N�>=�:{�lƃ���\�\�A|\�ĉ�\�\�\�WV�X�^�פ0\�\�\0�&����\��:S���\��\�_7����� 7�\Z.\�֭3�~�\�\�۷�\�˗�w\�y\'c���\�)�\\�5�z�*�C�Н��\0����p�G��Z�\�]wݵ\�\�g�\�ܴi�9��\�u�\�Q\r��L=���\�Ν�\�}��J\�f\�	\��\0�L�\��cϾ}���W�Ȭ�J8n\�\�c8v\�ء\��ںuk��\�b/\�.��:IǢ\�\�OyuHIQQ\�M3gΌ�!lذ�C-\�\�chmm\�\�\�\�\�s�\����y\�\�@�\���&M�^e\0R�\�=�\�W�\n\�+V\��\�f\�1455]s�_~�e�\�N/\�P?��\�mO\�\�Ǐ���&Q���\�q\��̫\r@R��j\�ڵ]C�qIII,��?�1\�}���\�:�,�B�\�h�7�h\�\�Xg\�2�d<\�+@��qŶm\�:bm!L�2\�L�\�[��-\�\�\�I\�7��x�\�+K\��;��\��H<�i]\0���\n]\�\�\�\�=X���\��6\��\�\�\�\�:Ԍ��\�\��a\�;^���J�ϭ�\nZ\0���mmm�~��gϞX(z0\���e˖��\�ttt\\]:�A痚Ӻ\0p�3f4j;` \�\�\�z\�owyy�\�\�\���oJ\�\Zƿ��\�yef<���\0_y\�\'\�ï��3�=䧞z\�D�\�z��L��}\�7���\�A�U��O\'�u\�U�V\�>�쳫+JJJ�7|Ag�999�d\���B:�}x\��D:����\����\�[���X��������m6ǒ%Kv�o���\�_h?;hǄ\�@v\�\�M\���cچ���\�I8\�\��`\��\�x�.\0�f��\��$�\��\�3{�\�\�Ν3���ʵ)h]\0M�\�+\n�\�M�kժU-z	Myl\'9J}���o��诿\�\��ش-�=l�P�#\���G\�M�3y3w\�x\�ų@������\�~_¸#\n�\��\�I�V\'Z�\�\�\�\���\�8缰T�0N��{��\�j���\�$���\�\�� �\�S�ev��<^\�x䵣u��\����<!�\�\�\�\�L���e\"�H�.a��K��\0!�Ӏ\�\�2#\�ә��t\�\�	\��֓\�`�^\�R\�\�\�x�GÃ0N3Z@�M�<�Fݥ8\n���gr�q�к\0����X/�yVf>;��<\�Ԙ\���7\�A�����0��\���\0�\�\�O�0\�z<\�8�h]\0\��\��F�F�?�\��!�\�ԝ\�0�7\�C�_3\��\�9Ɩк\0FZ��\�3}��c\�h]\0)\�\�˻U\�K?\�\�2��{�� ��\'~O\�\�X\�\�\0 �]�\�0\0\�EYf\�g\�M�\�ǳ1\�؅h]\0}�\�s	⦼��oưt|h] �o��~YKL{���\�W\�����\�\0�\�!�=�\��6#�/��D\"�_\��\�\�;f_�.d\�p�\�B�;\�\n\�\��0��\����7\�\���?�8�+��B\�\'�\�\�\�\��=o\�؃3c\�\�Kg\��篨|C^\�7H�ɋ��\�&�=\"\�3>I\���k�\�\�\"a\�\�Ya\�r�zB�S5�)\�k�\�\�//�\�~^KL{��|ݒ`�1�\�U2.|7�ov\�؅hI HA���%\�\�ɹ%\�3/\�\�EhI P\�׾}��B�	�\ZL�\�XВ@ph\0ǯK\\B5c7�%���D\"�?\��y�A\�FK��k�\�EY\��T�0vA\�iI xtٚ\�<�兿�j\�6ђ@�\�	�\�o\�<�al-	\�\�p��ڴMA5cK5�%���	�Ӌ�\�wT�0\�6Z�W3\�\��\���j\�\�DK�\�\�\�\�ϥ\Z�q�\�IK�ψ_K��j\�\�BKH��\�MDu3Q�Ag-	�]K,o�&�S\r\�8K��%�\�\�+o�3�%&�3���D(���%�8q\���a�)�$�A\�l���.//\�V�Ag�N�$�A�xf|-�D�Ag-	`2�U��R\r\�8\�hI\0)�F�?ҙ�̌�D5\�Ԅ�0�	&\\_K��j\�\�DKH\����)o�S2P\r\�8]hI\0\��]2\��j\�iz��$�\�7\�:yôO�<�F�A�-	`\�W\�e�\�F�?�\Z�\n^=]\�1.ђ\00Ќxz���G5F\�C��\�y-	\0����2t-�\�T#m�\�2H���\��$�Q\�\�\��a|-�Fvf\�R\�\�^xڮZ�l�����z,_�\�,\\��Ϙ7o�>�m�$�\�\�\���\�\�dl�\Z	\�zǗ�2+~��\��������\\�\�В\0F(���Qfi�F�f\�^\�\�.ߛ7o2��;f�L��G��\�%α�8\�|ҋ�\�_|qG*�⊊�.�20� ~G\�\��>\�\�,�	OKc\�|�\�\�\�0d766꬘\�\0#�%��XƿS��͎����2+^�fͻ�̊�.]\Zc\�`��4]\��F\�T#�a\\\�3��\�\�3d:t(&��J�.0L����k�i��d\�u\n\�\�\�\�\�ƍMUUc���\�l޼9&�B\��̊-Zd���n\�oF|s|!�\�~z^\Z\�uuu���\�tvv2F1ZZZLmmm\��\�ñ���\���\��j\��Caa\�Xy\�\\� \�\�\�3b�8}c߾}ל�2u\�T3{�\�>C���i�\�R�k�%�O8�sX��~{~ښ D\�;\�{\�=.���\�l>� >����O~|~\�\�$@\�;���s�4����q��?dI5�/}y\�ڱ\�4T/�:���k�/ad:�\�Zb�_+ �0n=\�h�n(3��>�\�Я\�m0ad�515��-\��\�JoXwM��\r\�	`\�\�Ȍ�?�2��H�<\�7�0޷鉤a����1�V���?� \�@~5(\�9�0\�[5?i\�m0a�3�\�J_�0�\��&�	c�M�!A|\\��\��%m\�\�da����1�\�\�e|ĭnR	\�[V$\rc��\0&��t�\�\'.((�� >�T\��l\�n����k[�5��\0&��Q	�\�O\�Zb\�qnj\rR=\�\��\�/_\��50FE����<\�:�\�\��֊k[�5��\0&��\�Ό�\�w\��	a��\�/�<��g��qa�#�+e\\�0a\���q\�\��5fOei\� \��w�\�2K&��Q���A�L昀-kK\�C͆�%\�@F\�\�1ui�/?�0Ne6<\�,�0&��Ѵ+�n�$�z�4�{aL�mW�F/\n�\�	r3c�:	\�\��sAE\"�7t��ɓ\'\�H3c�n\�b������o\�\��DCX\�XC�0fƀEڦ\�v��-caX�\�\�?\�{�0fƀ\�@�GY��\�\��HO��r3a<�!w;\�\�\�\�1\�qz���6��Oƣ\����\�\�	c����\�Ƅ1aX��\�\�Kn\�7	c0\�+~�(�\�1aLv9\�8����Ƅ1a\�\r\�ǽ�maL�\��m�X\�F~�!{v\�&N� �\���M�1a��]\�\�m�c\��c�\�s\�6Ƅ1\�K^۶�0&�\��ҶM�1a��e\�m�c\��5�l\�Dƀ\�ya\�&0�\�\�6Ƅ1�@v\�M�1a�[�m\"�	c pܸmaLA\�m�c\�$�m\�D\�@�\��ٶi\�ƍ(a:�]�mS]]]Oss3!��q\�ĉ�Ɲ�\�o��m�jjj�����>}\�\�!\�\�\�\� ����\"c�n�cܰm��\��\�]\�_�\�8>��C�x�b�v\�Z\�\�\��1\�\��g�mʴ\�{.\�F[)EEE������M�\�8\�\r�7o���u\�֙\�\�\�۩�L�+<�mS��7\�ŋ�����f�\��.//?Iu\0d��mʔ\�ӧ\�\�D�~�)�c\0�\�m�2�[Beb{���+W�\� 㼴mS�x٢E�z\� t�[yyy.�\0\�m�2�ͅ��!\�\�յ�*�q^ٶ)�T9r�g�0���1���cy�\0\�8/l۔	����\�\�\�I���\�\�f\�o�\n�5n߶)t�ĺu\�~��\�o^\��F �vۦL�:ujmkk\�5����\�c�=v3�\n\0V�uۦLѓ>֬YӧW��E��\�\��j\0`��m\�$\�qf:t\�\�0^�v\�	^\0\��u\�6e\�O\�iлw\�f�\0�p۶M�VTTt\�[o�e\�Ν\��\�\�*nڶ)KϷ\�qVP\0pe@�bۦl�\�fk������l}ۦl�:s\�9�\�p�\���MY����\���a\�\�m��g,��#\r�\���mS$Y$?l�8\�\0\\\�\�\�69��X�\�-�̯�ܶI/8/\�\�8G�g�q\�&	\�\��rtx�߶m�0~\�q�\�Y\0�\�m�$���\�q\0�?m\�$\�\�E�sTx�_�m�\����\�8�\0<\�\�6\��p8���	�\�\�\�m�\�����N�$\0\���M�ߕ�	G�/xu\�&�\��Mf\�q��\'�m\�+\�\�c�\���\r/n\�$A\\-����W��m�<\�Z�8r\0�ȞٶIg\�:;\��k {b\�&\�e7l\0\�m�$��\�X\�\�\�����m\�5ƺ֘#�\�ܾm��}�g\�q�\0����m�ǵW\�\�%\0�\�\�m��mz\�6���p\�Mz-c\�q�\�\�(n۶I�X?`\\ő8nڶI��\�}�8*\0\�M\�6\�\�\�\�\�pT\0�[�m\�5\���rD\0��m��?)3\�\�\r\0Ad�\�6\��6\�\�xG@\�\�ܶ)޻~��\0\0c\�m\�$�yF\�C\0���m�\�9\n�\��\0gcۦ�E�\��\0\�7��m�̌/ʘN\�\�\�@\�ڶMr�\�\�\�\00pHfe\�&�����W\0X��m�$�\�\�>�6\0�ݶI�����;*\r\0�H\�M999�8�s��z�&�\�)��+*\r\0C\�^Ӳm����>&\�\��ȸPXX8���\0ұmS4\Z�\� a|uH`��j� ұmS�\���.�cV\0)H�m�\�z\�r[\�hf\�̊`��ۯ�m�m�Θ\�\���{	\���q7�b\0�\�m�d��0���7�}(�s�0^Me`��M!3\�\�\0}ߙ)ήO&���TB\0�@\�	\�F�Iz�\�SlULK�7�QU\0�����$<\�Y�֔\��ҿ��f���ߥ�\0�\"m%\�tC��o�_\�\�d\�\��͝�?��qVF��\�\�\�<\0:�_\�K_�^��޿��@\�\�j%`��:\���c=c/�{\0�k�š�\�kh\�U\�$�\�pB8ɨg�\0C\�٫\�~\�\�\�\�o���5}\�3g�U�V�m۶�\�\�F\�\�\�n��\�\�\�l>�\��\�K/�����\�m�$�j@\n$4\�e\�\�\'H\�͛w5h���M�v\�\�iJKK��rL���\0��Ķ�����\�\��UVV�\�\�\���d\0���{�q,�%�\�_�t8r䈙={v�2-\0\�\'�¢=1���N��Y{\�|�\0}\�����t͈�!�kYl��\00\�uĉ}b\�g����\�\�\�(\0<]Җ�j���\�d\�C=�خh\�(\04\�\'�Y�\�ײa�\�\�}\�\�K\�\�\0G��%~h7�%lÕxbH*;�\0��[u���z�j�M���j�ӥ9\Z\0�\�-����8g��DZ\�9\Z\0+\�Z\�ԩSY\rc]w�x�M�� ό�\�ދ�d�\�_\��s4\0\�2l ���1\0�=c\0p\�̘\�\0\��0f�1\0��M�\�\�x�\�wg\��\�kSh��kS\0��V\��ī�ecv��7Wm�1_]\�X�A\�z\�\0`v\\���>�L�\�N\00݋N��\��x�f\�b<\0�\�֜خH�\�ЉA\�\�\�\00x ?�\�ڲ\��h>\�\�q�քΊPm\0F ���عs簗�����	a��1\0�e�\�CNl]\�z;v\�z-�ދ\�\�\��\�3\�O\�H\�Ӛ\0�a\�\�WY�rl\�\�:\0]�,�\�O\�\�Ke\�uzBG$�5U�4\�S�\�ײ\�\�rK\�\�7Nk>��\�kMp�3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\��\�\�\�	\�c��\0\0\0\0IEND�B`�',1);
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
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','12501',6),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10012','allowance:3:10007','10008','10011','begin',NULL,NULL,'开始','startEvent',NULL,'2020-01-22 20:44:08.255','2020-01-22 20:44:08.261',6,NULL,''),('10013','allowance:3:10007','10008','10011','selfVerify','10014',NULL,'申请人办理','userTask','lyf','2020-01-22 20:44:08.264',NULL,NULL,NULL,''),('10026','allowance:4:10021','10022','10025','begin',NULL,NULL,'开始','startEvent',NULL,'2020-01-22 20:53:40.368','2020-01-22 20:53:40.369',1,NULL,''),('10027','allowance:4:10021','10022','10025','selfVerify','10028',NULL,'申请人办理','userTask','lyf','2020-01-22 20:53:40.369',NULL,NULL,NULL,''),('10040','allowance:5:10035','10036','10039','begin',NULL,NULL,'开始','startEvent',NULL,'2020-01-22 20:57:23.404','2020-01-22 20:57:23.404',0,NULL,''),('10041','allowance:5:10035','10036','10039','selfVerify','10042',NULL,'申请人办理','userTask','lyf','2020-01-22 20:57:23.404','2020-01-22 20:57:42.866',19462,NULL,''),('10046','allowance:5:10035','10036','10039','leaderVerify','10047',NULL,'领导审核','userTask','yangzc','2020-01-22 20:57:42.866','2020-01-22 20:59:07.239',84373,NULL,''),('10051','allowance:5:10035','10036','10039','end',NULL,NULL,'结束','endEvent',NULL,'2020-01-22 20:59:07.239','2020-01-22 20:59:07.239',0,NULL,''),('5005','allowance:2:2504','5001','5004','begin',NULL,NULL,'开始','startEvent',NULL,'2020-01-12 21:04:18.709','2020-01-12 21:04:18.710',1,NULL,''),('5006','allowance:2:2504','5001','5004','selfVerify','5007',NULL,'申请人办理','userTask','lyf','2020-01-12 21:04:18.711','2020-01-12 21:55:16.660',3057949,NULL,''),('7504','allowance:2:2504','5001','5004','leaderVerify','7505',NULL,'主管审核','userTask','yangzc','2020-01-12 21:55:16.681','2020-01-12 21:56:49.031',92350,NULL,''),('7509','allowance:2:2504','5001','5004','selfVerify','7510',NULL,'申请人办理','userTask','lyf','2020-01-12 21:56:49.031',NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_comment` VALUES ('10015','comment','2020-01-22 20:44:48.052','lyf','10014','10008','AddComment','测试数据，请领导批准~~~','测试数据，请领导批准~~~'),('10029','comment','2020-01-22 20:54:17.656','lyf','10028','10022','AddComment','44444，测试，请领导批准~~~','44444，测试，请领导批准~~~'),('10043','comment','2020-01-22 20:57:42.849','lyf','10042','10036','AddComment','55555，测试，请领导批准~~~','55555，测试，请领导批准~~~'),('10049','event','2020-01-22 20:57:42.875','lyf','10047',NULL,'AddUserLink','yangzc_|_assignee',NULL),('10050','comment','2020-01-22 20:59:07.217','yangzc','10047','10036','AddComment','测试，同意~~~55555','测试，同意~~~55555'),('7501','comment','2020-01-12 21:55:16.598','lyf','5007','5001','AddComment','请领导批准，1111111111111111111','请领导批准，1111111111111111111'),('7507','event','2020-01-12 21:55:16.685','lyf','7505',NULL,'AddUserLink','yangzc_|_assignee',NULL),('7508','comment','2020-01-12 21:56:49.014','yangzc','7505','5001','AddComment','不同意，1111111111111111111111','不同意，1111111111111111111111');
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
INSERT INTO `act_hi_identitylink` VALUES ('10009',NULL,'starter','lyf',NULL,'10008'),('10023',NULL,'starter','lyf',NULL,'10022'),('10037',NULL,'starter','lyf',NULL,'10036'),('10048',NULL,'participant','yangzc',NULL,'10036'),('5002',NULL,'starter','lyf',NULL,'5001'),('7506',NULL,'participant','yangzc',NULL,'5001');
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
INSERT INTO `act_hi_procinst` VALUES ('10008','10008','3','allowance:3:10007','2020-01-22 20:44:08.241',NULL,NULL,'lyf','begin',NULL,NULL,NULL,'',NULL),('10022','10022','4','allowance:4:10021','2020-01-22 20:53:40.368',NULL,NULL,'lyf','begin',NULL,NULL,NULL,'',NULL),('10036','10036','5','allowance:5:10035','2020-01-22 20:57:23.403','2020-01-22 20:59:07.290',103887,'lyf','begin','end',NULL,NULL,'',NULL),('5001','5001','1','allowance:2:2504','2020-01-12 21:04:18.698',NULL,NULL,'lyf','begin',NULL,NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('10014','allowance:3:10007','selfVerify','10008','10011','申请人办理',NULL,'申请人办理',NULL,'lyf','2020-01-22 20:44:08.373',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('10028','allowance:4:10021','selfVerify','10022','10025','申请人办理',NULL,'申请人办理',NULL,'lyf','2020-01-22 20:53:40.369',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('10042','allowance:5:10035','selfVerify','10036','10039','申请人办理',NULL,'申请人办理',NULL,'lyf','2020-01-22 20:57:23.404','2020-01-22 20:57:42.853','2020-01-22 20:57:42.864',19460,NULL,50,NULL,NULL,NULL,''),('10047','allowance:5:10035','leaderVerify','10036','10039','领导审核',NULL,'领导审核',NULL,'yangzc','2020-01-22 20:57:42.866','2020-01-22 20:59:07.221','2020-01-22 20:59:07.237',84371,NULL,50,NULL,NULL,NULL,''),('5007','allowance:2:2504','selfVerify','5001','5004','申请人办理',NULL,NULL,NULL,'lyf','2020-01-12 21:04:18.739','2020-01-12 21:55:16.624','2020-01-12 21:55:16.652',3057913,NULL,50,NULL,NULL,NULL,''),('7505','allowance:2:2504','leaderVerify','5001','5004','主管审核',NULL,NULL,NULL,'yangzc','2020-01-12 21:55:16.682','2020-01-12 21:56:49.019','2020-01-12 21:56:49.030',92348,NULL,50,NULL,NULL,NULL,''),('7510','allowance:2:2504','selfVerify','5001','5004','申请人办理',NULL,NULL,NULL,'lyf','2020-01-12 21:56:49.031',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_varinst` VALUES ('10010','10008','10008',NULL,'username','string',0,NULL,NULL,NULL,'lyf',NULL,'2020-01-22 20:44:08.242','2020-01-22 20:44:08.242'),('10024','10022','10022',NULL,'username','string',0,NULL,NULL,NULL,'lyf',NULL,'2020-01-22 20:53:40.368','2020-01-22 20:53:40.368'),('10038','10036','10036',NULL,'username','string',0,NULL,NULL,NULL,'lyf',NULL,'2020-01-22 20:57:23.404','2020-01-22 20:57:23.404'),('10044','10036','10036',NULL,'comment','string',1,NULL,NULL,NULL,'测试，同意~~~55555',NULL,'2020-01-22 20:57:42.860','2020-01-22 20:59:07.232'),('10045','10036','10036',NULL,'outcome','string',1,NULL,NULL,NULL,'通过',NULL,'2020-01-22 20:57:42.860','2020-01-22 20:59:07.234'),('5003','5001','5001',NULL,'username','string',0,NULL,NULL,NULL,'lyf',NULL,'2020-01-12 21:04:18.706','2020-01-12 21:04:18.706'),('7502','5001','5001',NULL,'comment','string',1,NULL,NULL,NULL,'不同意，1111111111111111111111',NULL,'2020-01-12 21:55:16.645','2020-01-12 21:56:49.027'),('7503','5001','5001',NULL,'outcome','string',1,NULL,NULL,NULL,'驳回',NULL,'2020-01-12 21:55:16.646','2020-01-12 21:56:49.028');
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
INSERT INTO `act_re_deployment` VALUES ('1',NULL,NULL,NULL,'','2020-01-12 09:42:36.980',NULL),('10004','补贴申请',NULL,NULL,'','2020-01-22 12:41:42.605',NULL),('10018','补贴申请',NULL,NULL,'','2020-01-22 12:52:17.150',NULL),('10032','补贴申请',NULL,NULL,'','2020-01-22 12:56:29.375',NULL),('2501',NULL,NULL,NULL,'','2020-01-12 11:20:54.118',NULL);
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
INSERT INTO `act_re_model` VALUES ('10001',7,'补贴申请','allowance',NULL,'2020-01-22 12:13:21.929','2020-01-22 12:56:18.363',1,'{\"name\":\"补贴申请\",\"revision\":1,\"description\":\"补贴申请\"}',NULL,'10002','10003','');
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
INSERT INTO `act_re_procdef` VALUES ('allowance:1:4',1,'http://www.activiti.org/test','补贴申请','allowance',1,'1','d:/upload//processDefiniton/2020/01/12/a933937eab428d5c21c7f14bb6ce0ef6.bpmn','d:/upload//processDefiniton/2020/01/12/a933937eab428d5c21c7f14bb6ce0ef6.allowance.png',NULL,0,1,1,'',NULL),('allowance:2:2504',1,'http://www.activiti.org/test','补贴申请','allowance',2,'2501','d:/upload//processDefiniton/2020/01/12/f889091233f599a141f845b41642e9fc.bpmn','d:/upload//processDefiniton/2020/01/12/f889091233f599a141f845b41642e9fc.allowance.png',NULL,0,1,1,'',NULL),('allowance:3:10007',1,'http://www.activiti.org/processdef','补贴申请','allowance',3,'10004','补贴申请.bpmn20.xml','补贴申请.allowance.png','补贴申请',0,1,1,'',NULL),('allowance:4:10021',1,'http://www.activiti.org/processdef','补贴申请','allowance',4,'10018','补贴申请.bpmn20.xml','补贴申请.allowance.png','补贴申请',0,1,1,'',NULL),('allowance:5:10035',1,'http://www.activiti.org/processdef','补贴申请','allowance',5,'10032','补贴申请.bpmn20.xml','补贴申请.allowance.png','补贴申请',0,1,1,'',NULL);
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
INSERT INTO `act_ru_execution` VALUES ('10008',1,'10008','3',NULL,'allowance:3:10007',NULL,'10008',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-22 20:44:08.241','lyf',NULL,0,0,0,0,0,0,0,0,0),('10011',1,'10008',NULL,'10008','allowance:3:10007',NULL,'10008','selfVerify',1,0,0,0,0,1,NULL,'',NULL,'2020-01-22 20:44:08.248',NULL,NULL,0,0,0,0,0,0,0,0,0),('10022',1,'10022','4',NULL,'allowance:4:10021',NULL,'10022',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-22 20:53:40.368','lyf',NULL,0,0,0,0,0,0,0,0,0),('10025',1,'10022',NULL,'10022','allowance:4:10021',NULL,'10022','selfVerify',1,0,0,0,0,1,NULL,'',NULL,'2020-01-22 20:53:40.368',NULL,NULL,0,0,0,0,0,0,0,0,0),('5001',1,'5001','1',NULL,'allowance:2:2504',NULL,'5001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-12 21:04:18.698','lyf',NULL,0,0,0,0,0,0,0,0,0),('5004',3,'5001',NULL,'5001','allowance:2:2504',NULL,'5001','selfVerify',1,0,0,0,0,1,NULL,'',NULL,'2020-01-12 21:04:18.707',NULL,NULL,0,0,0,0,0,0,0,0,0);
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
INSERT INTO `act_ru_identitylink` VALUES ('10009',1,NULL,'starter','lyf',NULL,'10008',NULL),('10023',1,NULL,'starter','lyf',NULL,'10022',NULL),('5002',1,NULL,'starter','lyf',NULL,'5001',NULL),('7506',1,NULL,'participant','yangzc',NULL,'5001',NULL);
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
INSERT INTO `act_ru_task` VALUES ('10014',1,'10011','10008','allowance:3:10007','申请人办理',NULL,'申请人办理','selfVerify',NULL,'lyf',NULL,50,'2020-01-22 12:44:08.264',NULL,NULL,1,'',NULL,NULL),('10028',1,'10025','10022','allowance:4:10021','申请人办理',NULL,'申请人办理','selfVerify',NULL,'lyf',NULL,50,'2020-01-22 12:53:40.369',NULL,NULL,1,'',NULL,NULL),('7510',1,'5004','5001','allowance:2:2504','申请人办理',NULL,NULL,'selfVerify',NULL,'lyf',NULL,50,'2020-01-12 13:56:49.031',NULL,NULL,1,'',NULL,NULL);
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
INSERT INTO `act_ru_variable` VALUES ('10010',1,'string','username','10008','10008',NULL,NULL,NULL,NULL,'lyf',NULL),('10024',1,'string','username','10022','10022',NULL,NULL,NULL,NULL,'lyf',NULL),('5003',1,'string','username','5001','5001',NULL,NULL,NULL,NULL,'lyf',NULL),('7502',2,'string','comment','5001','5001',NULL,NULL,NULL,NULL,'不同意，1111111111111111111111',NULL),('7503',2,'string','outcome','5001','5001',NULL,NULL,NULL,NULL,'驳回',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_allowance`
--

LOCK TABLES `biz_allowance` WRITE;
/*!40000 ALTER TABLE `biz_allowance` DISABLE KEYS */;
INSERT INTO `biz_allowance` VALUES (1,'申请奖学金1111111111111','测试数据，1111111111111',2000,'5001','lyf','2020-01-12 20:35:50','lyf',NULL,'lyf','2020-01-12 21:04:18'),(2,'申请交通补贴2222222222','测试数据',300,NULL,'lyf','2020-01-12 20:54:45',NULL,NULL,NULL,NULL),(3,'申请活动经费33333','测试数据，~~~',360,'10008','lyf','2020-01-22 20:43:59','lyf',NULL,'lyf','2020-01-22 20:44:08'),(4,'申请话费补贴44444','测试，44444',120,'10022','lyf','2020-01-22 20:53:33','lyf',NULL,'lyf','2020-01-22 20:53:40'),(5,'申请住宿补贴55555','测试，55555',2300,'10036','lyf','2020-01-22 20:57:17','lyf',NULL,'lyf','2020-01-22 20:57:23');
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
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_student`
--

LOCK TABLES `stu_student` WRITE;
/*!40000 ALTER TABLE `stu_student` DISABLE KEYS */;
INSERT INTO `stu_student` VALUES (1013,'刘亦菲','女','1989-10-28','17721038951','upload/a8e6c5830753402f81dbf69b990be323.jpg'),(1017,'赵六','女','1999-01-01','17721038952','upload/11fe2afce22a46b5bf069f85b0cf52a9.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (7,1,'admin','登录',0,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:42:03'),(8,1,'admin','登录',15,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:47:04'),(9,1,'admin','登录',0,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:53:27'),(10,1,'admin','登录',16,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:54:17'),(11,1,'admin','登录',31,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()',NULL,'127.0.0.1','2020-01-05 21:56:26'),(12,1,'admin','登录',156,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8435\",null]','127.0.0.1','2020-01-05 22:03:41'),(13,1,'admin','登录',4,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8951\",null]','127.0.0.1','2020-01-05 22:18:42'),(14,1,'admin','登录',3388,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"7836\",null]','127.0.0.1','2020-01-06 23:00:30'),(15,1,'admin','登录',3012,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"6737\",null]','127.0.0.1','2020-01-06 23:06:57'),(16,1,'admin','登录',413,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8331\",null]','127.0.0.1','2020-01-07 23:11:19'),(17,1,'admin','登录',309,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"5453\",null]','127.0.0.1','2020-01-08 23:42:23'),(18,1,'admin','登录',174,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"9926\",null]','127.0.0.1','2020-01-12 12:35:00'),(19,1,'admin','登录',2,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"9426\",null]','127.0.0.1','2020-01-12 12:35:51'),(20,1,'admin','登录',72,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"9574\",null]','127.0.0.1','2020-01-12 16:32:23'),(21,1,'admin','登录',18,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"2331\",null]','127.0.0.1','2020-01-12 17:02:57'),(22,1,'admin','流程定义导入',82,'com.yangzc.studentboot.workflow.definition.controller.ProcessDefinitionController.upload()','[null]','127.0.0.1','2020-01-12 17:37:16'),(23,1,'admin','流程定义导入',26940,'com.yangzc.studentboot.workflow.definition.controller.ProcessDefinitionController.upload()','[null]','127.0.0.1','2020-01-12 17:42:38'),(24,1,'admin','登录',20,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"2179\",null]','127.0.0.1','2020-01-12 17:50:59'),(25,1,'admin','登录',24,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8753\",null]','127.0.0.1','2020-01-12 19:20:43'),(26,1,'admin','流程定义导入',370,'com.yangzc.studentboot.workflow.definition.controller.ProcessDefinitionController.upload()','[null]','127.0.0.1','2020-01-12 19:20:54'),(27,1,'admin','登录',61,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"1145\",null]','127.0.0.1','2020-01-12 20:16:54'),(28,1,'admin','登录',28,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"1497\",null]','127.0.0.1','2020-01-12 20:22:12'),(29,1,'admin','登录',14,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"5926\",null]','127.0.0.1','2020-01-12 20:27:22'),(30,-1,'[\"admin\",\"111111\",\"5751\",null]','登录',0,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"5751\",null]','127.0.0.1','2020-01-12 20:27:31'),(31,-1,'[\"admin\",\"111111\",\"5751\",null]','登录',1,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"5751\",null]','127.0.0.1','2020-01-12 20:27:34'),(32,-1,'[\"admin\",\"111111\",\"7998\",null]','登录',1,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"7998\",null]','127.0.0.1','2020-01-12 20:27:43'),(33,1,'admin','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"0059\",null]','127.0.0.1','2020-01-12 20:28:06'),(34,-1,'[\"lyf\",\"123456\",\"2116\",null]','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"123456\",\"2116\",null]','127.0.0.1','2020-01-12 20:29:10'),(35,-1,'[\"lyf\",\"123456\",\"6720\",null]','登录',11,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"123456\",\"6720\",null]','127.0.0.1','2020-01-12 20:29:17'),(36,2,'lyf','登录',9,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"6720\",null]','127.0.0.1','2020-01-12 20:29:25'),(37,2,'lyf','补贴申请',46,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.addSave()','[{\"createBy\":\"刘亦菲\",\"createTime\":1578832549913,\"id\":1,\"params\":{},\"reason\":\"测试数据，1111111111111\",\"title\":\"申请奖学金1111111111111\",\"totalMoney\":2000}]','127.0.0.1','2020-01-12 20:35:50'),(38,-1,'[\"yangzc\",\"111111\",\"6997\",null]','登录',30324,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"6997\",null]','127.0.0.1','2020-01-12 20:51:33'),(39,3,'yangzc','登录',3910,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"6997\",null]','127.0.0.1','2020-01-12 20:52:14'),(40,-1,'[\"yangzc\",\"111111\",\"3444\",null]','登录',4,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"3444\",null]','127.0.0.1','2020-01-12 20:52:57'),(41,3,'yangzc','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"2553\",null]','127.0.0.1','2020-01-12 20:53:02'),(42,-1,'[\"lyf\",\"111111\",\"6366\",null]','登录',1,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"6366\",null]','127.0.0.1','2020-01-12 20:53:44'),(43,2,'lyf','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"8500\",null]','127.0.0.1','2020-01-12 20:53:49'),(44,2,'lyf','补贴申请',7,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.addSave()','[{\"createBy\":\"lyf\",\"createTime\":1578833684729,\"id\":2,\"params\":{},\"reason\":\"测试数据\",\"title\":\"申请交通补贴2222222222\",\"totalMoney\":300}]','127.0.0.1','2020-01-12 20:54:45'),(45,2,'lyf','补贴申请提交',344,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.submitApply()','[1]','127.0.0.1','2020-01-12 21:04:19'),(46,1,'admin','登录',61,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"6404\",null]','127.0.0.1','2020-01-12 21:17:13'),(47,2,'lyf','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"1741\",null]','127.0.0.1','2020-01-12 21:17:43'),(48,1,'admin','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8497\",null]','127.0.0.1','2020-01-12 21:20:17'),(49,1,'admin','登录',12,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8151\",null]','127.0.0.1','2020-01-12 21:27:27'),(50,1,'admin','登录',54,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"2025\",null]','127.0.0.1','2020-01-12 21:38:41'),(51,-1,'[\"lyf\",\"111111\",\"8697\",null]','登录',1,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"8697\",null]','127.0.0.1','2020-01-12 21:39:10'),(52,2,'lyf','登录',4,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"9780\",null]','127.0.0.1','2020-01-12 21:39:15'),(53,3,'yangzc','登录',10,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"4334\",null]','127.0.0.1','2020-01-12 21:56:06'),(54,2,'lyf','登录',5,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"1587\",null]','127.0.0.1','2020-01-12 21:57:32'),(55,1,'admin','登录',5,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"7940\",null]','127.0.0.1','2020-01-12 22:45:11'),(56,1,'admin','登录',113,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"7977\",null]','127.0.0.1','2020-01-22 19:25:00'),(57,1,'admin','登录',10,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8090\",null]','127.0.0.1','2020-01-22 20:12:05'),(58,1,'admin','登录',4,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"admin\",\"111111\",\"8616\",null]','127.0.0.1','2020-01-22 20:12:11'),(59,2,'lyf','登录',7,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"7988\",null]','127.0.0.1','2020-01-22 20:42:30'),(60,2,'lyf','补贴申请',13,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.addSave()','[{\"createBy\":\"lyf\",\"createTime\":1579697038787,\"id\":3,\"params\":{},\"reason\":\"测试数据，~~~\",\"title\":\"申请活动经费33333\",\"totalMoney\":360}]','127.0.0.1','2020-01-22 20:43:59'),(61,2,'lyf','补贴申请提交',277,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.submitApply()','[3]','127.0.0.1','2020-01-22 20:44:09'),(62,2,'lyf','补贴申请',7,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.addSave()','[{\"createBy\":\"lyf\",\"createTime\":1579697613373,\"id\":4,\"params\":{},\"reason\":\"测试，44444\",\"title\":\"申请话费补贴44444\",\"totalMoney\":120}]','127.0.0.1','2020-01-22 20:53:33'),(63,2,'lyf','补贴申请提交',47,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.submitApply()','[4]','127.0.0.1','2020-01-22 20:53:40'),(64,2,'lyf','补贴申请',6,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.addSave()','[{\"createBy\":\"lyf\",\"createTime\":1579697836831,\"id\":5,\"params\":{},\"reason\":\"测试，55555\",\"title\":\"申请住宿补贴55555\",\"totalMoney\":2300}]','127.0.0.1','2020-01-22 20:57:17'),(65,2,'lyf','补贴申请提交',32,'com.yangzc.studentboot.workflow.allowance.controller.BizAllowanceController.submitApply()','[5]','127.0.0.1','2020-01-22 20:57:23'),(66,3,'yangzc','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"yangzc\",\"111111\",\"9388\",null]','127.0.0.1','2020-01-22 20:58:16'),(67,2,'lyf','登录',3,'com.yangzc.studentboot.login.controller.LoginController.ajaxLogin()','[\"lyf\",\"111111\",\"1194\",null]','127.0.0.1','2020-01-22 20:59:45');
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

-- Dump completed on 2020-01-22 21:10:07
