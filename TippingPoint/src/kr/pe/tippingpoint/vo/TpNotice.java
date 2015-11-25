package kr.pe.tippingpoint.vo;

public class TpNotice {
	
	private int tpNoticeNum;
	private int tpNoticeDate;
	private String tpNoticeTitle;
	private String tpNoticeContents;
	private String tpNoticeWriter;
	
	public TpNotice(){}

	public TpNotice(int tpNoticeNum, int tpNoticeDate, String tpNoticeTitle, String tpNoticeContents, String tpNoticeWriter) {
		super();
		this.tpNoticeNum = tpNoticeNum;
		this.tpNoticeDate = tpNoticeDate;
		this.tpNoticeTitle = tpNoticeTitle;
		this.tpNoticeContents = tpNoticeContents;
		this.tpNoticeContents = tpNoticeWriter;
	}

	public int getTpNoticeNum() {
		return tpNoticeNum;
	}

	public void setTpNoticeNum(int tpNoticeNum) {
		this.tpNoticeNum = tpNoticeNum;
	}

	public int getTpNoticeDate() {
		return tpNoticeDate;
	}

	public void setTpNoticeDate(int tpNoticeDate) {
		this.tpNoticeDate = tpNoticeDate;
	}

	public String getTpNoticeTitle() {
		return tpNoticeTitle;
	}

	public void setTpNoticeTitle(String tpNoticeTitle) {
		this.tpNoticeTitle = tpNoticeTitle;
	}

	public String getTpNoticeContents() {
		return tpNoticeContents;
	}

	public void setTpNoticeContents(String tpNoticeContents) {
		this.tpNoticeContents = tpNoticeContents;
	}

	public String getTpNoticeWriter() {
		return tpNoticeWriter;
	}

	public void setTpNoticeWriter(String tpNoticeWriter) {
		this.tpNoticeWriter = tpNoticeWriter;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((tpNoticeContents == null) ? 0 : tpNoticeContents.hashCode());
		result = prime * result + tpNoticeDate;
		result = prime * result + tpNoticeNum;
		result = prime * result + ((tpNoticeTitle == null) ? 0 : tpNoticeTitle.hashCode());
		result = prime * result + ((tpNoticeWriter == null) ? 0 : tpNoticeWriter.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TpNotice other = (TpNotice) obj;
		if (tpNoticeContents == null) {
			if (other.tpNoticeContents != null)
				return false;
		} else if (!tpNoticeContents.equals(other.tpNoticeContents))
			return false;
		if (tpNoticeDate != other.tpNoticeDate)
			return false;
		if (tpNoticeNum != other.tpNoticeNum)
			return false;
		if (tpNoticeTitle == null) {
			if (other.tpNoticeTitle != null)
				return false;
		} else if (!tpNoticeTitle.equals(other.tpNoticeTitle))
			return false;
		if (tpNoticeWriter == null) {
			if (other.tpNoticeWriter != null)
				return false;
		} else if (!tpNoticeWriter.equals(other.tpNoticeWriter))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TpNotice [tpNoticeNum=" + tpNoticeNum + ", tpNoticeDate=" + tpNoticeDate + ", tpNoticeTitle="
				+ tpNoticeTitle + ", tpNoticeContents=" + tpNoticeContents + ", tpNoticeWriter=" + tpNoticeWriter + "]";
	}
	
	

}