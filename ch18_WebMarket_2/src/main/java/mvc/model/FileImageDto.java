package mvc.model;

public class FileImageDto {
	private int Fnum;
	private String filename;
	private String regist_day;
	
	public int getFnum() {
		return Fnum;
	}
	public void setFnum(int fnum) {
		Fnum = fnum;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	private int num;
}
