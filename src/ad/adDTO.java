package ad;


public class adDTO {
	private int adnum;
	private String id;
	private int tag;
	private String nm;
	private String tel;
	private String title;
	private String dateS;
	private String dateE;
	private long dateSE;
	private String money;
	private String cont;
	private String img;
	public long getDateSE() {
		return dateSE;
	}
	public void setDateSE(long dateSE) {
		this.dateSE = dateSE;
	}
	private String cy;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public int getTag() {
	return tag;
}
public int getAdnum() {
		return adnum;
	}
	public void setAdnum(int adnum) {
		this.adnum = adnum;
	}
public void setTag(int tag) {
	this.tag = tag;
}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getDateS() {
		return dateS;
	}
	public void setDateS(String dateS) {
		this.dateS = dateS;
	}
	public String getDateE() {
		return dateE;
	}
	public void setDateE(String dateE) {
		this.dateE = dateE;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCy() {
		return cy;
	}
	public void setCy(String cy) {
		this.cy = cy;
	}
}
