#ifndef _SADP_H_
#define _SADP_H_


#if defined _WIN32 || defined _WIN64
#define CSADP_API  extern "C"__declspec(dllimport)
#elif defined __linux__ || defined __APPLE__
#define CSADP_API  extern "C"
#endif

#if defined _WIN32 || defined _WIN64
#define CALLBACK __stdcall
#elif defined __linux__ || defined __APPLE__
#define CALLBACK  
#endif


//消息操作的类型
#define SADP_ADD		  1			//增加一设备
#define SADP_UPDATE		  2			//更新设备
#define SADP_DEC		  3			//设备下线
#define SADP_RESTART	  4			//设备重新启动
#define SADP_UPDATEFAIL	  5			//设备更新失败

#define MSG_FIND_DEVICE  9000    // 发现设备消息

// 错误码
#define SADP_ERROR_BASE					2000
#define SADP_NOERROR 					0					// 没有错误
#define SADP_ALLOC_RESOURCE_ERROR		SADP_ERROR_BASE+1   // 资源分配错误
#define SADP_NOT_START_ERROR			SADP_ERROR_BASE+2   // SADP未启动
#define SADP_NO_ADAPTER_ERROR			SADP_ERROR_BASE+3   // 无网卡
#define SADP_GET_ADAPTER_FAIL_ERROR		SADP_ERROR_BASE+4   // 获取网卡信息失败
#define SADP_PARAMETER_ERROR			SADP_ERROR_BASE+5   // 参数错误
#define SADP_OPEN_ADAPTER_FAIL_ERROR	SADP_ERROR_BASE+6   // 打开网卡失败
#define SADP_SEND_PACKET_FAIL_ERROR		SADP_ERROR_BASE+7   // 发送数据失败
#define SADP_SYSTEM_CALL_ERROR			SADP_ERROR_BASE+8   // 系统接口调用失败
#define SADP_DENY_OR_TIMEOUT_ERROR		SADP_ERROR_BASE+9   // 设备拒绝处理或超时
#define SADP_NPF_INSTALL_FAILED			SADP_ERROR_BASE+10  // 安装NPF服务失败


// 结构体
typedef struct tagSADP_DEVICE_INFO
{
	char			szSeries[12];
	char			szSerialNO[48];
	char			szMAC[20];
	char			szIPv4Address[16];
	char			szIPv4SubnetMask[16];
	unsigned int	dwDeviceType;
	unsigned int	dwPort;
	unsigned int	dwNumberOfEncoders; 
	unsigned int	dwNumberOfHardDisk;
	char			szDeviceSoftwareVersion[48];
	char			szDSPVersion[48]; 
	char			szBootTime[48];
	int				iResult;
	char			szDevDesc[24];       //设备类型描述
	char			szOEMinfo[24];       //OEM产商信息
	char			szIPv4Gateway[16];   //IPv4网关
	char			szIPv6Address[46];	 //IPv6地址
	char			szIPv6Gateway[46];   //IPv6网关
	unsigned char   byIPv6MaskLen;       //IPv6子网前缀长度
	unsigned char   bySupport;           //按位表示,对应为为1表示支持,0x01:是否支持Ipv6,0x02:是否支持修改Ipv6参数,0x04:是否支持Dhcp				 
	unsigned char   byDhcpEnabled;       //Dhcp状态, 0 不启用 1 启用
	unsigned char   byDeviceAbility;	//0：设备不支持“‘设备类型描述’ 'OEM厂商' 'IPv4网关' ‘IPv6地址’ 'IPv6网关' ‘IPv6子网前缀’‘DHCP’”  1：支持上诉功能
	unsigned char   byRes1[64];          //保留
}SADP_DEVICE_INFO, *LPSADP_DEVICE_INFO;

//待修改的设备网络参数
typedef struct tagSADP_DEV_NET_PARAM
{
	char			szIPv4Address[16];		// IPv4地址
	char			szIPv4SubNetMask[16];	// IPv4子网掩码
	char			szIPv4Gateway[16];		// IPv4网关
	char			szIPv6Address[128];		// IPv6地址
	char			szIPv6Gateway[128];		// IPv6网关
	unsigned short	wPort;					// 设备监听端口
	unsigned char	byIPv6MaskLen;			// IPv6掩码长度
	unsigned char	byDhcpEnable;			// DHCP使能
	unsigned char	byRes[128];
}SADP_DEV_NET_PARAM, *LPSADP_DEV_NET_PARAM;


// CMS参数
typedef struct tagSADP_CMS_PARAM
{
	char			szPUID[32];			// 预分配的PUID
	char			szPassword[16];		// 设置的登录密码
	char			szCmsIPv4[16];		// CMS服务器IPv4地址
	char			szCmsIPv6[128];		// CMS服务器IPv6地址
	unsigned short	wCmsPort;			// CMS服务器监听端口
	unsigned char	byRes[30];
}SADP_CMS_PARAM, *LPSADP_CMS_PARAM;




// 接口
typedef void (CALLBACK *PDEVICE_FIND_CALLBACK)(const SADP_DEVICE_INFO *lpDeviceInfo, void *pUserData);
CSADP_API int CALLBACK SADP_Start_V30(PDEVICE_FIND_CALLBACK pDeviceFindCallBack, int bInstallNPF = 1, void* pUserData = NULL);
CSADP_API int  CALLBACK SADP_SendInquiry(void);
CSADP_API int  CALLBACK SADP_Stop(void);
CSADP_API int CALLBACK SADP_ModifyDeviceNetParam(const char* sMAC, const char* sPassword, const SADP_DEV_NET_PARAM *lpNetParam);
CSADP_API unsigned int CALLBACK SADP_GetSadpVersion(void);
CSADP_API int CALLBACK SADP_SetLogToFile(int nLogLevel=0, char const *strLogDir = NULL, int bAutoDel = 1);		
CSADP_API unsigned int CALLBACK SADP_GetLastError(void);
CSADP_API int CALLBACK SADP_ResetDefaultPasswd(const char* sDevSerialNO, const char* sCommand);
CSADP_API int CALLBACK SADP_SetCMSInfo(const char* sMac, const SADP_CMS_PARAM *lpCmsParam);


#endif




