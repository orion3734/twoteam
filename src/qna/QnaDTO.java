package qna;

import java.util.Date;

public class QnaDTO {
	private int qa_num;
	private String qa_type;
	private String qa_title;
	private String qa_cont;
	private Date qa_date;
	private int qa_ref;
	private int qa_reLevel;
	private int qa_reStep;


	private String id;

	public QnaDTO() {
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQa_num() {
		return qa_num;
	}

	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}

	public String getQa_type() {
		return qa_type;
	}

	public void setQa_type(String qa_type) {
		this.qa_type = qa_type;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_cont() {
		return qa_cont;
	}

	public void setQa_cont(String qa_cont) {
		this.qa_cont = qa_cont;
	}

	public Date getQa_date() {
		return qa_date;
	}

	public void setQa_date(Date qa_date) {
		this.qa_date = qa_date;
	}

	public int getQa_reLevel() {
		return qa_reLevel;
	}

	public void setQa_reLevel(int qa_reLevel) {
		this.qa_reLevel = qa_reLevel;
	}
	
	public int getQa_reStep() {
		return qa_reStep;
	}

	public void setQa_reStep(int qa_reStep) {
		this.qa_reStep = qa_reStep;
	}
	public int getQa_ref() {
		return qa_ref;
	}

	public void setQa_ref(int qa_ref) {
		this.qa_ref = qa_ref;
	}
}//end class a