Attribute VB_Name = "mExe"
Option Explicit

'Icon offsets
Public Const POS_ICON_32 As Long = 88349 'Offset von "( 0x00 0x00 ... 0xB8 0xB8 0xB8 ..."  (evtl. +1)
Public Const POS_ICON_16 As Long = 90565 'Offset von "( 0x00 0x00 ... 0x28 0x28 0x28 ..."  (evtl. +1)

'Buffer contents
Public Const POS_JAR_NAME As Integer = 0
Public Const LEN_JAR_NAME As Integer = 100

Public Const POS_JAVA_EXE As Integer = POS_JAR_NAME + LEN_JAR_NAME
Public Const LEN_JAVA_EXE As Integer = 1000

Public Const POS_JRE_REQUIRED As Integer = POS_JAVA_EXE + LEN_JAVA_EXE
Public Const LEN_JRE_REQUIRED As Integer = 100

Public Const POS_OPTIONS As Integer = POS_JRE_REQUIRED + LEN_JRE_REQUIRED
Public Const LEN_OPTIONS As Integer = 3000

Public Const POS_ARGUMENTS As Integer = POS_OPTIONS + LEN_OPTIONS
Public Const LEN_ARGUMENTS As Integer = 2000

Public Const POS_ERR_JRE_NOT_FOUND As Integer = POS_ARGUMENTS + LEN_ARGUMENTS
Public Const LEN_ERR_JRE_NOT_FOUND As Integer = 500

Public Const POS_ERR_JRE_WRONG_VERSION As Integer = POS_ERR_JRE_NOT_FOUND + LEN_ERR_JRE_NOT_FOUND
Public Const LEN_ERR_JRE_WRONG_VERSION As Integer = 500

Public Const POS_ERR_JRE_ERROR As Integer = POS_ERR_JRE_WRONG_VERSION + LEN_ERR_JRE_WRONG_VERSION
Public Const LEN_ERR_JRE_ERROR As Integer = 500

Public Const POS_ERR_JAR_PACKED_ERROR As Integer = POS_ERR_JRE_ERROR + LEN_ERR_JRE_ERROR
Public Const LEN_ERR_JAR_PACKED_ERROR As Integer = 500

'Not used at the moment:
Public Const POS_ERR_JAR_NOT_FOUND As Integer = POS_ERR_JAR_PACKED_ERROR + LEN_ERR_JAR_PACKED_ERROR
Public Const LEN_ERR_JAR_NOT_FOUND As Integer = 500

Public Const POS_JAR_PACKED_NAME As Integer = POS_ERR_JAR_NOT_FOUND + LEN_ERR_JAR_NOT_FOUND
Public Const LEN_JAR_PACKED_NAME As Integer = 100


'Flags
Public Const POS_FLAGS As Integer = 9900
Public Const FLAG_START_WITHOUT_REGISTRY As Integer = 0
Public Const FLAG_START_DESPITE_REGISTRY_ERROR As Integer = 1
Public Const FLAG_JRE_REQUIRED_OR_HIGHER As Integer = 2
Public Const FLAG_JAR_PACKED As Integer = 3
Public Const FLAG_JAR_DELETE_AT_END As Integer = 4

