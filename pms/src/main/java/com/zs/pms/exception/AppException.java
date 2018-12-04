package com.zs.pms.exception;

public class AppException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7943598268417838074L;

	// �쳣��
	private int errCode;
	// �쳣��Ϣ
	private String errMsg;

	public int getErrCode() {
		return errCode;
	}

	public void setErrCode(int errCode) {
		this.errCode = errCode;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	// �����вι��캯���������쳣��Ϣ
	public AppException(int errCode, String errMsg) {
		this.errCode = errCode;
		this.errMsg = errMsg;
	}
}
