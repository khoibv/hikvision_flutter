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


//��Ϣ����������
#define SADP_ADD		  1			//����һ�豸
#define SADP_UPDATE		  2			//�����豸
#define SADP_DEC		  3			//�豸����
#define SADP_RESTART	  4			//�豸��������
#define SADP_UPDATEFAIL	  5			//�豸����ʧ��

#define MSG_FIND_DEVICE  9000    // �����豸��Ϣ

// ������
#define SADP_ERROR_BASE					2000
#define SADP_NOERROR 					0					// û�д���
#define SADP_ALLOC_RESOURCE_ERROR		SADP_ERROR_BASE+1   // ��Դ�������
#define SADP_NOT_START_ERROR			SADP_ERROR_BASE+2   // SADPδ����
#define SADP_NO_ADAPTER_ERROR			SADP_ERROR_BASE+3   // ������
#define SADP_GET_ADAPTER_FAIL_ERROR		SADP_ERROR_BASE+4   // ��ȡ������Ϣʧ��
#define SADP_PARAMETER_ERROR			SADP_ERROR_BASE+5   // ��������
#define SADP_OPEN_ADAPTER_FAIL_ERROR	SADP_ERROR_BASE+6   // ������ʧ��
#define SADP_SEND_PACKET_FAIL_ERROR		SADP_ERROR_BASE+7   // ��������ʧ��
#define SADP_SYSTEM_CALL_ERROR			SADP_ERROR_BASE+8   // ϵͳ�ӿڵ���ʧ��
#define SADP_DENY_OR_TIMEOUT_ERROR		SADP_ERROR_BASE+9   // �豸�ܾ������ʱ
#define SADP_NPF_INSTALL_FAILED			SADP_ERROR_BASE+10  // ��װNPF����ʧ��


// �ṹ��
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
	char			szDevDesc[24];       //�豸��������
	char			szOEMinfo[24];       //OEM������Ϣ
	char			szIPv4Gateway[16];   //IPv4����
	char			szIPv6Address[46];	 //IPv6��ַ
	char			szIPv6Gateway[46];   //IPv6����
	unsigned char   byIPv6MaskLen;       //IPv6����ǰ׺����
	unsigned char   bySupport;           //��λ��ʾ,��ӦΪΪ1��ʾ֧��,0x01:�Ƿ�֧��Ipv6,0x02:�Ƿ�֧���޸�Ipv6����,0x04:�Ƿ�֧��Dhcp				 
	unsigned char   byDhcpEnabled;       //Dhcp״̬, 0 ������ 1 ����
	unsigned char   byDeviceAbility;	//0���豸��֧�֡����豸���������� 'OEM����' 'IPv4����' ��IPv6��ַ�� 'IPv6����' ��IPv6����ǰ׺����DHCP����  1��֧�����߹���
	unsigned char   byRes1[64];          //����
}SADP_DEVICE_INFO, *LPSADP_DEVICE_INFO;

//���޸ĵ��豸�������
typedef struct tagSADP_DEV_NET_PARAM
{
	char			szIPv4Address[16];		// IPv4��ַ
	char			szIPv4SubNetMask[16];	// IPv4��������
	char			szIPv4Gateway[16];		// IPv4����
	char			szIPv6Address[128];		// IPv6��ַ
	char			szIPv6Gateway[128];		// IPv6����
	unsigned short	wPort;					// �豸�����˿�
	unsigned char	byIPv6MaskLen;			// IPv6���볤��
	unsigned char	byDhcpEnable;			// DHCPʹ��
	unsigned char	byRes[128];
}SADP_DEV_NET_PARAM, *LPSADP_DEV_NET_PARAM;


// CMS����
typedef struct tagSADP_CMS_PARAM
{
	char			szPUID[32];			// Ԥ�����PUID
	char			szPassword[16];		// ���õĵ�¼����
	char			szCmsIPv4[16];		// CMS������IPv4��ַ
	char			szCmsIPv6[128];		// CMS������IPv6��ַ
	unsigned short	wCmsPort;			// CMS�����������˿�
	unsigned char	byRes[30];
}SADP_CMS_PARAM, *LPSADP_CMS_PARAM;




// �ӿ�
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




