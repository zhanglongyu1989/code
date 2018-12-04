package com.zs.pms.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * ���ڹ����� final���� ��ʾ���಻�ɱ��̳�
 * 
 * @author gavin
 * 
 */
public final class DateUtil {

	/**
	 * �������ڻ���ַ���:����--->�ַ���
	 * 
	 * @param date
	 * @return XXXX��XX��XX��
	 */
	public static String getStrDate(Date date) {
		// ������һ�����ڶ���
		Calendar calendar = Calendar.getInstance();

		// ���ô��������
		calendar.setTime(date);

		// �����
		int y = calendar.get(Calendar.YEAR);
		// �����
		int m = calendar.get(Calendar.MONTH) + 1;

		// �������
		int d = calendar.get(Calendar.DAY_OF_MONTH);

		return y + "��" + m + "��" + d + "��";
	}

	/**
	 * �������ڻ���ַ���: ����ʱ��--->�ַ���
	 * 
	 * @param date
	 * @return XXXX��XX��XX�� xx:xx:xx
	 */
	public static String getStrDateTime(Date date) {
		// ������һ�����ڶ���
		Calendar calendar = Calendar.getInstance();

		// ���ô��������
		calendar.setTime(date);

		// �����
		int y = calendar.get(Calendar.YEAR);
		// �����
		int m = calendar.get(Calendar.MONTH) + 1;

		// �������
		int d = calendar.get(Calendar.DAY_OF_MONTH);

		// ���Сʱ
		int h = calendar.get(Calendar.HOUR_OF_DAY);
		// ��÷���
		int mm = calendar.get(Calendar.MINUTE);

		// �����
		int s = calendar.get(Calendar.SECOND);

		return y + "��" + m + "��" + d + "��" + " " + h + ":" + mm + ":" + s;
	}

	/**
	 * �����ַ���������ڣ��ַ���-->����
	 * 
	 * @param date
	 * @param format
	 *            : yyyy-MM-dd yyyy-MM-dd HH:mm:ss
	 * @return
	 * @throws ParseException
	 */
	public static Date getDateStr(String date, String format) {
		// ����һ�����ڸ�ʽ����
		DateFormat df = new SimpleDateFormat(format);

		Date date2 = null;
		try {
			date2 = df.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return date2;

	}

	public static void main(String[] args) {

		System.out.println(getStrDateTime(getDateStr("2013-12-23 12:12:12",
				"yyyy-MM-dd HH:mm:ss")));

	}

}
