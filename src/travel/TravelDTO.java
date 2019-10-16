package travel;

public class TravelDTO {

	private String tb_title, editordata, id, ip;
	private String tb_dt_s, tb_dt_e, tb_img, tb_dt;

	public String getTb_dt() {
		return tb_dt;
	}

	public void setTb_dt(String tb_dt) {
		this.tb_dt = tb_dt;
	}

	private int tb_num, tb_readct;

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getTb_img() {
		return tb_img;
	}

	public void setTb_img(String tb_img) {
		this.tb_img = tb_img;
	}

	public String getTb_title() {
		return tb_title;
	}

	public String getTb_dt_e() {
		return tb_dt_e;
	}

	public void setTb_dt_e(String tb_dt_e) {
		this.tb_dt_e = tb_dt_e;
	}

	public String getTb_dt_s() {
		return tb_dt_s;
	}

	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	}

	public String getId() {
		return id;
	}

	public String getEditordata() {
		return editordata;
	}

	public void setEditordata(String editordata) {
		this.editordata = editordata;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setTb_dt_s(String string) {
		this.tb_dt_s = string;
	}

	public int getTb_num() {
		return tb_num;
	}

	public void setTb_num(int tb_num) {
		this.tb_num = tb_num;
	}

	public int getTb_readct() {
		return tb_readct;
	}

	public void setTb_readct(int tb_readct) {
		this.tb_readct = tb_readct;
	}

}
